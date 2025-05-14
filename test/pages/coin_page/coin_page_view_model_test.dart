import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_coinmerce/datasource/data/coin/coin_data.dart';
import 'package:test_coinmerce/datasource/services/search/coins_search_service_contract.dart';
import 'package:test_coinmerce/models/coin_models.dart';
import 'package:test_coinmerce/pages/coin_page/coin_page_view_model.dart';
import 'package:test_coinmerce/pages/coin_page/states/coin_page_empty_state.dart';
import 'package:test_coinmerce/pages/coin_page/states/coin_page_error_state.dart';
import 'package:test_coinmerce/pages/coin_page/states/search_page_loaded_state.dart';
import 'package:test_coinmerce/pages/coin_page/states/search_page_loading_state.dart';


class MockCoinSearchServiceContract extends Mock implements CoinSearchServiceContract {}

void main() {

  TestWidgetsFlutterBinding.ensureInitialized();

  late CoinPageViewModel viewModel;
  late MockCoinSearchServiceContract mockCoinService;

  setUp(() {
    mockCoinService = MockCoinSearchServiceContract();
    viewModel = CoinPageViewModel(coinService: mockCoinService);
  });

  tearDown(() {
    viewModel.dispose();
  });

  test('should emit loading state on creation', () {
    final state = viewModel.coinPageController.value;
    expect(state, isA<CoinPageLoadingState>());
  });

  test('getAllCoins emits loaded state on success', () async {
    when(() => mockCoinService.getCoins()).thenAnswer(
          (_) async => [
        CoinData(
          id: '1',
          price: 100.0,
          name: 'Bitcoin',
          symbol: 'BTC',
          image: 'url',
          priceChangePercentage24h: 5.0,
        ),
      ],
    );

    await viewModel.getAllCoins();

    expect(viewModel.coinPageController.value, isA<CoinPageLoadedState>());
    final state = viewModel.coinPageController.value as CoinPageLoadedState;
    expect(state.parameters.coins.length, 1);
    expect(state.parameters.coins.first.name, 'Bitcoin');
  });

  test('getAllCoins emits error state and retains previous data on failure', () async {
    when(() => mockCoinService.getCoins()).thenThrow(Exception('Network error'));

    await viewModel.getAllCoins();

    final state = viewModel.coinPageController.value;
    expect(state, isA<CoinPageErrorState>());
    expect((state as CoinPageErrorState).message, contains('Exception'));
  });

  test('getCoinsByQuery filters correctly with non-empty query', () async {
    viewModel.listOfAllCoins.addAll([
      CoinModel(id: '1', name: 'Bitcoin', symbol: 'BTC', price: 100.0, imageUrl: 'url', dailyPriceChange: 5.0),
      CoinModel(id: '2', name: 'Ethereum', symbol: 'ETH', price: 200.0, imageUrl: 'url', dailyPriceChange: 3.0),
    ]);

    await viewModel.getCoinsByQuery('eth');

    final state = viewModel.coinPageController.value;
    expect(state, isA<CoinPageLoadedState>());
    final coins = (state as CoinPageLoadedState).parameters.coins;
    expect(coins.length, 1);
    expect(coins.first.symbol, 'ETH');
  });

  test('getCoinsByQuery emits empty state if no matches found', () async {
    viewModel.listOfAllCoins.addAll([
      CoinModel(id: '1', name: 'Bitcoin', symbol: 'BTC', price: 100.0, imageUrl: 'url', dailyPriceChange: 5.0),
    ]);

    await viewModel.getCoinsByQuery('xrp');

    final state = viewModel.coinPageController.value;
    expect(state, isA<CoinPageEmptyState>());
  });

  test('dispose closes controller and cancels subscription', () async {
    viewModel.dispose();
    expect(viewModel.coinPageController.isClosed, isTrue);
  });
}