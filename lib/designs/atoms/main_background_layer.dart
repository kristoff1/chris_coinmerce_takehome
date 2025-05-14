import 'package:flutter/material.dart';

///A gradient background layer
///which accepts all other children widgets to stack on top of it
class MainBackgroundLayer extends StatelessWidget {
  final Widget child;

  const MainBackgroundLayer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
      ),
      child: child,
    );
  }
}
