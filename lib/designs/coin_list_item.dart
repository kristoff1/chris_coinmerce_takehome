import 'package:flutter/material.dart';
import 'package:test_coinmerce/designs/atoms/coin_image.dart';
import 'package:test_coinmerce/designs/styles/decorations.dart';
import 'package:test_coinmerce/designs/styles/dimensions.dart';
import 'package:test_coinmerce/designs/styles/margins.dart';
import 'package:test_coinmerce/designs/texts/title_3_text.dart';

import '../models/coin_models.dart';
import 'atoms/price.dart';
import 'texts/body_text.dart';

///The list item
class CoinListItem extends StatelessWidget {
  final CoinModel model;
  final Function(CoinModel model) onSelected;

  const CoinListItem({
    super.key,
    required this.model,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(model);
      },
      child: Container(
        height: cardListHeight,
        margin: centerFocusMargin,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(cardRadius)),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  padding: regularMargin,
                  child: CoinImage(
                    imagePath: model.imageUrl,
                    id: model.id,
                  ),
                )),
            Expanded(
              flex: 7,
              child: Padding(
                padding: regularMargin,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Price(price: model.price),
                    Title3Text(
                      //model name + symbol
                      '${model.name} (${model.symbol.toUpperCase()})',
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BodyText(
                          '24h Change',
                          textAlign: TextAlign.start,
                        ),
                        horizontalSpacer,
                        BodyText(
                          convertToPercentage(model.dailyPriceChange),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            horizontalSpacer,
          ],
        ),
      ),
    );
  }

  String convertToPercentage(double value) {
    return '${value.toStringAsFixed(2)}%';
  }

}
