// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharityAdapter extends TypeAdapter<Charity> {
  @override
  final int typeId = 0;

  @override
  Charity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Charity(
      title: fields[0] as String,
      description: fields[1] as String,
      image: fields[2] as String,
      distance: fields[3] as double,
      donationGoal: fields[4] as double,
      currentDonation: fields[5] as double,
      latitudeLongitude: fields[6] as LatLng,
    );
  }

  @override
  void write(BinaryWriter writer, Charity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.distance)
      ..writeByte(4)
      ..write(obj.donationGoal)
      ..writeByte(5)
      ..write(obj.currentDonation)
      ..writeByte(6)
      ..write(obj.latitudeLongitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
