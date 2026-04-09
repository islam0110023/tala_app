import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/notification/data/model/notification_model.dart';
import 'package:tala_app/feature/notification/domain/use_case/get_notifications_use_case.dart';
import 'package:tala_app/feature/notification/domain/use_case/remove_notification_use_case.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(
    this.getNotificationsUseCase,
    this.removeNotificationUseCase,
  ) : super(NotificationInitial()) {
    loadNotifications();
  }
  final GetNotificationsUseCase getNotificationsUseCase;
  final RemoveNotificationUseCase removeNotificationUseCase;
  StreamSubscription<Either<Failure, List<AppNotification>>>? subscription;
  void loadNotifications() async {
    emit(NotificationLoading());
    subscription?.cancel();

    subscription = getNotificationsUseCase().listen((either) {
      either.fold((failure) => emit(NotificationFailure(failure.errMessage)), (
        data,
      ) {
        emit(NotificationSuccess(data));
      });
    });
  }

  void removeNotification(String? notificationId) async {
    await removeNotificationUseCase(notificationId);
  }

  void removeAllNotifications() async {
    await removeNotificationUseCase(null);
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
