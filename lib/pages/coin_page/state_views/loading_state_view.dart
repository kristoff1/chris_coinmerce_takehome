import 'package:flutter/material.dart';
import 'package:test_coinmerce/designs/coin_list_item.dart';
import 'package:test_coinmerce/designs/styles/margins.dart';
import 'package:test_coinmerce/designs/texts/title_3_text.dart';
import 'package:test_coinmerce/models/coin_models.dart';

class LoadingStateView extends StatelessWidget {
  final List<CoinModel> models;

  const LoadingStateView({super.key, this.models = const []});

  @override
  Widget build(BuildContext context) {
    ///Show user's previous data if available
    ///so the user have something to see
    ///while waiting for the new data to load
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: models.length + 1,
      (context, index) {
        if (index == 0) {
          return const SizedBox(
            height: 120,
            child: Padding(
              padding: regularMargin,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  bigHorizontalSpacer,
                  Title3Text('Loading...'),
                ],
              ),
            ),
          );
        }
        return CoinListItem(
            model: models[index - 1], onSelected: (CoinModel coinModel) {
            SnackBar snackBar = _getWaitingSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      },
    ));
  }

  ///Prevent the user from interacting
  ///until the page is finished loading
  SnackBar _getWaitingSnackBar() {
    SnackBar snackBar = const SnackBar(
      content: Text('Please wait for the data to load'),
      duration: Duration(milliseconds: 750),
    );
    return snackBar;
  }
}
