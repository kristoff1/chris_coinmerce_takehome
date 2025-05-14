import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:test_coinmerce/designs/atoms/connectivity_indicator.dart';
import 'package:test_coinmerce/designs/atoms/page_title.dart';
import 'package:test_coinmerce/designs/fields/coin_search_bar.dart';
import 'package:test_coinmerce/designs/styles/margins.dart';

import 'coin_page_contract.dart';
import 'state_views/error_state_view.dart';
import 'state_views/loaded_state_view.dart';
import 'state_views/loading_state_view.dart';
import 'state_views/no_result_state_view.dart';
import 'states/coin_page_empty_state.dart';
import 'states/coin_page_error_state.dart';
import 'states/search_page_loaded_state.dart';
import 'states/search_page_loading_state.dart';
import 'states/coin_page_state.dart';

///Search page that loads the list of coins
///The search bar is in a separate widget [CoinSearchBar]
///The connectivity indicator is in a separate widget [ConnectivityIndicator]
class CoinPage extends StatefulWidget {

  final CoinPageContract viewModel;

  const CoinPage({
    super.key,
    required this.viewModel,
  });

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {

  @override
  void initState() {
    //get all the coins from the api
    widget.viewModel.getAllCoins();
    super.initState();
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*Using CustomScrollView to arrange the header
    and the list of coin
    in a continuous list*/
    return RefreshIndicator(
      onRefresh: () async {
        //refresh the data
        await widget.viewModel.getAllCoins();
      },
      child: CustomScrollView(
        slivers: [
          _getHeader(),
          _getConnectivityIndicator(),
          //Using stream builder, so the main widget can be reactive
          StreamBuilder<CoinPageState>(
              stream: widget.viewModel.coinPageController.stream,
              builder: (
                  BuildContext context,
                  AsyncSnapshot<CoinPageState> snapshot,
                  ) {
                CoinPageState? state = snapshot.data;
                if (state == null) {
                  return _getBlankView();
                }
                switch (state.runtimeType) {
                  case const (CoinPageLoadingState):
                    return LoadingStateView(
                      models: state.parameters.coins,
                    );
                  case const (CoinPageEmptyState):
                    return NoResultStateView(
                      errorMessage: state.message,
                    );
                  case const (CoinPageLoadedState):
                    return LoadedStateView(
                      parameters: state.getParameters(),
                    );
                  case const (CoinPageErrorState):
                    return ErrorStateView(
                      errorMessage: state.message,
                      models: state.parameters.coins,
                    );
                  default:
                    return _getBlankView();
                }
              }),
        ],
      ),
    );
  }

  ///Displays the header title
  SliverToBoxAdapter _getHeader() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: PageTitle(
                title: 'Coinmerce',
              )),
          StreamBuilder<CoinPageState>(
              stream: widget.viewModel.coinPageController,
              builder: (
                  BuildContext context,
                  AsyncSnapshot<CoinPageState> snapshot,
                  ) {
                return AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Padding(
                    padding: regularMargin,
                    child: _getSearchBarView(snapshot.data),
                  ),
                  crossFadeState: snapshot.data is CoinPageLoadingState
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 750),
                );
              }),
        ],
      ),
    );
  }

  ///Displays the search view
  Widget _getSearchBarView(CoinPageState? state) {
    if (state is CoinPageLoadedState || state is CoinPageEmptyState) {
      return CoinSearchBar(
        onQueryIssued: _searchForCoins,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  ///Displays the connectivity status
  ///If the user is offline, it displays a message
  StreamBuilder<List<ConnectivityResult>> _getConnectivityIndicator() {
    return StreamBuilder<List<ConnectivityResult>>(
        stream: widget.viewModel.connectivityStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<ConnectivityResult>> snapshot) {
          if (snapshot.hasData) {
            ConnectivityResult? result = snapshot.data?.firstWhere(
              (ConnectivityResult element) =>
                  element == ConnectivityResult.wifi ||
                  element == ConnectivityResult.mobile,
              orElse: () => ConnectivityResult.none,
            );
            if (result == ConnectivityResult.none) {
              return const SliverToBoxAdapter(
                child: ConnectivityIndicator(),
              );
            }
          }
          return const SliverToBoxAdapter(
            child: SizedBox.shrink(),
          );
        });
  }

  void _searchForCoins(String query) {
    widget.viewModel.getCoinsByQuery(query);
  }

  ///Default blank view
  ///Is not supposed to be displayed
  ///because the initial state would always be seeded
  ///with LoadingState
  SliverToBoxAdapter _getBlankView() {
    return const SliverToBoxAdapter(
      child: Center(
        child: SizedBox.shrink(),
      ),
    );
  }
}
