import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../models/orders/delivering.dart';
import '../../models/orders/get_delivering_order_model.dart';
import '../../models/orders/update_delivering_order_model.dart';
import '../../../di.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';

abstract class DeliveringRepoAbs {
  Future<Either<KFailure, String>> createDeliveringOrders({required DeliveringModel deliveringModel});
  Future<Either<KFailure, GetDeliveringOrderModel>> getDeliveringOrders();
  Future<Either<KFailure, Unit>> UpdateOrders(UpdateDeliveringOrderModel updateOrderModel);
  Future<Either<KFailure, String>> handlePayment(int id, int paymentId);
}

class DeliveringRepoImp implements DeliveringRepoAbs {
  @override
  Future<Either<KFailure, String>> createDeliveringOrders({required DeliveringModel deliveringModel}) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.DeliveringOrder, data: deliveringModel.toJson());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(r['data']['url']),
    );
  }

  @override
  Future<Either<KFailure, GetDeliveringOrderModel>> getDeliveringOrders() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.DeliveringOrder);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(GetDeliveringOrderModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, Unit>> UpdateOrders(UpdateDeliveringOrderModel updateOrderModel) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.DeliveringOrder, data: updateOrderModel.toJson());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<KFailure, String>> handlePayment(int id, int paymentId) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.handlePayment, data: {'id': id, 'payment_id': paymentId});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(r['data']['url'] as String),
    );
  }
}
