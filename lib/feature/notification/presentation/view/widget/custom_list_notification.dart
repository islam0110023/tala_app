import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/feature/notification/data/model/notification_model.dart';
import 'package:tala_app/feature/notification/presentation/manager/notification/notification_cubit.dart';
import 'package:tala_app/feature/notification/presentation/view/widget/notification_list_item.dart';

class CustomListNotification extends StatelessWidget {
  const CustomListNotification({super.key, required this.notifications});

  final List<AppNotification> notifications;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
      sliver: SliverList.separated(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationListItem(
            index: index,
            onTap: () {
              if (notifications[index].type == 'chat') {
                context.push(
                  AppRoutes.chatScreen,
                  extra: notifications[index].data,
                );
              } else if (notifications[index].type == 'connection_request' ||
                  notifications[index].type == 'connection_accepted' ||
                  notifications[index].type == 'connection_rejected') {
                AppRoutes.route.go(AppRoutes.homeScreen);
              }
            },
            notification: notifications[index],
            onDismissed: () {
              context.read<NotificationCubit>().removeNotification(
                notifications[index].notificationId,
              );
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
