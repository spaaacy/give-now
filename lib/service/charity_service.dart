
import 'package:latlng/latlng.dart';

import '../data/charity.dart';

final List<dynamic> charityList = [
  Charity(
    title: 'Standard Chartered',
    description:
    'Standard Chartered is a reputable international bank committed to making a positive and lasting impact on society. Through its charitable initiatives, Standard Chartered strives to create a better future for communities around the world',
    image:
    'https://scontent.fkul10-1.fna.fbcdn.net/v/t39.30808-6/339740568_746157476919433_5396382582645391439_n.png?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=OWE3V2eKIzkAX_NBL2x&_nc_ht=scontent.fkul10-1.fna&oh=00_AfCoalNwqCL0P4XU5rB8rVcwJuMdUXcnvqbYKADFoNBX9g&oe=64A93BD6',
    distance: 1.5,
    donationGoal: 50000,
    currentDonation: 40000,
    latitudeLongitude: const LatLng(
      3.156390000837918,
      101.69530158096654,
    ),
  ),
  Charity(
    title: 'World Health Organization (WHO)',
    description:
    "The World Health Organization (WHO) is a global organization dedicated to promoting health, preventing diseases, and improving the well-being of all people worldwide.",
    image:
    'https://delinkage.org/wp-content/uploads/2017/04/who-logo.jpg',
    distance: 2.5,
    donationGoal: 50000,
    currentDonation: 39000,
    latitudeLongitude: const LatLng(
      3.15082121192776,
      101.70225056293401,
    ),
  ),
  Charity(
    title: 'SOLS 24/7',
    description:
    "SOLS 24/7 is a non-profit organization dedicated to transforming lives and communities through education and social empowerment.",
    image:
    'https://upload.wikimedia.org/wikipedia/commons/d/d8/Science_of_Life_Studies_Logo_big.jpg',
    distance: 5.0,
    donationGoal: 35000,
    currentDonation: 36128,
    latitudeLongitude: const LatLng(
      3.055512832758655,
      101.70059358234609,
    ),
  ),
  Charity(
    title: 'Malaysian CARE',
    description:
    "Malaysian Care is a charitable organization committed to serving the needs of marginalized and disadvantaged communities in Malaysia",
    image:
    'https://scontent.fkul10-1.fna.fbcdn.net/v/t39.30808-6/348253103_1869960913384280_6408209286534822697_n.png?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=nMjIS0e2iRkAX_MW4Te&_nc_ht=scontent.fkul10-1.fna&oh=00_AfDHH89QjE4cdEXwLwBVmp0vRf8A0ua3C-Ig0EOkHVR8Qg&oe=64AA4FEC',
    distance: 5.5,
    donationGoal: 35000,
    currentDonation: 36128,
    latitudeLongitude: const LatLng(
      3.149360971179684,
      101.69364170550686,
    ),
  ),
  Charity(
    title: 'MERCY MISSION',
    description:
    "Mercy Mission Malaysia is a charitable organization dedicated to providing relief, empowerment, and sustainable solutions to individuals and communities in need.",
    image:
    'https://www.mercymission.my/wp-content/uploads/2020/09/mercy-mission-favicon.png',
    distance: 8.3,
    donationGoal: 35000,
    currentDonation: 36128,
    latitudeLongitude: const LatLng(
      3.1573311390094125,
      101.711494489058,
    ),
  ),
];