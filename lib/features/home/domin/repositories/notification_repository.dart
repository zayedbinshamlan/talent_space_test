abstract class NotificationRepository {
  Future<void> sendNotification(String fcmToken, String title, String body);
} 
