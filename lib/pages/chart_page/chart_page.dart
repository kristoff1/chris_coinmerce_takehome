import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ChartPageState();
  }

}

class _ChartPageState extends State<ChartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This is the chart page'),
      ),
    );
  }
}

