// this will be used as notification channel id
import 'dart:async';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:give_n_go/util/constants.dart';
import 'package:give_n_go/util/location_helper.dart';
import 'package:latlng/latlng.dart';

import '../data/charity.dart';
import 'charity_service.dart';
import 'notification_service.dart';

class BackgroundService {
  static bool isRegistered = false;

  @pragma('vm:entry-point')
  static Future<void> _onStart(ServiceInstance service) async {
    String? recentNotification;

    final notificationService = NotificationService();
    DartPluginRegistrant.ensureInitialized();

    service.on('stopService').listen((event) {
      service.stopSelf();
    });

    Timer.periodic(const Duration(seconds: 2), (Timer t) async {
      var pos = await Geolocator.getCurrentPosition();
      charityList.forEach((element) {
        final Charity charity = element as Charity;
        final distance = calculateDistance(
          pos.latitude, pos.longitude, charity.latitudeLongitude.latitude,
          charity.latitudeLongitude.longitude,);
        if (distance < 0.1 && recentNotification != charity.title) {
          recentNotification = charity.title;
          notificationService.displayNotification(
              "${charity.title} charity box detected nearby!",
              "Click to donate", charity.title);
        }
      });
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
      description: 'Watching out for nearby virtual donations boxes',
      // description
      importance: Importance.low, // importance must be at low or higher level
    );


    final notificationsPlugin = NotificationService().notificationPlugin;
    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await service.configure(
      androidConfiguration: AndroidConfiguration(
          onStart: _onStart,
          autoStart: true,
          isForegroundMode: true,
          notificationChannelId: locationChannelId,
          initialNotificationTitle: 'GiveNow',
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
