import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/notification/presentation/view/widget/notification_list_item.dart';

class CustomListNotification extends StatefulWidget {
  const CustomListNotification({super.key, required this.notifications});

  final List<int> notifications;

  @override
  State<CustomListNotification> createState() => _CustomListNotificationState();
}

class _CustomListNotificationState extends State<CustomListNotification> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
      sliver: SliverList.separated(
        itemCount: widget.notifications.length,
        itemBuilder: (context, index) {
          return NotificationListItem(
            index: widget.notifications[index],
            onDismissed: () {
              widget.notifications.removeAt(index);
              setState(() {});
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: AppDimensions.h10);
        },
      ),
    );
  }
}
