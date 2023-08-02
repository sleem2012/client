import '../../../../data/models/global/location/adresses/adress_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_address_state.freezed.dart';
@freezed

abstract class AddAddressState with _$AddAddressState{
  const factory AddAddressState.initial() =AddAddressStateInitial;
  const factory AddAddressState.loading() =AddAddressStateLoading;
  const factory AddAddressState.success({required AddressData addressData}) =AddAddressStateSuccess;
  const factory AddAddressState.error({required String error}) = AddAddressStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs