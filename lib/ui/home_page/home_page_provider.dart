import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  String _test = '';

  String get test => _test;

  set test(String value) {
    _test = value;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

}