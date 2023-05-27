import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../service/location_service.dart';

class HomePageState extends ChangeNotifier {

  double _accountBalance = 10000.0;
  double get accountBalance => this._accountBalance;

  set accountBalance(double value) => this._accountBalance = value;

  String get formattedAccountBalance {
    final currencyFormatter =
        NumberFormat.currency(locale: 'en_MY', symbol: 'RM ');
    return currencyFormatter.format(_accountBalance);
  }

  void addToBalance(double amount) {
    _accountBalance += amount;
    notifyListeners();
  }

  void subtractFromBalance(double amount) {
    _accountBalance -= amount;
    notifyListeners();
  }


}
