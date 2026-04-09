import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/feature/notification/data/model/notification_model.dart';
import 'package:tala_app/feature/notification/presentation/view/widget/custom_notification_container.dart';
import 'package:tala_app/feature/notification/presentation/view/widget/dismissible_background.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({
    super.key,
    required this.index,
    required this.onDismissed,
    required this.notification,
    required this.onTap,
  });
  final int index;
  final VoidCallback onDismissed;
  final AppNotification notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Dismissible(
        key: ValueKey(notification.notificationId),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) => onDismissed(),
        background: const DismissibleBackground(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: CustomNotificationContainer(
            title: notification.title,
            message: notification.body,
            time: AppConstant.timeAgoShort(notification.createdAt),
          ),
        ),
      ),
    );
  }
}
