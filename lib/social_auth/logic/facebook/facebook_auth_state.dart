import 'package:freezed_annotation/freezed_annotation.dart';
part 'facebook_auth_state.freezed.dart';

@freezed
class FacebookAuthState with _$FacebookAuthState{
  const factory FacebookAuthState.loading() = FacebookAuthStateLoading;
  const factory FacebookAuthState.initial() = FacebookAuthStateInitial;
  const factory FacebookAuthState.success() = FacebookAuthStateSuccess;
  const factory FacebookAuthState.error({required String error}) = FacebookAuthStateError;
}