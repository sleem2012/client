import 'package:freezed_annotation/freezed_annotation.dart';
part 'google_auth_state.freezed.dart';

@freezed
class GoogleAuthState with _$GoogleAuthState{
  const factory GoogleAuthState.loading() = GoogleAuthStateLoading;
  const factory GoogleAuthState.initial() = GoogleAuthStateInitial;
  const factory GoogleAuthState.success() = GoogleAuthStateSuccess;
  const factory GoogleAuthState.error({required String error}) = GoogleAuthStateError;
}