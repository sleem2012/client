import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/global/location/adresses/adress_model.dart';
import '../../../data/repository/global/global_repo.dart';
import 'addresses_state.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';

class AddressesBloc extends Cubit<AddressState> {
  AddressesBloc({required this.globalRepoImpl}) : super(const AddressState.initial());

  static AddressesBloc of(BuildContext context) {
    return BlocProvider.of<AddressesBloc>(context);
  }

  final GlobalRepoImpl globalRepoImpl;
  AddressModel? addressModel;

  AddressData? addressData;

  setInitialAddress() {
    addressData = addressModel?.addressData?.where((element) => element.id == KStorage.i.getUserInfo?.data?.address?.id).toList().firstOrNull;
    // debugPrint('ddddddddddd${addressData?.id.toString()}');
  }

  onAddressSelected(AddressData? address) {
    addressData = address;
    _update;
  }

  addNewLocalAddress(AddressData addressData) {
    addressModel = addressModel?.copyWith(addressData: addressModel?.addressData?..insert(0, addressData));
    _update;
  }

  Future getAddress() async {
    emit(const AddressState.loading());
    try {
      final result = await globalRepoImpl.getAddresses();
      result.fold(
        (l) {
          debugPrint('================= get Address (Bloc)  :$l ');

          emit(AddressState.error(error: KFailure.toError(l)));
        },
        (r) {
          addressModel = r;
          emit(AddressState.success(model: r));
          setInitialAddress();
        },
      );
    } catch (e) {
      debugPrint('================= get Address (Bloc)  :$e ');
      emit(AddressState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  delete(int? id) async {
    try {
      emit(const AddressState.loading());
      final result = await globalRepoImpl.deleteAddress(id);
      result.fold(
        (l) {
          debugPrint('================= delete Bloc : ${KFailure.toError(l)}');
          emit(AddressState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= delete Bloc : ${r.toString()}  ');
          KHelper.showSnackBar(r);
          emit(const AddressState.success());
          getAddress();
        },
      );
    } catch (e) {
      debugPrint('================= delete Bloc (Catch): ${e.toString()} ');
      emit(AddressState.error(error: Tr.get.something_went_wrong));
    }
  }

  get _update {
    emit(const AddressState.loading());
    emit(const AddressState.initial());
  }
}
