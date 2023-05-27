import 'package:hive_flutter/adapters.dart';
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

  Charity({
    required this.title,
    required this.description,
    required this.image,
    required this.distance,
  });
}
