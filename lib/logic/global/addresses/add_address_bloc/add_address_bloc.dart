import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/global/location/adresses/add_address_model.dart';
import '../../../../data/models/global/location/adresses/adress_model.dart';
import '../../../../data/repository/global/global_repo.dart';
import 'add_address_state.dart';
import '../../../../packages/shared/error/failures.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/helper.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  AddAddressCubit({required this.globalRepoImpl}) : super(const AddAddressState.initial());

  static AddAddressCubit of(context) => BlocProvider.of(context);

  final GlobalRepoImpl globalRepoImpl;

  AddAddressModel? addressModel = AddAddressModel();

  AddressData? addressData;

  TextEditingController addressStateController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  TextEditingController streetController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController intercomController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController detailedAddressController = TextEditingController();

  addAddress() async {
    try {
      addressModel = addressModel?.copyWith(
        street: streetController.text,
        addressState: addressStateController.text,
        building: buildingController.text,
        intercom: intercomController.text,
        floor: floorController.text,
        zipcode: zipcodeController.text,
      );
      emit(const AddAddressState.loading());

      final result = await globalRepoImpl.addAddresses(addressModel!);
      result.fold(
        (l) {
          emit(AddAddressState.error(error: KFailure.toError(l)));
          KHelper.showSnackBar(KFailure.toError(l));
          debugPrint('================= addAddress Bloc : $l  ');
        },
        (r) {
          addressData = r;
          emit(AddAddressState.success(addressData: addressData!));
        },
      );
    } catch (e) {
      debugPrint('================= addAddress Bloc Ex : $e : ');
      emit(AddAddressState.error(error: Tr.get.something_went_wrong));
    }
  }

  selectAddress(BuildContext context) async {
    try {
      final result = await KHelper.showMaps(context);
      if (result != null) {
        addressModel = addressModel?.copyWith(
          latitude: result.latlng.latitude,
          longitude: result.latlng.longitude,
          detailedAddress: result.address,
          zipcode: result.zipcode,
          addressState: result.state,
          street: result.street,
          cityId: result.cityId.toString(),
        );
        detailedAddressController.text = result.address;
        zipcodeController.text = result.zipcode;
        addressStateController.text = result.state ?? '';
        streetController.text = result.street ?? '';
        countryController.text = result.country ?? '';

        debugPrint(result.cityId.toString());
      }
      _update;
    } catch (e) {
      KHelper.showSnackBar(Tr.get.address_is_null);
    }
  }

  get _update {
    emit(const AddAddressState.loading());
    emit(const AddAddressState.initial());
  }
}
