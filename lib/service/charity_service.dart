import 'package:give_n_go/util/constants.dart';
import 'package:hive_flutter/adapters.dart';

import '../data/charity.dart';

Future<void> initializeData() async {
  final box = Hive.box('box');

  if (box.get(hiveCharity) == null) {
    await box.put(
      hiveCharity,
      [
        Charity(
          title: 'Standard Chartered',
          description: sampleDescription,
          image: 'asdf',
          distance: 0.5,
        ),
        Charity(
          title: 'World Health Organization (WHO)',
          description: sampleDescription,
          image: 'asdf',
          distance: 0.5,
        ),
        Charity(
          title: 'SOLS 24/7',
          description: sampleDescription,
          image: 'asdfasfsdfsdf',
          distance: 1.0,
        )
      ]

    );
  }
}
