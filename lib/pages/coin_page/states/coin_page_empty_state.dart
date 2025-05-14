import 'package:test_coinmerce/pages/coin_page/parameters/coin_page_state_parameters.dart';

import 'coin_page_state.dart';

class CoinPageEmptyState extends CoinPageState {
  CoinPageEmptyState(): super(
    parameters: CoinPageStateParameters(
      coins: const [],
    ),
    message: 'No results found, perhaps try another search?',
  );

}