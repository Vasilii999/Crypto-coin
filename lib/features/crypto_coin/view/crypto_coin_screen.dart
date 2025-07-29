import 'package:auto_route/auto_route.dart';
import 'package:crypto_coin/features/crypto_coin/bloc/crypto_coin_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:crypto_coin/repositories/crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  // late final CryptoCoin coin;

  final _cryptoBloc = CryptoCoinDetailsBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoBloc.add(LoadCryptoCoinDetails(currencyCode: widget.coin.name));
    super.initState();
  }


// @override
//   void didChangeDependencies() {
//    final args = ModalRoute.of(context)?.settings.arguments;
//
//    if(args is CryptoCoin){
//      coin = args;
//      _cryptoBloc.add(LoadCryptoCoinDetails(coin.name));
//    }
//    super.didChangeDependencies();
//   }

  @override
  Widget build(BuildContext context) {
  final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
        bloc: _cryptoBloc,
        builder: (context, state) {
          if(state is CryptoCoinDetailsLoading){
            return Center(child: CircularProgressIndicator());
          }
          if(state is CryptoCoinDetailsLoaded){
            final coin = state.coin;
            final coinDetails = coin.details;
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Image.network(coinDetails.fullImageUrl),
                    Text(coin.name,style: theme.textTheme.headlineLarge,),
                    SizedBox(height: 20,),
                    Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.black54),
                        child: Center(child: Text('${coinDetails.price} \$',style: theme.textTheme.headlineLarge,))),
                    SizedBox(height: 20,),
                    Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.black54),
                        child: Center(child: Text('${coinDetails.highday} \$',style: theme.textTheme.headlineLarge,))),
                    SizedBox(height: 20,),
                    Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.black54),
                        child: Center(child: Text('${coinDetails.lowday} \$',style: theme.textTheme.headlineLarge,))),
                    SizedBox(height: 20,),
                    Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.black54),
                        child: Center(child: Text('${coinDetails.tosymbol} \$',style: theme.textTheme.headlineLarge,))),
                  ],
                ),
              ),
            );
          }
          return Center(child: Text('Нет данных'),);
        },
      )
      

    );
  }
}
