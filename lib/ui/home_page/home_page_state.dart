import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  String _test = '';
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  String get test => _test;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  set test(String value) {
    _test = value;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
