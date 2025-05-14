import 'package:test_coinmerce/datasource/data/coin/coin_data.dart';

abstract class CoinParser {
  List<CoinData> getCoinsFromJson(List<Map<String, dynamic>> json);
}