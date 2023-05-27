import 'package:flutter/material.dart';
import 'package:give_n_go/ui/common/nav_bar_wrapper.dart';
import 'package:give_n_go/ui/common/nav_bar_state.dart';
import 'package:give_n_go/data/charity.dart';
import 'package:give_n_go/service/charity_service.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:latlng/latlng.dart';
import 'package:provider/provider.dart';

void main() async {
  // Hive initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<Charity>(CharityAdapter());
  Hive.registerAdapter<LatLng>(LatLngAdapter());
  await Hive.openBox('box');
  await initializeData();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'giveNgo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.lightBlue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => (NavBarState()),
        child: const NavBarWrapper(),
      ),
    );
  }
}
