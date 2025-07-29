import 'package:crypto_coin/repositories/models/crypto_coin.dart';
import 'package:flutter/material.dart';

import '../features/crypto_coin/view/view.dart';
import '../features/crypto_list/view/view.dart';
import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CryptoListRoute.page, path: '/'),
    AutoRoute(page: CryptoCoinRoute.page),
  ];
}



// final routes = {
// '/' : (context) => const CryptoListScreen(),
// '/coin' : (context) => const CryptoCoinScreen(),
// };