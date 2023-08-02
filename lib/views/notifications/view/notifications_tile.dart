import 'package:flutter/material.dart';
import '../../../data/models/notifications.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../shared/theme/colors.dart';
import '../../../packages/widgets/icon_button.dart';
import '../../widgets/relative_date_time.dart';
import '../bloc/get_notifications_bloc.dart';

class NotificationsTile extends StatelessWidget {
  const NotificationsTile({Key? key, required this.notificationsData}) : super(key: key);
  final NotificationsData notificationsData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          KHelper.of(context).elevatedBox.copyWith(color: notificationsData.isRead! ? KColors.of(context).elevatedBox : KColors.of(context).shadow),
      margin: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        leading: const Icon(KHelper.notifications, size: 40),
        title: Text('${notificationsData.title?.value}', style: KTextStyle.of(context).listTileTitle),
        subtitle: Text(
          '${notificationsData.body?.value}',
          style: KTextStyle.of(context).body4,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KIconButton(
              child: const Icon(KHelper.cancel),
              onPressed: () {
                NotificationsBloc.of(context).updateNotification(notificationsData.id ?? 0);
                debugPrint(notificationsData.isRead.toString());
              },
            ),
            RelativeDateTimeWidget(
              dateTime: DateTime.tryParse(notificationsData.createdAt ?? "") ?? DateTime.now(),
              textStyle: KTextStyle.of(context).body3,
            )
          ],
        ),
      ),
    );
  }
}
