import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/feature/notification/presentation/view/widget/custom_app_bar_notification.dart';
import 'package:tala_app/feature/notification/presentation/view/widget/custom_list_notification.dart';
import 'package:tala_app/feature/notification/presentation/view/widget/custom_time_with_mark_read_row.dart';
import 'package:tala_app/feature/profile_home/presentation/view/widget/oval_profile_container.dart';

class NotificationScreenBody extends StatelessWidget {
  const NotificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const OvalProfileContainer(),
        CustomScrollView(
          slivers: [
            const CustomAppBarNotification(),
            SliverToBoxAdapter(child: SizedBox(height: AppDimensions.h61)),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: AppDimensions.r25,
              ),
              sliver: SliverToBoxAdapter(
                child: CustomTimeWithMarkReadRow(
                  time: 'Today',
                  onMarkAllRead: () {},
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: AppDimensions.h15)),
            CustomListNotification(notifications: AppConstant.notifications),
          ],
        ),
      ],
    );
  }
}
