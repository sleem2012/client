import 'package:freezed_annotation/freezed_annotation.dart';
part 'favourite_state.freezed.dart';

@freezed
 class FavoriteState with _$FavoriteState{
  const factory FavoriteState.loading() = FavoriteStateLoading;
  const factory FavoriteState.toggling({required int id}) = FavoriteStateToggling;
  const factory FavoriteState.loadMore() = FavoriteStateLoadMore;
  const factory FavoriteState.toggleSuccess() = FavoriteStateToggleSuccess;
  const factory FavoriteState.toggleLocaleSuccess() = FavoriteStateToggleLocaleSuccess;
  const factory FavoriteState.success() = FavoriteStateSuccess;
  const factory FavoriteState.error({required String error}) = FavoriteStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs