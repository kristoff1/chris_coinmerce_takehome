import 'package:flutter/material.dart';

import '../styles/margins.dart';
import '../texts/title_1_text.dart';

///A text widget that specializes in displaying a page title
class PageTitle extends StatelessWidget {
  const PageTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: regularMargin, child: Title1Text(title),);
  }
}