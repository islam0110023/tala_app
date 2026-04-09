part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationSuccess extends NotificationState {
  NotificationSuccess(this.notification);
  final List<AppNotification> notification;
}

final class NotificationFailure extends NotificationState {
  NotificationFailure(this.errMessage);
  final String errMessage;
}
