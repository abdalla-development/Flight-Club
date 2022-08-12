import 'package:awesome_notifications/awesome_notifications.dart';

void createAwesomeNotification(
    {required String channelKey, required String title, required String body}) {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: channelKey,
          title: title,
          body: body,
      ));

  // createAwesomeNotification(
  //   body: 'Simple body',
  //   channelKey: 'basic_channel',
  //   title: 'Simple Notification',
  // );
}
