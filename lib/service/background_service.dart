// this will be used as notification channel id
import 'dart:async';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:give_n_go/util/constants.dart';

import 'notification_service.dart';

class BackgroundService {
  static bool isRegistered = false;

  @pragma('vm:entry-point')
  static Future<void> _onStart(ServiceInstance service) async {
    final notificationService = NotificationService();
    DartPluginRegistrant.ensureInitialized();

    service.on('stopService').listen((event) {
      service.stopSelf();
    });

    Timer.periodic(const Duration(seconds: 15), (Timer t) async {
      var pos = await Geolocator.getCurrentPosition();
      notificationService.displayNotification("Title", "${pos.latitude} ${pos.longitude}", "SOLS 24/7");
    });
  }

  static void unregisterLocationBackgroundService() async {
    isRegistered = false;
    final service = FlutterBackgroundService();
    var isRunning = await service.isRunning();
    if (isRunning) {
      service.invoke("stopService");
    }
  }

  static void registerLocationBackgroundService() async {
    isRegistered = true;
    final service = FlutterBackgroundService();

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      locationChannelId,
      locationChannelName,
      description: 'Watching out for nearby virtual donations boxes', // description
      importance: Importance.low, // importance must be at low or higher level
    );


    final notificationsPlugin = NotificationService().notificationPlugin;
    await notificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await service.configure(
      androidConfiguration: AndroidConfiguration(
          onStart: _onStart,
          autoStart: true,
          isForegroundMode: true,
          notificationChannelId: locationChannelId,
          initialNotificationTitle: 'giveNgo',
          initialNotificationContent: 'Watching out for nearby virtual donations boxes',
          foregroundServiceNotificationId: locationNotificationId,
          autoStartOnBoot: true
      ),
      iosConfiguration: IosConfiguration(
        onForeground: _onStart,
      ),
    );
  }
}