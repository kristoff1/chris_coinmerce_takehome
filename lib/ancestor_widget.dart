import 'package:flutter/material.dart';
import 'package:test_coinmerce/datasource/services/search/coins_search_service_contract.dart';

///Ancestor widget that can be accessed by all widgets in the widget tree
class AncestorWidget extends InheritedWidget {
  ///Theme switcher
  final ThemeData theme;
  final VoidCallback toggleTheme;
  final CoinSearchServiceContract coinService;

  const AncestorWidget({super.key,
    required this.theme,
    required this.toggleTheme,
    required this.coinService,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    ///Handles theme changes
    return (oldWidget as AncestorWidget).theme != theme;
  }

  static AncestorWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AncestorWidget>()!;
  }
}