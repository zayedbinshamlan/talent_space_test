import 'package:talent_space_test/features/home/domin/repositories/notification_repository.dart';

class SendNotificationUseCase {
  final NotificationRepository notificationRrepository;

  SendNotificationUseCase({required this.notificationRrepository});

  Future<void> execute(String fcmToken, String title, String body) {
    return notificationRrepository.sendNotification(fcmToken, title, body);
  }
}
