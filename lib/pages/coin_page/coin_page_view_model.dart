import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_coinmerce/datasource/data/coin/coin_data.dart';
import 'package:test_coinmerce/datasource/services/search/coins_search_service_contract.dart';
import 'package:test_coinmerce/models/coin_models.dart';
import 'package:test_coinmerce/pages/coin_page/parameters/coin_page_state_parameters.dart';
import 'package:test_coinmerce/pages/coin_page/states/coin_page_empty_state.dart';
import 'package:test_coinmerce/pages/coin_page/states/coin_page_error_state.dart';
import 'package:test_coinmerce/pages/coin_page/states/coin_page_state.dart';
import 'package:test_coinmerce/pages/coin_page/states/search_page_loaded_state.dart';
import 'package:test_coinmerce/pages/coin_page/states/search_page_loading_state.dart';
import 'dart:developer' as developer;

import 'coin_page_contract.dart';

class CoinPageViewModel extends CoinPageContract {
  final CoinSearchServiceContract coinService;
  StreamSubscription? connectivityStreamSubscription;
  ///It initiates the search controller with a loading state
  ///and assign the connectivity stream to a variable.
  CoinPageViewModel({
    required this.coinService,
    //required this.searchHelper,
    //required this.locationPermissionHandler,
  }) {
    coinPageController = BehaviorSubject<CoinPageState>.seeded(
      CoinPageLoadingState(),
    );
    connectivityStream = Connectivity().onConnectivityChanged;
  }

  final List<CoinModel> listOfAllCoins = [];

  ///This function asks user location permission,
  ///gets the user's location
  ///and loads the data from the network.
  @override
  Future<void> getAllCoins() async {
    developer.log('getAllCoins');
    try {
      await _setPageToLoad();
      await _loadDataFromNetwork();
    } catch (e) {
      coinPageController.add(
        CoinPageErrorState(
            message: e.toString(), previousData: listOfAllCoins),
      );
      _subscribeConnectivityListener();
    }
  }

  ///This function subscribes to a connectivity stream
  ///and waits for network connectivity to be re-established.
  ///
  ///When the connectivity is re-established,
  ///the getAllCoin function calls itself recursively to retry the operation.
  void _subscribeConnectivityListener() {
    connectivityStreamSubscription =
        connectivityStream.listen((List<ConnectivityResult> result) async {
          if (result.first == ConnectivityResult.wifi ||
              result.first == ConnectivityResult.mobile) {
            await _setPageToLoad();
            getAllCoins();
          }
        });
  }

  ///Gets coins by user search query
  @override
  Future<void> getCoinsByQuery(String query) async {
    List<CoinModel> filteredCoins;
    if (query.trim().isEmpty) {
      filteredCoins = listOfAllCoins;
    } else if (query.length > 1) {
      filteredCoins = _filterCoinsByQuery(
        query,
        listOfAllCoins,
      );
    } else {
      filteredCoins = listOfAllCoins;
    }
    if (filteredCoins.isEmpty) {
      coinPageController.add(
        CoinPageEmptyState(),
      );
    } else {
      coinPageController.add(
        CoinPageLoadedState(
          parameters: CoinPageStateParameters(
            coins: filteredCoins,
          ),
          message: 'Result of ',
        ),
      );
    }
  }

  ///Retrieves data from a remote server
  ///and converts it into a list of [CoinModel] objects
  Future<void> _loadDataFromNetwork() async {
    List<CoinData> coinData = await coinService.getCoins();
    ///Clear previous list
    listOfAllCoins.clear();
    List<CoinModel> coinModels = coinData.map((CoinData data) {
      return CoinModel(
        id: data.id,
        price: data.price,
        name: data.name,
        symbol: data.symbol,
        imageUrl: data.image,
        dailyPriceChange: data.priceChangePercentage24h,
      );
    }).toList();
    listOfAllCoins.addAll(coinModels);
    if (!coinPageController.isClosed) {
      coinPageController.add(
        CoinPageLoadedState(
          parameters: CoinPageStateParameters(
            coins: listOfAllCoins,
          ),
          message: 'Loaded',
        ),
      );
    }
  }


  List<CoinModel> _filterCoinsByQuery(
      String query, List<CoinModel> currentCoinList) {
    return currentCoinList.where((coin) {
      return coin.name.toLowerCase().contains(query.toLowerCase()) ||
          coin.symbol.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  ///Shows the loading view when the page is loading
  Future<void> _setPageToLoad() async {
    coinPageController.add(
      CoinPageLoadingState(
        previousData: listOfAllCoins,
      ),
    );
  }

  ///Closes all streams and subscriptions
  @override
  void dispose() {
    coinPageController.close();
    connectivityStreamSubscription?.cancel();
  }


}
