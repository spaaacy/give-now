import 'package:flutter/material.dart';
import 'package:give_n_go/ui/home_page/home_page_state.dart';
import 'package:provider/provider.dart';

import '../home_page/home_page.dart';

class NavBarState extends ChangeNotifier {
  int _selectedIndex = 0;

  final List<Widget> widgetOptions = <Widget>[
    ChangeNotifierProvider(
        create: (context) => HomePageState(), child: const HomePage()),
    const Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    const Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

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
