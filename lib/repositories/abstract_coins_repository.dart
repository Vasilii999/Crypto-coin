import 'package:crypto_coin/repositories/crypto_coins.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();

  Future<CryptoCoin> getCoinDetails(String currencyCode);

}
