import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/notifications.dart';
import '../../../views/notifications/repo/notificaions_repo.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';

import 'notifications_state.dart';

class NotificationsBloc extends Cubit<NotificationsState> {
  NotificationsBloc({this.notificationsRepoImpl}) : super(const NotificationsState.loading());

  static NotificationsBloc of(BuildContext context) {
    return BlocProvider.of<NotificationsBloc>(context);
  }

  final NotificationsRepoImpl? notificationsRepoImpl;
  NotificationsModel? notificationsModel;

  getNotifications() async {
    try {
      emit(const NotificationsState.loading());
      final result = await notificationsRepoImpl!.getNotifications();
      result.fold(
        (l) {
          debugPrint('=================My notifications fails :$l ');
          emit(NotificationsState.error(error: KFailure.toError(l)));
        },
        (r) {
          notificationsModel = r;
          debugPrint('=================My notifications  Success :$r ');
          emit(NotificationsState.success(notificationsModel: notificationsModel!));
        },
      );
    } catch (e) {
      debugPrint('=================My notifications  catch $e  ');
      emit(NotificationsState.error(error: Tr.get.something_went_wrong));
    }
  }

  updateNotification(int id) async {
    try {
      emit(const NotificationsState.loading());
      final result = await notificationsRepoImpl!.updateNotifications(id);
      result.fold(
        (l) {
          debugPrint('=================My notifications fails :$l ');
          emit(NotificationsState.error(error: KFailure.toError(l)));
        },
        (r) {
          notificationsModel = notificationsModel?.copyWith(
            notificationsData: notificationsModel?.notificationsData
              ?..removeWhere((element) => element.id == id)
              ..add(r),
          );

          debugPrint('=================My notifications  Success :${r.toJson()} ');
          emit(NotificationsState.success(notificationsModel: notificationsModel!));
        },
      );
    } catch (e) {
      debugPrint('=================My notifications  catch $e  ');
      emit(NotificationsState.error(error: Tr.get.something_went_wrong));
    }
  }
}
