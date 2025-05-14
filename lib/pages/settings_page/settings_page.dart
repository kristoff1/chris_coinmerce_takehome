import 'package:flutter/material.dart';
import 'package:test_coinmerce/ancestor_widget.dart';
import 'package:test_coinmerce/designs/atoms/page_title.dart';
import 'package:test_coinmerce/designs/styles/margins.dart';
import 'package:test_coinmerce/designs/texts/title_3_text.dart';
import 'package:test_coinmerce/designs/themes/dark_theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      //create switch to toggle theme
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageTitle(title: 'GENERAL SETTINGS'),
          Padding(
              padding: regularMargin,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Title3Text('Dark Theme'),
                  Switch(
                    value: AncestorWidget.of(context).theme ==
                        CoinmerceDarkTheme.darkTheme,
                    onChanged: (value) {
                      AncestorWidget.of(context).toggleTheme();
                    },
                    thumbColor: WidgetStateProperty.all<Color>(
                      Theme.of(context).colorScheme.inversePrimary,
                    ),
                    trackColor: WidgetStateProperty.all<Color>(
                      Colors.grey,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
