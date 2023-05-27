import 'package:flutter/material.dart';
import 'package:give_n_go/ui/home_page/home_page_state.dart';
import 'package:give_n_go/ui/payment_page/payment_page.dart';
import 'package:give_n_go/ui/payment_page/payment_page_state.dart';
import 'package:provider/provider.dart';
import '../charity_page/charity_page.dart';
import '../charity_page/charity_page_state.dart';
import '../home_page/home_page.dart';

class NavBarState extends ChangeNotifier {
  int _selectedIndex = 0;

  final List<Widget> widgetOptions = <Widget>[
    ChangeNotifierProvider(
      create: (context) => HomePageState(),
      child: const HomePage(),
    ),
    // ChangeNotifierProvider(
    //   create: (context) => PaymentPageState(),
    //   child: const PaymentPage(),
    // ),
    ChangeNotifierProvider(
      create: (context) => CharityPageState(),
      child: CharityPage(),
    ),
    const Text('Settings'),
  ];

  final List<String> widgetTitles = ['Home Page', 'Charities', 'Settings'];

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
