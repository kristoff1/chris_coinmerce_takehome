import 'package:flutter/material.dart';
import 'package:test_coinmerce/ancestor_widget.dart';
import 'package:test_coinmerce/designs/atoms/main_background_layer.dart';
import 'package:test_coinmerce/pages/coin_page/coin_page.dart';
import 'package:test_coinmerce/pages/coin_page/coin_page_view_model.dart';
import 'package:test_coinmerce/pages/settings_page/settings_page.dart';

///The menu page is inside the discovery module
///Because the home page is also the part of discovery flow
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MainBackgroundLayer(
          child: _getMainWidget(context, _currentIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Theme.of(context).cardColor,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Topics'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _getMainWidget(BuildContext context, int index) {
    switch (index) {
      case 0:
        return CoinPage(
          viewModel: CoinPageViewModel(
            coinService: AncestorWidget.of(context).coinService,
          ),
        );
      case 1:
        return const SettingsPage();
      default:
        return const SizedBox.shrink();
    }
  }
}
