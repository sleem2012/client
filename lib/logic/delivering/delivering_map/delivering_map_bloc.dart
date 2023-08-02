import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/orders/delivering.dart';
import '../../../data/repository/delivering/delivering_repo.dart';
import '../../../di.dart';
import '../../../packages/shared/picker/data/country_search_model/address_result.dart';
import 'delivering_map_state.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/logger.dart';
import '../../../data/models/global/location/adresses/adress_model.dart';
import '../../../packages/payment/data/payment/my_payment_model.dart';

class DeliveringMapBloc extends Cubit<DeliveringMapState> {
  DeliveringMapBloc({required this.deliveringRepoImp}) : super(const DeliveringMapState.initial());

  static DeliveringMapBloc of(context) => BlocProvider.of(context);
  final DeliveringRepoImp deliveringRepoImp;

  // Source
  String? location;

  String? cityId = '';

  int? get my_id => KStorage.i.getUserInfo?.data?.id;

  // Destination
  String? destinationLocation;

  TextEditingController noteCtrl = TextEditingController();
  String? destinationCityId = '';

  PaymentData? selectedPayment;

  DeliveringModel deliveringModel = DeliveringModel(type: 'delivery');

  AddressData? sourceDate;
  AddressData? destinationDate;

  setAddressData(AddressData? data, bool source) {
    if (source) {
      sourceDate = data;
      location = data?.detailedAddress;
    } else {
      destinationDate = data;
      destinationLocation = data?.detailedAddress;
    }
    _update;
  }

  createDeliveringOrder() async {
    try {
      emit(const DeliveringMapState.loading());

      deliveringModel = deliveringModel.copyWith(
        userNote: noteCtrl.text,
        sourceId: sourceDate?.id.toString(),
        destinationId: destinationDate?.id.toString(),
        paymentId: selectedPayment?.id.toString(),
      );
      printMap(deliveringModel.toJson());
      debugPrint(deliveringModel.toJson().toString());
      final result = await deliveringRepoImp.createDeliveringOrders(deliveringModel: deliveringModel);
      result.fold(
        (l) {
          emit(DeliveringMapState.error(error: KFailure.toError(l)));
          KHelper.showSnackBar(KFailure.toError(l));
          debugPrint('================= createDeliveringOrder  : $l  ');
        },
        (r) {
          emit(DeliveringMapState.success(r));
          clear();
        },
      );
    } catch (e) {
      debugPrint('================= createDeliveringOrder  Ex : $e : ');
      emit(DeliveringMapState.error(error: Tr.get.something_went_wrong));
    }
  }

  AddressResult? result;

  selectAddress(AddressResult? result, bool Destination) async {
    try {
      if (result != null) {
        if (Destination) {
          deliveringModel = deliveringModel.copyWith(
            destinationLatitude: result.latlng.latitude.toString(),
            destinationLongitude: result.latlng.longitude.toString(),
            destinationDetailedAddress: result.address,
            destinationCityId: result.cityId.toString(),
            destinationAddressState: result.state,
            destinationZipcode: result.zipcode,
            destinationStreet: result.street,
            destinationBuilding: result.building,
            destinationFloor: result.floor,
            destinationIntercom: result.intercome,
          );
        } else {
          deliveringModel = deliveringModel.copyWith(
            sourceLatitude: result.latlng.latitude.toString(),
            sourceLongitude: result.latlng.longitude.toString(),
            sourceDetailedAddress: result.address,
            sourceCityId: result.cityId.toString(),
            sourceAddressState: result.state,
            sourceZipcode: result.zipcode,
            sourceStreet: result.street,
            sourceIntercom: result.intercome,
            sourceFloor: result.floor,
            sourceBuilding: result.building,
          );

          location = result.address;
        }

        // debugPrint('================= ${registerModel?.detailed_address} : ');
      }
      _update;
    } catch (e) {
      KHelper.showSnackBar(Tr.get.address_is_null);
    }
  }

  Future update_order_socket({
    required int? orderId,
  }) async {
    if (orderId != null && my_id != null) {
      Di.socket.emit('order_bill', {"id": orderId, "type": "client"});
      debugPrint('sent');
    }
  }

  get _update {
    emit(const DeliveringMapState.loading());
    emit(const DeliveringMapState.initial());
  }

  Future<void> selectPaymentId(PaymentData paymentData) async {
    selectedPayment = paymentData;
    debugPrint('================= ${selectedPayment?.id} :paymentId ');
    _update;
  }

  clear() {
    location = null;
    destinationLocation = null;
    noteCtrl.clear();
    selectedPayment = null;
    cityId = null;
    destinationCityId = null;
    result = null;
    destinationLocation = null;
    _update;
  }
}
