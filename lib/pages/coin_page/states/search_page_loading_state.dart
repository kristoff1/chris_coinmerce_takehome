import 'package:test_coinmerce/models/coin_models.dart';
import 'package:test_coinmerce/pages/coin_page/parameters/coin_page_state_parameters.dart';
import 'package:test_coinmerce/pages/coin_page/states/coin_page_state.dart';

class CoinPageLoadingState extends CoinPageState {
  CoinPageLoadingState({List<CoinModel> previousData = const []})
      : super(
          parameters: CoinPageStateParameters(coins: previousData),
          message: 'Loading...',
        );
}
