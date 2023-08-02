import '../../models/reviews/reviews_model.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../di.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class ReviewsRepoAbs {
  Future<Either<KFailure, ReviewModel>> get(int id);
  Future<Either<KFailure, Unit>> create({required int id, required double rate, required String comment});
}

class ReviewsRepoImp implements ReviewsRepoAbs {
  @override
  Future<Either<KFailure, ReviewModel>> get(int id) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.reviews, params: {"product_menu_id": id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(ReviewModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, Unit>> create({required int id, required double rate, required String comment}) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.reviews, data: {'product_menu_id': id, 'rate': rate, 'comment': comment});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }
}
