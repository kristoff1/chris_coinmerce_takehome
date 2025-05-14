import 'package:test_coinmerce/pages/coin_page/parameters/coin_page_state_parameters.dart';

abstract class CoinPageState {
  final CoinPageStateParameters parameters;
  final String message;

  CoinPageState({required this.parameters, required this.message});

  CoinPageStateParameters getParameters() => parameters;

}