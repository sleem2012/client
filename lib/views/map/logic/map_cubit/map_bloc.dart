import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_client/packages/shared/error/failures.dart';
import 'package:forall_client/packages/shared/picker/loacation/location_serv.dart';
import 'map_state.dart';
import '../map_error/exceptions.dart';
import '../map_repo/map_repo.dart';
import '../model/destination_model.dart';
import '../model/model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBloc extends Cubit<MapState> {
  MapBloc() : super(const MapState.initial());

  MapRepo mapRepo = MapRepo();

  static MapBloc of(context) => BlocProvider.of(context);

  Position? currentPosition;

  double? height = Get.height / 3;

  double? opacity = 1;

  List<Marker> markers = [];
  Set<Polyline> polylinePoints = {};
  String? detailedAddress;
  String? destinationDetailedAddress;

  String? darkMapStyle;
  String? lightMapStyle;
  LatLng? selectedPositionLatLang;
  LatLng? selectedDestinationPositionLatLang;
  String? price;
  String? note;
  bool isCompleted = false;
  List<DestinationModel> destinations = [];
  List<DestinationModel> allLocations = [];

  setDestinationsList() {
    DestinationModel model = DestinationModel(
      address: destinationDetailedAddress,
      lat: selectedDestinationPositionLatLang?.latitude ?? 0,
      long: selectedDestinationPositionLatLang?.longitude ?? 0,
    );

    destinations.add(model);
    // debugPrint(
    //     '==========================>>>>>>>>${destinations.first.address}');
    _update;
  }

  deleteFromDestinations(DestinationModel model) {
    destinations.remove(model);
    if (destinations.isEmpty) {
      goToMyCurrentLocation();
      allLocations.clear();
      markers.clear();
      polylinePoints.clear();
      selectedDestinationPositionLatLang = null;
      detailedAddress = null;
      destinationDetailedAddress = null;
      selectedPositionLatLang = null;
    }
    _update;
  }

  erase() {
    destinations.clear();
    allLocations.clear();
    markers.clear();
    polylinePoints.clear();
    selectedDestinationPositionLatLang = null;
    detailedAddress = null;
    destinationDetailedAddress = null;
    selectedPositionLatLang = null;
  }

  collectData() {
    DestinationModel model = DestinationModel(
        address: detailedAddress,
        lat: selectedPositionLatLang?.latitude ?? currentPosition?.latitude ?? 0,
        long: selectedPositionLatLang?.longitude ?? currentPosition?.longitude ?? 0);

    if (!allLocations.contains(model)) {
      allLocations.addAll(destinations);
      allLocations.insert(0, model);
    }

    debugPrint(destinations.length.toString());
  }

  changeCompleted() {
    isCompleted = !isCompleted;
    _update;
  }

  setPrice(String val) {
    price = val;
    _update;
  }

  setNote(String val) {
    note = val;
    _update;
  }

  setSelectedPosition(LatLng value) {
    selectedPositionLatLang = value;
  }

  Future setSelectedDestinationPosition(LatLng value) async {
    selectedDestinationPositionLatLang = value;
    await getDirections(selectedPositionLatLang ?? LatLng(currentPosition!.latitude, currentPosition!.longitude), selectedDestinationPositionLatLang!);
    collectData();
    addMarkers();
  }

  addMarkers() {
    List<String> upper = List.generate(26, (index) => String.fromCharCode(index + 65));
    for (int i = 0; i < destinations.length; i++) {
      final x = Marker(
        markerId: MarkerId(upper[i]),
        position: LatLng(destinations[i].lat ?? 0, destinations[i].long ?? 0),
        infoWindow: InfoWindow(title: upper[i]),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        visible: true,
      );
      markers.add(x);
    }

    _update;
  }

  get _update {
    emit(const MapState.loading());
    emit(const MapState.initial());
  }

  controlWhenMove({LatLng? target}) {
    if (target != null) {
      if (selectedDestinationPositionLatLang == null) {
        selectedPositionLatLang = target;
      }
    }
    if (height == 0) return;
    height = 0;
    opacity = 0;
    debugPrint('moving');
    emit(MapState.onCameraMove(height: height));
  }

  controlWhenStop() {
    if (selectedPositionLatLang != null) {
      if (selectedDestinationPositionLatLang == null) {
        getDetailedAddress(selectedPositionLatLang!);
      }
    }
    if (height == Get.height / 2.5) return;
    opacity = 1;
    height = Get.height / 2.5;
    emit(MapState.onCameraMove(height: height));
  }

  Future<void> updateCameraLocation(LatLng source, LatLng destination, GoogleMapController mapController) async {
    LatLngBounds bounds;

    if (source.latitude > destination.latitude && source.longitude > destination.longitude) {
      bounds = LatLngBounds(southwest: destination, northeast: source);
    } else if (source.longitude > destination.longitude) {
      bounds = LatLngBounds(southwest: LatLng(source.latitude, destination.longitude), northeast: LatLng(destination.latitude, source.longitude));
    } else if (source.latitude > destination.latitude) {
      bounds = LatLngBounds(southwest: LatLng(destination.latitude, source.longitude), northeast: LatLng(source.latitude, destination.longitude));
    } else {
      bounds = LatLngBounds(southwest: source, northeast: destination);
    }

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 100);

    return checkCameraLocation(cameraUpdate, mapController);
  }

  Future<void> checkCameraLocation(CameraUpdate cameraUpdate, GoogleMapController mapController) async {
    mapController.animateCamera(cameraUpdate);
    LatLngBounds l1 = await mapController.getVisibleRegion();
    LatLngBounds l2 = await mapController.getVisibleRegion();

    if (l1.southwest.latitude == -70 || l2.southwest.latitude == -70) {
      return checkCameraLocation(cameraUpdate, mapController);
    }
    _update;
  }

  CameraPosition cameraPosition() {
    final CameraPosition myCurrentLocationCameraPosition = CameraPosition(
      target: LatLng(
        currentPosition?.latitude ?? 0,
        currentPosition?.longitude ?? 0,
      ),
      zoom: 17,
    );
    return myCurrentLocationCameraPosition;
  }

  Completer<GoogleMapController> mapController = Completer();

  Future<void> getCurrentPosition() async {
    try {
      final result = await KLocationService.call();
      result.fold(
        (l) => emit(MapState.error(error: KFailure.toError(l))),
        (r) {
          currentPosition = r;
          emit(const MapState.success());
        },
      );
      getDetailedAddress(LatLng(currentPosition!.latitude, currentPosition!.longitude));
    } on KExceptionLocationDenaid {
      emit(const MapState.error(error: 'Location Denied'));
    } on KExceptionLocationDenaidPermenetl {
      emit(const MapState.error(error: 'Location Denied Permanently'));
    } on KExceptionLocationDiabled {
      emit(const MapState.error(error: 'location Disabled'));
    } on KExceptionOffline {
      emit(const MapState.error(error: 'No Connection'));
    } catch (e) {
      if (kDebugMode) {
        print('Error ================getDirections');

        rethrow;
      }

      emit(const MapState.error(error: 'Something went wrong'));
    }
  }

  Future<void> goToMyCurrentLocation() async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition()));
  }

  Future<void> goToSelectedPlace(double? selectedLat, double? selectedLng) async {
    final GoogleMapController controller = await mapController.future;
    final CameraPosition myCurrentLocationCameraPosition = CameraPosition(
      target: LatLng(selectedLat ?? 0, selectedLng ?? 0),
      zoom: 17,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(myCurrentLocationCameraPosition));
  }

  getDetailedAddress(LatLng location) async {
    emit(const MapState.loading());
    try {
      detailedAddress = await mapRepo.getDetailedAddress(location);
      emit(const MapState.success());
    } catch (e) {
      emit(const MapState.error(error: 'Something went wrong'));
    }
  }

  getDestinationDetailedAddress(LatLng location) async {
    emit(const MapState.loading());
    try {
      destinationDetailedAddress = await mapRepo.getDetailedAddress(location);
      setDestinationsList();
      emit(const MapState.success());
    } catch (e) {
      emit(const MapState.error(error: 'Something went wrong'));
    }
  }

  getDirectionFromMyLocation({required LatLng destinations}) async {
    await getCurrentPosition();
    await getDirections(destinations, (LatLng(currentPosition?.latitude ?? 0.0, currentPosition?.longitude ?? 0.0)));
  }

  getDirections(LatLng origin, LatLng destination) async {
    emit(const MapState.loading());
    try {
      WayPointPolylineModel? wayPointPolylineModel = await mapRepo.getDirections(origin, destination);
      if (wayPointPolylineModel != null) {
        polylinePoints.add(
          Polyline(polylineId: PolylineId(origin.latitude.toString()), points: wayPointPolylineModel.polylinePoints, color: Colors.blue, width: 5),
        );
        final GoogleMapController controller = await mapController.future;
        updateCameraLocation(origin, destination, controller);
        emit(const MapState.success());
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error ================${e.toString()}================');
      }
      emit(const MapState.error());
      rethrow;
    }
  }

  Future loadMapStyles(context) async {
    darkMapStyle = await rootBundle.loadString('assets/map_dark_theme.json');
    lightMapStyle = await rootBundle.loadString('assets/map_light_theme.json');
    setMapStyle(context);
  }

  Future setMapStyle(context) async {
    final controller = await mapController.future;
    if (Theme.of(context!).brightness == Brightness.light) {
      controller.setMapStyle(lightMapStyle);
      _update;
    } else {
      controller.setMapStyle(darkMapStyle);
      _update;
    }
  }
}
