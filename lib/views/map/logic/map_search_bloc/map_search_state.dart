import '../model/search_results_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_search_state.freezed.dart';

@freezed
 class MapSearchState with _$MapSearchState{
  const factory MapSearchState.initial() = MapSearchStateinitial;
  const factory MapSearchState.loading() =MapSearchStateLoading;
  const factory MapSearchState.error({String? error}) = MapSearchStateError;
  const factory MapSearchState.success({MapSearchModel? searchModel}) =MapSearchStateSuccess;


}
