import 'package:flutter/material.dart';
import 'package:test_coinmerce/designs/atoms/connectivity_indicator.dart';
import 'package:test_coinmerce/designs/coin_list_item.dart';
import 'package:test_coinmerce/designs/styles/margins.dart';
import 'package:test_coinmerce/designs/texts/body_text.dart';
import 'package:test_coinmerce/models/coin_models.dart';

///Shows the error message when data is not loaded
///If previous data is available, it will show them to the user
class ErrorStateView extends StatelessWidget {
  final String errorMessage;
  final List<CoinModel> models;

  const ErrorStateView({
    super.key,
    required this.errorMessage,
    this.models = const [],
  });

  @override
  Widget build(BuildContext context) {
    ///Show users previous data if available
    if (models.isEmpty) {
      return SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/coinmerce-logo.webp',
              height: 300,
              width: 300,
            ),
            verticalSpacer,
            BodyText(errorMessage),
          ],
        ),
      );
    }
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: models.length + 1,
      (context, index) {
        if (index == 0) {
          return const Padding(
            padding: regularMargin,
            child: ConnectivityIndicator(),
          );
        }
        return CoinListItem(
            key: ValueKey(models[index]),
            model: models[index - 1],
            onSelected: (CoinModel coinModel) {
              //_goToDetailPage(context, coinModel);
            });
      },
    ));
  }

  // Future<dynamic> _goToDetailPage(
  //   BuildContext context,
  //   CoinModel coinModel,
  // ) {
  //   return Navigator.push(context,
  //       MaterialPageRoute(builder: (BuildContext context) {
  //     return ItemDetailPage(
  //       coinModel: coinModel,
  //     );
  //   }));
  // }
}
