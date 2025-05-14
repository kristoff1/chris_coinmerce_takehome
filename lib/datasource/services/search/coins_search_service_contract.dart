import 'package:test_coinmerce/datasource/data/coin/coin_data.dart';

abstract class CoinSearchServiceContract {
  Future<List<CoinData>> getCoins();
}