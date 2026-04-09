import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/notification/data/model/notification_model.dart';

abstract class NotificationRepo {
  Stream<Either<Failure, List<AppNotification>>> getNotifications();
  Future<Either<Failure, Unit>> removeNotification(String? notificationId);
}
