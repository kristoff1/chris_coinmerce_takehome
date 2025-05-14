import 'package:test_coinmerce/datasource/data/coin/coin_data.dart';
import 'package:test_coinmerce/datasource/repository/coin_repository_contract.dart';
import 'coins_search_service_contract.dart';

class CoinSearchService extends CoinSearchServiceContract {
  final CoinRepositoryContract coinRepository;

  CoinSearchService({
    required this.coinRepository,
  });

  ///This method expected to get a list of [CoinData] from the API
  ///and store it in the cache (db)
  @override
  Future<List<CoinData>> getCoins() async {
    List<CoinData> coins = await coinRepository.getCoins();
    return coins;
  }

  @override
  Future<List<double>> getChart(String coinId) async {
    List<double> chart = await coinRepository.getChart(coinId);
    return chart;
  }

}
