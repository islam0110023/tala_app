import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/notification/data/model/notification_model.dart';
import 'package:tala_app/feature/notification/domain/repo/notification_repo.dart';

class GetNotificationsUseCase {
  GetNotificationsUseCase(this.notificationRepo);

  final NotificationRepo notificationRepo;
  Stream<Either<Failure, List<AppNotification>>> call() {
    return notificationRepo.getNotifications();
  }
}
