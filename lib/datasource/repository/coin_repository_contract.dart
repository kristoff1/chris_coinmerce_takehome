import 'package:test_coinmerce/datasource/data/coin/coin_data.dart';

abstract class CoinRepositoryContract {

  Future<List<CoinData>> getCoins();

  Future<List<double>> getChart(String coinId);

}