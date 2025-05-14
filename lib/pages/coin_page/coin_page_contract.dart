import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_coinmerce/pages/coin_page/states/coin_page_state.dart';

abstract class CoinPageContract {

  late final BehaviorSubject<CoinPageState> coinPageController;
  late final Stream<List<ConnectivityResult>> connectivityStream;

  Future<void> getAllCoins();
  Future<void> getCoinsByQuery(String query);
  void dispose();

}