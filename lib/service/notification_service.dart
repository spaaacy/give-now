import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import '../data/charity.dart';
import '../ui/charity_detail/charity_detail.dart';
import '../ui/charity_detail/charity_detail_state.dart';
import '../util/constants.dart';
import '../util/location_helper.dart';
import 'background_service.dart';
import 'charity_service.dart';

class NotificationService {
  BuildContext? _context;

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
    _context ??= context;

    const androidInitialization = AndroidInitializationSettings('ic_stat_feature_graphic');

    const iOSInitialization = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(android: androidInitialization, iOS: iOSInitialization);
    await notificationPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
    await notificationPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();

    await handleLocationPermission(context);

    if (!BackgroundService.isRegistered) {
      BackgroundService.registerLocationBackgroundService();
    }
  }

  Future<void> displayNotification(String title, String body, String payload) async {
    const androidDetails = AndroidNotificationDetails(
      charityChannelId,
      charityChannelName,
      priority: Priority.defaultPriority,
      importance: Importance.defaultImportance,
      styleInformation: BigTextStyleInformation(''),
    );
    const notificationDetails = NotificationDetails(android: androidDetails);
    await notificationPlugin.show(charityNotificationId, title, body, notificationDetails, payload: payload);
  }

  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      final Charity charity = charityList.firstWhere((charity) => charity.title == payload);
      await Navigator.push(
        _context!,
        MaterialPageRoute<void>(builder: (context) =>
            ChangeNotifierProvider(create: (context) => CharityDetailState(charity), child: const CharityDetail())),
      );
    }
  }

}
