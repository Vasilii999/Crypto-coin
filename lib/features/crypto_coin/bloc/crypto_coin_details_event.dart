part of 'crypto_coin_details_bloc.dart';


abstract class CryptoCoinDetailsEvent extends Equatable {}

class LoadCryptoCoinDetails extends CryptoCoinDetailsEvent {
  final String currencyCode;

  LoadCryptoCoinDetails({required this.currencyCode});

  @override
  List<Object?> get props => [currencyCode];
}