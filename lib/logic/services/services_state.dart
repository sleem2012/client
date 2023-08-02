import 'package:freezed_annotation/freezed_annotation.dart';

part 'services_state.freezed.dart';

@freezed
class ServicesState with _$ServicesState {
  const factory ServicesState.loading() = ServicesStateLoading;
  const factory ServicesState.success({String? force}) = ServicesStateSuccess;
  const factory ServicesState.error({required String error}) = ServicesStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs



