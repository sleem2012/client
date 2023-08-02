import '../../../data/models/global/location/adresses/adress_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'addresses_state.freezed.dart';
@freezed

abstract class AddressState with _$AddressState{
  const factory AddressState.initial() = AddressStateInitial;
  const factory AddressState.loading() = AddressStateLoading;
  const factory AddressState.success({AddressModel? model}) = AddressStateSuccess;
  const factory AddressState.error({required String error}) = AddressStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs