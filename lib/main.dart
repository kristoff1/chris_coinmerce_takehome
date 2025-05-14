import 'package:flutter/material.dart';
import 'package:test_coinmerce/datasource/parsers/coin_parsers/coin_parser.dart';
import 'package:test_coinmerce/datasource/repository/coin_repository.dart';
import 'package:test_coinmerce/datasource/services/search/coins_search_service_contract.dart';
import 'package:test_coinmerce/designs/themes/light_theme.dart';
import 'package:test_coinmerce/network/api/coin_api/coin_api_implementation.dart';

import 'ancestor_widget.dart';
import 'datasource/parsers/coin_parsers/coin_parser_implementation.dart';
import 'datasource/services/search/coins_search_service.dart';
import 'designs/themes/dark_theme.dart';
import 'init.dart';
import 'network/adapter/network.dart';
import 'network/adapter/network_implementation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ///Network interface
  final Network network = NetworkImplementation();
  late final CoinApiImplementation coinApi =
      CoinApiImplementation(adapter: network);

  ///Initiate all services and repositories
  late final CoinRepository coinRepository = CoinRepository(
    coinApi: coinApi,
    coinParser: CoinParserImplementation(),
  );
  late final CoinSearchServiceContract coinService = CoinSearchService(
    coinRepository: coinRepository,
  );

  ///By default, the app will use light theme
  bool _isDarkTheme = false;

  ///By default, the app will use light theme
  ThemeData get _themeData =>
      _isDarkTheme ? CoinmerceDarkTheme.darkTheme : CoinmerceLightTheme.lightTheme;

  @override
  Widget build(BuildContext context) {
    return AncestorWidget(
      theme: _themeData,
      toggleTheme: _toggleTheme,
      coinService: coinService,
      child: MaterialApp(
        title: 'DTT Real Estate',
        theme: _themeData,
        debugShowCheckedModeBanner: false,
        home: Init(
          networkInterface: network,
        ),
      ),
    );
  }

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }
}
