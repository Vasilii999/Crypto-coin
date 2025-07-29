part of 'crypto_coin_details_bloc.dart';

abstract class CryptoCoinDetailsState extends Equatable{}

class CryptoCoinInitial extends CryptoCoinDetailsState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinDetailsLoading extends CryptoCoinDetailsState{
  @override
  List<Object?> get props => [];
}

class CryptoCoinDetailsLoaded extends CryptoCoinDetailsState {
  CryptoCoinDetailsLoaded(this.coin);

  final CryptoCoin coin;


  @override
  List<Object?> get props => [coin];
}

class CryptoCoinDetailsLoadingFailure extends CryptoCoinDetailsState{
  @override
  List<Object?> get props => [];
}