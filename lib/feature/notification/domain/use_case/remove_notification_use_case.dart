import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/notification/domain/repo/notification_repo.dart';

class RemoveNotificationUseCase {
  RemoveNotificationUseCase(this.notificationRepo);
  final NotificationRepo notificationRepo;

  Future<Either<Failure, Unit>> call(String? notificationId) {
    return notificationRepo.removeNotification(notificationId);
  }
}
