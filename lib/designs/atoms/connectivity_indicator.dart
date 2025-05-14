import 'package:flutter/material.dart';
import 'package:test_coinmerce/designs/texts/subtitle_text.dart';
import 'package:test_coinmerce/designs/texts/title_3_text.dart';

///Showing no connection view and the error message
class ConnectivityIndicator extends StatelessWidget {
  const ConnectivityIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Title3Text('No Internet Connection!'),
        SubtitleText('(All shown data are probably outdated)'),
      ],
    );
  }

}