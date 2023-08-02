import '../../models/favourite/favourite_model.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../di.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class FavouriteRepoAbs {
  Future<Either<KFailure, FavouriteResponseModel>> get({required int page_count, required int page});
  Future<Either<KFailure, Unit>> add({required int? id});
  Future<Either<KFailure, Unit>> del({required int? id});
}

class FavouriteRepoImp implements FavouriteRepoAbs {
  @override
  Future<Either<KFailure, FavouriteResponseModel>> get({required int page_count, required int page}) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.favourite, params: {"page_count": 10, "page": page});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(FavouriteResponseModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, Unit>> add({required int? id}) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.favourite, data: {"product_id": id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<KFailure, Unit>> del({required int? id}) async {
    Future<Response<dynamic>> func = Di.dioClient.delete(KEndPoints.favourite, data: {"id": id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }
}
