import 'package:flutter/material.dart';
import 'package:test_coinmerce/common/double_extension.dart';
import '../texts/title_1_text.dart';

class Price extends StatelessWidget {

  final double price;

  const Price({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Title1Text(price.toValueWithCurrency());
  }

}