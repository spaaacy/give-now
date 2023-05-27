import 'package:flutter/material.dart';
import 'package:give_n_go/ui/home_page/home_page_state.dart';
import 'package:provider/provider.dart';

import '../charity_detail/charity_detail.dart';
import '../charity_detail/charity_detail_state.dart';
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
    ChangeNotifierProvider(
      create: (context) => CharityDetailState(),
      child: const CharityDetail(),
    ),
    ChangeNotifierProvider(
      create: (context) => CharityPageState(),
      child: CharityPage(),
    )
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
