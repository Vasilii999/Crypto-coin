import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CryptoCoinDetails extends Equatable{
  const CryptoCoinDetails({
    required this.price,
    required this.highday,
    required this.lowday,
    required this.tosymbol,
    required this.imageUrl,
  });
  @HiveField(0)
  @JsonKey(name: 'PRICE')
  final double price;

  @HiveField(1)
  @JsonKey(name: 'HIGHDAY')
  final double highday;

  @HiveField(2)
  @JsonKey(name: 'LOWDAY')
  final double lowday;

  @HiveField(3)
  @JsonKey(name: 'TOSYMBOL')
  final String tosymbol;

  @HiveField(4)
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';

  factory CryptoCoinDetails.fromJson(Map<String, dynamic> json) => _$CryptoCoinDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailsToJson(this);

  @override
  List<Object?> get props => [price, highday, lowday, tosymbol, imageUrl,];


}
