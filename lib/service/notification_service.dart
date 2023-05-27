import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../util/constants.dart';
import '../util/location_helper.dart';
import 'location_service.dart';

class NotificationService {
  /*
  * Used to create singleton instance
  * */
  NotificationService._internal();

  static final NotificationService _notificationService = NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin _notificationPlugin = FlutterLocalNotificationsPlugin();

  FlutterLocalNotificationsPlugin get notificationPlugin => _notificationPlugin;

  Future<void> initialize(context) async {
    const androidInitialization = AndroidInitializationSettings('ic_stat_feature_graphic');

    const iOSInitialization = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(android: androidInitialization, iOS: iOSInitialization);
    await notificationPlugin.initialize(initializationSettings);
    await notificationPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();

    await handleLocationPermission(context);

    if (!LocationService.isRegistered) {
      LocationService.registerLocationBackgroundService();
    }
  }

  Future<void> displayNotification(String title, String body) async {
    const androidDetails = AndroidNotificationDetails(
      charityChannelId,
      charityChannelName,
      priority: Priority.defaultPriority,
      importance: Importance.defaultImportance,
      styleInformation: BigTextStyleInformation(''),
    );
    const notificationDetails = NotificationDetails(android: androidDetails);
    await notificationPlugin.show(charityNotificationId, title, body, notificationDetails);
  }

}
