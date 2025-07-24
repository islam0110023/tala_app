import 'package:flutter/material.dart';
import 'package:tala_app/feature/notification/presentation/view/widget/custom_notification_container.dart';
import 'package:tala_app/feature/notification/presentation/view/widget/dismissible_background.dart';

class NotificationListItem extends StatelessWidget {

  const NotificationListItem({
    super.key,
    required this.index,
    required this.onDismissed,
  });
  final int index;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(index),
      direction: DismissDirection.horizontal,
      onDismissed: (direction) => onDismissed(),
      background: const DismissibleBackground(isStart: true),
      secondaryBackground: const DismissibleBackground(isStart: false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: const CustomNotificationContainer(
          title: 'Event Booked successfully',
          message:
          'Acoustic Serenade Showcase Acoustic Serenade Showcase Acoustic Serenade',
          time: '1h',
        ),
      ),
    );
  }
}
