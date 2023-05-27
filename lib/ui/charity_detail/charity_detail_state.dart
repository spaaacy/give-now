import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:give_n_go/util/constants.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

import '../../data/charity.dart';

class CharityDetailState extends ChangeNotifier {
  CharityDetailState(this.charity);

  final Charity charity;
  final donationFormKey = GlobalKey<FormState>();
  final donationAmountController = TextEditingController();
  double _donationAmt = 10000.0;
  double get donationAmt => this._donationAmt;

  set donationAmt(double value) => this._donationAmt = value;

  String get formattedDonationAmt {
    final currencyFormatter =
        NumberFormat.currency(locale: 'en_MY', symbol: 'RM ');
    return currencyFormatter.format(_donationAmt);
  }
}
