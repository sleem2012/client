import 'package:flutter/material.dart';
import '../../../shared/theme/colors.dart';
import '../logic/map_cubit/map_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, required this.onCameraMove, required this.onCameraIdle, required this.opacity, required this.onTapLocation})
      : super(key: key);
  final void Function(CameraPosition cameraPosition) onCameraMove;
  final void Function() onCameraIdle;
  final double opacity;
  final void Function() onTapLocation;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {}

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final map = MapBloc.of(context);
    for (var element in map.markers) {
      debugPrint(element.toJson().toString());
    }
    return map.currentPosition == null
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          )
        : Stack(
            alignment: Alignment.bottomRight,
            children: [
              GoogleMap(
                polylines: map.polylinePoints,
                // onTap: (argument) => map.onMapTaped(argument),
                onCameraIdle: widget.onCameraIdle,
                onCameraMove: widget.onCameraMove,
                mapType: MapType.normal,
                myLocationEnabled: true,
                // scrollGesturesEnabled: false,
                zoomControlsEnabled: false,
                zoomGesturesEnabled: true,
                myLocationButtonEnabled: false,
                onMapCreated: (GoogleMapController controller) async {
                  map.mapController.complete(controller);
                },
                initialCameraPosition: map.cameraPosition(),
                markers: map.markers.toSet(),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: AnimatedOpacity(
                  opacity: widget.opacity,
                  duration: const Duration(milliseconds: 300),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ElevatedButton(
                      onPressed: widget.onTapLocation,
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(), //<-- SEE HERE
                        padding: const EdgeInsets.all(15),
                        backgroundColor: KColors.of(context).accentColor,
                      ),
                      child: const Icon(Icons.my_location, size: 20),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
