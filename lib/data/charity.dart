import 'package:hive_flutter/adapters.dart';
import 'package:latlng/latlng.dart';

part 'charity.g.dart';

@HiveType(typeId: 0)
class Charity extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final double distance;
  @HiveField(4)
  final double donationGoal;
  @HiveField(5)
  final double currentDonation;
  @HiveField(6)
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

class LatLngAdapter extends TypeAdapter<LatLng> {
  @override
  int typeId = 1;

  @override
  LatLng read(BinaryReader reader) {
    return LatLng(reader.read(), reader.read());
  }

  @override
  void write(BinaryWriter writer, LatLng obj) {
    writer
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude);
  }
}
