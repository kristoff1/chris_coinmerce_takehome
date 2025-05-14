import 'package:test_coinmerce/models/coin_models.dart';
import 'package:test_coinmerce/pages/coin_page/parameters/coin_page_state_parameters.dart';

import 'coin_page_state.dart';

class CoinPageErrorState extends CoinPageState {
  CoinPageErrorState({
    required super.message,
    List<CoinModel> previousData = const [],
  }) : super(parameters: CoinPageStateParameters(coins: previousData));
}
