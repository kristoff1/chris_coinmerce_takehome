import 'package:test_coinmerce/datasource/data/coin/coin_data.dart';
import 'package:test_coinmerce/network/api/coin_api/coin_api.dart';
import '../parsers/coin_parsers/coin_parser.dart';
import 'coin_repository_contract.dart';

class CoinRepository extends CoinRepositoryContract {
  final CoinApi coinApi;
  final CoinParser coinParser;

  ///CoinRepository instance is created in [DatasourceInitiator]
  ///and all the dependencies are injected
  CoinRepository(
      {required this.coinApi,
      required this.coinParser});

  @override
  Future<List<CoinData>> getCoins() async {
    try {
      List<Map<String, dynamic>> results = await coinApi.getList();
      return coinParser.getCoinsFromJson(results);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}
