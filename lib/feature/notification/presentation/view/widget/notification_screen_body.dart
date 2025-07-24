import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/notification/presentation/view/widget/custom_time_with_mark_read_row.dart';
import 'package:tala_app/feature/notification/presentation/view/widget/notification_list_item.dart';
import 'package:tala_app/feature/profile_home/presentation/view/widget/oval_profile_container.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class NotificationScreenBody extends StatefulWidget {
  const NotificationScreenBody({super.key});

  @override
  State<NotificationScreenBody> createState() => _NotificationScreenBodyState();
}

class _NotificationScreenBodyState extends State<NotificationScreenBody> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  List<int> notifications = List.generate(5, (index) => index);

  void _removeAllNotifications() {
    final count = notifications.length;
    for (int i = count - 1; i >= 0; i--) {
      _listKey.currentState?.removeItem(
        i,
            (context, animation) => _buildNotificationItem(i, animation),
        duration: const Duration(milliseconds: 300),
      );
      notifications.removeAt(i);
    }
  }

  Widget _buildNotificationItem(int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTimeWithMarkReadRow(
                    time: 'Today',
                    onMarkAllRead: _removeAllNotifications,
                  ),
                  SizedBox(height: AppDimensions.h26),
                ],
              ),
            NotificationListItem(
              index: index,
              onDismissed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Notification dismissed'),
                    duration: const Duration(seconds: 3),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: AppColor.kPrimaryPink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimensions.r12),
                    ),
                    margin: EdgeInsets.all(AppDimensions.r20),
                  ),
                );
              },
            ),
            SizedBox(height: AppDimensions.h12),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const OvalProfileContainer(),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(LocaleKeys.notification.tr()),
              centerTitle: true,
              titleTextStyle: Styling.textStyle18700Purple,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColor.kWhite,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: AnimatedList(
                key: _listKey,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                initialItemCount: notifications.length,
                itemBuilder: (context, index, animation) =>
                    _buildNotificationItem(notifications[index], animation),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
