// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinDetailsAdapter extends TypeAdapter<CryptoCoinDetails> {
  @override
  final int typeId = 1;

  @override
  CryptoCoinDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoinDetails(
      price: fields[0] as double,
      highday: fields[1] as double,
      lowday: fields[2] as double,
      tosymbol: fields[3] as String,
      imageUrl: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoinDetails obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.highday)
      ..writeByte(2)
      ..write(obj.lowday)
      ..writeByte(3)
      ..write(obj.tosymbol)
      ..writeByte(4)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetails _$CryptoCoinDetailsFromJson(Map<String, dynamic> json) =>
    CryptoCoinDetails(
      price: (json['PRICE'] as num).toDouble(),
      highday: (json['HIGHDAY'] as num).toDouble(),
      lowday: (json['LOWDAY'] as num).toDouble(),
      tosymbol: json['TOSYMBOL'] as String,
      imageUrl: json['IMAGEURL'] as String,
    );

Map<String, dynamic> _$CryptoCoinDetailsToJson(CryptoCoinDetails instance) =>
    <String, dynamic>{
      'PRICE': instance.price,
      'HIGHDAY': instance.highday,
      'LOWDAY': instance.lowday,
      'TOSYMBOL': instance.tosymbol,
      'IMAGEURL': instance.imageUrl,
    };
