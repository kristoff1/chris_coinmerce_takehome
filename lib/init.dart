import 'package:flutter/material.dart';
import 'package:test_coinmerce/network/adapter/network.dart';

import 'designs/screens/splash_screen.dart';
import 'pages/menu/menu_page.dart';

///A class that will initiate all the global dependencies
///and configure them
///The splash screen will be shown while waiting
///Once all has been set and configured
///it will show the main page
class Init extends StatefulWidget {

  final Network networkInterface;

  const Init({
    super.key,
    required this.networkInterface,
  });

  @override
  State<StatefulWidget> createState() {
    return _InitState();
  }

}

///Initiate all the dependencies by their initiation mixins
///All of the dependencies are initiated in the init state
///The order is arranged based on the dependency tree
///This is needed to make sure all the dependencies are initiated properly
///before the app is shown
class _InitState extends State<Init> {

  bool initiated = false;

  ///Initiate all app wide objects
  @override
  void initState() {
    initiate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return initiated ? const MenuPage(
    ) : const SplashScreen();
  }

  Future<void> initiate() async {
    //set network
    widget.networkInterface.configureNetwork(
      baseUrl: 'https://api.coingecko.com/',
      timeout: 5000,
    );

    setState(() {
      initiated = true;
    });
  }

}