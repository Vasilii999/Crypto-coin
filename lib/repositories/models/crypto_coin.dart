
import 'package:crypto_coin/repositories/crypto_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part 'crypto_coin.g.dart';

@HiveType(typeId: 2)
class CryptoCoin extends Equatable{
  const CryptoCoin({
    required this.name,
    required this.details,

  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final CryptoCoinDetails details;


  @override
  List<Object?> get props => [name, details];
}







//factory CryptoCoin.fromRawJson(String name, Map<String, dynamic> json) {
//     return CryptoCoin(
//       name: name,
//       priceInUSD: (json['PRICE'] as num).toDouble(),
//       imageUrl: 'https://www.cryptocompare.com${json['IMAGEURL']}',
//     );
