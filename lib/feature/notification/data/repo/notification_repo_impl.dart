import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/notification/data/data_source/notification_remote_data_source.dart';
import 'package:tala_app/feature/notification/data/model/notification_model.dart';
import 'package:tala_app/feature/notification/domain/repo/notification_repo.dart';

class NotificationRepoImpl extends NotificationRepo {
  NotificationRepoImpl(this.dataSource);

  final NotificationRemoteDataSource dataSource;
  @override
  Stream<Either<Failure, List<AppNotification>>> getNotifications() {
    try {
      final notifications = dataSource.getNotifications();
      return notifications.map((notifications) => right(notifications));
    } catch (e) {
      return Stream.value(left(AppFailure.fromException(e)));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeNotification(
    String? notificationId,
  ) async {
    try {
      final result = await dataSource.removeNotification(notificationId);
      return right(result);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }
}
