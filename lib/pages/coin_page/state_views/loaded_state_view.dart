import 'package:flutter/material.dart';
import 'package:test_coinmerce/ancestor_widget.dart';
import 'package:test_coinmerce/designs/coin_list_item.dart';
import 'package:test_coinmerce/models/coin_models.dart';
import 'package:test_coinmerce/pages/chart_page/chart_page.dart';
import 'package:test_coinmerce/pages/coin_page/parameters/coin_page_state_parameters.dart';

///The view when data is successfully loaded
class LoadedStateView extends StatelessWidget {
  final CoinPageStateParameters parameters;

  const LoadedStateView({
    super.key,
    required this.parameters,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: parameters.coins.length,
        (context, index) {
          return CoinListItem(
              key: ValueKey(parameters.coins[index]),
              model: parameters.coins[index],
              onSelected: (CoinModel model) {
                _goToDetailPage(context, model);
              });
        },
      ),
    );
  }

  Future<dynamic> _goToDetailPage(
    BuildContext context,
    CoinModel model,
  ) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return ChartPage(
        heroId: model.id,
        coinModel: model,
        coinSearchService: AncestorWidget.of(context).coinService,
      );
    }));
  }
}
