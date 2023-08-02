import '../../models/in_drive/get_in_drive_model.dart';
import '../../models/in_drive/trip_model.dart';
import '../../models/in_drive/update_trip_model.dart';
import '../../models/orders/order_review_model.dart';

import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../di.dart';

abstract class InDriveRepoAbs {
  Future<Either<KFailure, GetInDriveModel>> get_in_drive();
  Future<Either<KFailure, String>> handlePayment(int id, int paymentId);

  Future<Either<KFailure, TripModel>> createTrip(Map<String, dynamic> data);

  Future<Either<KFailure, String>> calculateFare(Map<String, dynamic> data);

  Future<Either<KFailure, TripModel>> updateTrip(UpdateTripModel model);
  Future<Either<KFailure, Unit>> rateTrip(OrderReviewModel model);
}

class InDriveRepoImp implements InDriveRepoAbs {
  @override
  Future<Either<KFailure, GetInDriveModel>> get_in_drive() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.in_drive);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(GetInDriveModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, TripModel>> createTrip(Map<String, dynamic> data) async {
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(KEndPoints.in_drive, data: data);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(TripModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, String>> calculateFare(Map<String, dynamic> data) async {
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(KEndPoints.in_drive_calculate, data: data);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(r['data']['cost']),
    );
  }

  @override
  Future<Either<KFailure, TripModel>> updateTrip(UpdateTripModel model) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.in_drive, data: model.toMap());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(TripModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, String>> handlePayment(int id, int paymentId) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.inDrivePayment, data: {'id': id, 'payment_id': paymentId});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(r['data']['url'] as String),
    );
  }

  @override
  Future<Either<KFailure, Unit>> rateTrip(OrderReviewModel model) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.rate_trip, data: model.toJson());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }
}
