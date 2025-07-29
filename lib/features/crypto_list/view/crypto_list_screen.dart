import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_coin/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_coin/repositories/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../widgets/widgets.dart';


@RoutePage()
class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies List'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _cryptoListBloc.add(LoadCryptoList(completer: completer));
          completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                  itemCount: state.coinsList.length,
                  separatorBuilder: (context, index) => const Divider(height: 1,),
                  itemBuilder: (context, i) {
                    final coin = state.coinsList[i];
                    final coinName = coin.name;
                    return CryptoCoinTile(
                      coin: CryptoCoin(
                          name: coinName,
                          details: coin.details,
                      ),
                    );
                  });
            }
            if(state is CryptoListLoadingFailure){
              return Center(
                child: Column(
                  children: [
                    Text('Ошибка',style: theme.textTheme.headlineLarge),
                    Text('Попробуйте позже',style: theme.textTheme.labelSmall,),
                    const SizedBox(height: 32,),
                    TextButton(
                      onPressed: (){
                        _cryptoListBloc.add(LoadCryptoList());
                      },
                        child: Text('Попробовать снова'),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
