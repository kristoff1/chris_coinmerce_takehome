import 'package:test_coinmerce/models/coin_models.dart';

///The parameters that will fill the state
///And consumed by the state view
class CoinPageStateParameters {
  final List<CoinModel> coins;

  CoinPageStateParameters({required this.coins});
}