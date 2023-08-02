import 'package:flutter_bloc/flutter_bloc.dart';
import '../map_repo/map_repo.dart';
import '../../../widgets/search_package/material_floating_search_bar.dart';
import '../model/search_results_model.dart';
import 'map_search_state.dart';


class MapSearchBloc extends Cubit<MapSearchState> {
  MapSearchBloc() : super(const MapSearchState.initial());

  final MapRepo _mapRepo = MapRepo();

  static MapSearchBloc of(context) => BlocProvider.of(context);

  FloatingSearchBarController controller = FloatingSearchBarController();

  setCtrlInitial(String? query){
    controller.query = query??'';
  }

  MapSearchModel? searchModel;
  search(String query) async {
    emit(const MapSearchState.loading());
    try {
      final result = await _mapRepo.search(query);
      searchModel = result;
      emit( MapSearchState.success(searchModel: searchModel));
    } catch (error) {
      emit(MapSearchState.error(error: error.toString()));
    }
  }

}
