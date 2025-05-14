import 'package:flutter/material.dart';
import 'package:test_coinmerce/designs/styles/margins.dart';
import 'package:test_coinmerce/designs/texts/body_text.dart';

///Showing no result view and the error message
class NoResultStateView extends StatelessWidget {
  final String errorMessage;

  const NoResultStateView({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
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

}