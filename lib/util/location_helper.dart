import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

Future<bool> handleLocationPermission(context) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Location services are disabled. Please enable the services'),
      ),
    );
    return false;
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
            title: const Text("Location permissions"),
            content: const Text("Location permissions is required to use this application"),
            actions: [
              TextButton(onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              }, child: const Text("Okay")),
            ]
        );
      });
      return false;
    }
  }

  if (permission != LocationPermission.always) {

    await showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
          title: const Text("Location permissions"),
          content: const Text("APLanes uses your location in the background when necessary and is required to use this application. Please select \"Allow all the time\" to continue"),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context, "Okay");
            }, child: const Text("Okay")),
          ]
      );
    });

    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.always) {
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
            title: const Text("Location permissions"),
            content: const Text("\"Allow all the time\" is required to use this application"),
            actions: [
              TextButton(onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              }, child: const Text("Okay")),
            ]
        );
      });
    }
  }

  if (permission == LocationPermission.deniedForever) {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
          title: const Text("Location permissions"),
          content: const Text('Location permissions are permanently denied, we cannot request permissions.'),
          actions: [
            TextButton(onPressed: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            }, child: const Text("Okay")),
          ]
      );
    });
    return false;
  }
  return true;
}
