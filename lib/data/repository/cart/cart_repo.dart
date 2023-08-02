import '../../models/cart/cart_model.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../di.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CartRepoAbs {
  Future<Either<KFailure, CartModel>> get();
  Future<Either<KFailure, CartModel>> getCheckout();

  Future<Either<KFailure, CartModel>> add({
    required int id,
    required int amount,
    String? note,
    List? extraIds,
    List? extraAmount,
    String? date,
    String? dateTo,
  });

  Future<Either<KFailure, CartModel>> update({required int id, required int amount, String? date, String? dateTo});

  Future<Either<KFailure, CartModel>> delete(int id);

  Future<Either<KFailure, CartModel>> updateExtra({required int extra_id, required int pro_id, required int amount, String? note});

  Future<Either<KFailure, CartModel>> deleteExtra(int id);
}

class CartRepoImp implements CartRepoAbs {
  @override
  Future<Either<KFailure, CartModel>> get() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.cart);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CartModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, CartModel>> getCheckout() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.checkout);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CartModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, CartModel>> add({
    required int id,
    required int amount,
    int? branch_id,
    String? note,
    List? extraIds,
    List? extraAmount,
    String? date,
    String? dateTo,
  }) async {
    Map<String, dynamic> value = {
      'product_menu_id': id,
      'amount': amount,
      if (note != null) 'note': note,
      if (extraIds != null) "extra_id": extraIds,
      if (extraAmount != null) "extra_amount": extraAmount,
      if (date != null) "time_piker_from": date,
      if (dateTo != null) "time_piker_to": dateTo,
      if (branch_id != null) "branch_id": branch_id,
    };

    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.cart, data: value);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CartModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, CartModel>> delete(int id) async {
    Future<Response<dynamic>> func = Di.dioClient.delete(KEndPoints.cart, data: {"id": id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CartModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, CartModel>> update({int? id, int? amount, String? date, String? dateTo}) async {
    Map<String, dynamic> value = {'product_menu_id': id, 'amount': amount, "_method": "PUT"};
    if (date != null) {
      value.addAll({
        'time_piker_from': date,
      });
    }
    if (dateTo != null) {
      value.addAll({'time_piker_to': dateTo});
    }
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.cart, data: value);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CartModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, CartModel>> updateExtra({required int extra_id, required int pro_id, required int amount, String? note}) async {
    Map<String, dynamic> value = {'extra_id[]': extra_id, 'extra_amount[]': amount, "product_menu_id": pro_id, "_method": "PUT"};
    if (note != null) {
      value.addAll({'note': note});
    }
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.cart, data: FormData.fromMap(value));
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CartModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, CartModel>> deleteExtra(int id) async {
    Future<Response<dynamic>> func = Di.dioClient.delete(KEndPoints.extraCart, data: {"id": id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CartModel.fromJson(r)),
    );
  }
}
