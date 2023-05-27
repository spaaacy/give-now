import 'package:flutter/material.dart';
import 'package:give_n_go/ui/home_page/home_page.dart';
import 'package:give_n_go/ui/home_page/home_page_provider.dart';
import 'package:provider/provider.dart';

void main() {
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
      ),
      home: ChangeNotifierProvider(
        create: (context) => HomePageProvider(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
