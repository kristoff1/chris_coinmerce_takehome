import 'package:test_coinmerce/datasource/data/coin/coin_data.dart';
import 'package:test_coinmerce/datasource/services/search/coins_search_service_contract.dart';

///Only for testing purposes without any API
class CoinSearchTestService extends CoinSearchServiceContract {
  @override
  Future<List<CoinData>> getCoins() {
    return Future.value([
      CoinData(
        id: '1',
        price: 100.0,
        name: 'Bitcoin',
        symbol: 'BTC',
        image: 'url',
        priceChangePercentage24h: 5.0,
      ),
      CoinData(
        id: '2',
        price: 200.0,
        name: 'Ethereum',
        symbol: 'ETH',
        image: 'url',
        priceChangePercentage24h: 3.0,
      ),
    ]);
  }

  @override
  Future<List<double>> getChart(String coinId) {

    throw UnimplementedError();
  }

}