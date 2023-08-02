import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../data/models/notifications.dart';
import '../../../di.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';

abstract class NotificationsRepoAbs {
  Future<Either<KFailure, NotificationsModel>> getNotifications();

  Future<Either<KFailure, NotificationsData>> updateNotifications(int id);
}

class NotificationsRepoImpl implements NotificationsRepoAbs {
  @override
  Future<Either<KFailure, NotificationsModel>> getNotifications() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.notifications);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(NotificationsModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, NotificationsData>> updateNotifications(int id) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.notifications, data: {'id': id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) {
      return right(NotificationsData.fromJson(r['data']));
    });
  }
}
