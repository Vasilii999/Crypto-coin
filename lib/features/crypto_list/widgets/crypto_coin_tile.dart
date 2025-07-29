import 'package:auto_route/auto_route.dart';
import 'package:crypto_coin/repositories/crypto_coins.dart';
import 'package:crypto_coin/router/router.dart';
import 'package:crypto_coin/theme/theme.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({super.key,required this.coin,});

  final CryptoCoin coin;



  @override
  Widget build(BuildContext context) {
    final coinDetails = coin.details;
    return ListTile(
      leading: Image.network(coinDetails.fullImageUrl,height: 48,),
      title: Text(
        coin.name,
        style: darkTheme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${coinDetails.price}\$',
        style: darkTheme.textTheme.labelSmall,
      ),
      trailing: Icon(Icons.arrow_back_ios),
      onTap: () {
        AutoRouter.of(context).push(CryptoCoinRoute(coin: coin));

        // Navigator.of(context).pushNamed(
        //   '/coin',
        //   arguments: coin,
        // );
      },
    );
  }
}
