import 'package:flutter_bloc/flutter_bloc.dart';
import '../map_repo/map_repo.dart';
import 'place_details_state.dart';



class PlaceDetailsBloc extends Cubit<PlaceDetailsState> {
  PlaceDetailsBloc() : super(const PlaceDetailsState.initial());

  static PlaceDetailsBloc of(context) => BlocProvider.of(context);

  final MapRepo _mapRepo = MapRepo();

  getPlaceDetails(String placeId) async {
    emit(const PlaceDetailsState.loading());
    try {
      final result = await _mapRepo.getPlaceLocation(placeId);
      emit(PlaceDetailsState.success(place: result));
    } catch (error) {
      emit(PlaceDetailsState.error(error: error.toString()));
    }
  }
}
