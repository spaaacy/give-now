import 'package:latlng/latlng.dart';

class Charity {
  final String title;
  final String description;
  final String image;
  final double distance;
  final double donationGoal;
  final double currentDonation;
  final LatLng latitudeLongitude;

  Charity({
    required this.title,
    required this.description,
    required this.image,
    required this.distance,
    required this.donationGoal,
    required this.currentDonation,
    required this.latitudeLongitude,
  });
}
