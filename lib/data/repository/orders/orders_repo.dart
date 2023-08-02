import '../../models/orders/order_review_model.dart';
import '../../models/orders/order_status_model.dart';
import '../../models/orders/orders_model.dart';
import '../../models/orders/request_quote_.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../di.dart';

abstract class OrdersRepoAbs {
  Future<Either<KFailure, OrderModel>> getOrders();
  Future<Either<KFailure, String>> create_orders({required Map<String, dynamic> createOrderModel});
  Future<Either<KFailure, Unit>> updateOrder({required int shipping_id, required String state});
  Future<Either<KFailure, OrderStatusModel>> getStatus(int id);
  Future<Either<KFailure, Unit>> addReview(OrderReviewModel reviewModel);
  Future<Either<KFailure, Unit>> request_for_quote(Map<String, String> requestQuotePost);
  Future<Either<KFailure, RequestQuoteResponse>> get_request_quotes();
}

class OrdersRepoImp implements OrdersRepoAbs {
  @override
  Future<Either<KFailure, String>> create_orders({required Map<String, dynamic> createOrderModel}) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.orders, data: FormData.fromMap(createOrderModel));
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(r["status"] != "error" ? r['data']['url'] : ''));
  }

  @override
  Future<Either<KFailure, OrderModel>> getOrders() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.orders, params: {"type": "client"});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(OrderModel.fromJson(r)));
  }

  @override
  Future<Either<KFailure, OrderStatusModel>> getStatus(int id) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.status, params: {'id': id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(OrderStatusModel.fromJson(r)));
  }

  @override
  Future<Either<KFailure, Unit>> addReview(OrderReviewModel reviewModel) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.orderReview, data: reviewModel.toJson());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(unit));
  }

  @override
  Future<Either<KFailure, Unit>> updateOrder({required int shipping_id, required String state}) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.orders, params: {"shipping_id": shipping_id, "state": state});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(unit));
  }

  @override
  Future<Either<KFailure, Unit>> request_for_quote(Map<String, dynamic> requestQuotePost) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.request_for_quote, data: requestQuotePost);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(unit));
  }

  @override
  Future<Either<KFailure, RequestQuoteResponse>> get_request_quotes() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.request_for_quote);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(RequestQuoteResponse.fromJson(r)));
  }
}
