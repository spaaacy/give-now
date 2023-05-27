import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:give_n_go/util/constants.dart';
import 'package:latlong2/latlong.dart';

import '../../data/charity.dart';

class CharityDetailState extends ChangeNotifier {

  CharityDetailState(this.charity);

  final Charity charity;
  final donationFormKey = GlobalKey<FormState>();
  final donationAmountController = TextEditingController();


}