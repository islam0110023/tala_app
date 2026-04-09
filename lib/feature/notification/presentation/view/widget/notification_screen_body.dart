import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_person_chat_skeleton.dart';
import 'package:tala_app/feature/notification/presentation/manager/notification/notification_cubit.dart';
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
                  time: '',
                  onMarkAllRead: () {
                    context.read<NotificationCubit>().removeAllNotifications();
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: AppDimensions.h15)),
            BlocBuilder<NotificationCubit, NotificationState>(
              builder: (context, state) {
                if (state is NotificationSuccess) {
                  return CustomListNotification(
                    notifications: state.notification,
                  );
                }
                if (state is NotificationLoading) {
                  return SliverList.separated(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return const CustomPersonChatSkeleton();
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          height: AppDimensions.h6,
                          thickness: AppDimensions.sp1,
                          indent: AppDimensions.w68,
                          color: AppColor.kDividerColor,
                        ),
                  );
                }
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'Something went wrong,Try again later',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColor.kPrimaryPink,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
