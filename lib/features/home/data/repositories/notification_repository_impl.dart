import 'package:talent_space_test/features/home/data/datasource/notification_data_source.dart';
import 'package:talent_space_test/features/home/domin/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationDataSource notificationDataSource;

  NotificationRepositoryImpl({required this.notificationDataSource});

  @override
  Future<void> sendNotification(
      String fcmToken, String title, String body) async {
    return await notificationDataSource.sendNotification(fcmToken, title, body);
  }
}
