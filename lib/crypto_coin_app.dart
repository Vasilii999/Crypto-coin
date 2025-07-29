import 'package:crypto_coin/router/router.dart';
import 'package:crypto_coin/theme/theme.dart';
import 'package:flutter/material.dart';

class CryptoCoinApp extends StatefulWidget {
  const CryptoCoinApp({super.key});

  @override
  State<CryptoCoinApp> createState() => _CryptoCoinAppState();
}

class _CryptoCoinAppState extends State<CryptoCoinApp> {

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: _appRouter.config(),
    );
  }
}