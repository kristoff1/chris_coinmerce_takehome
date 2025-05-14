import 'package:flutter/material.dart';
import 'package:test_coinmerce/common/double_extension.dart';
import 'package:test_coinmerce/datasource/services/search/coins_search_service_contract.dart';
import 'package:test_coinmerce/designs/styles/margins.dart';
import 'package:test_coinmerce/designs/texts/title_3_text.dart';
import 'package:test_coinmerce/models/coin_models.dart';

///The detail page that will show the chart of the coin
class ChartPage extends StatefulWidget {
  final String? heroId;
  final CoinSearchServiceContract coinSearchService;
  final CoinModel coinModel;

  const ChartPage({
    super.key,
    required this.coinModel,
    required this.coinSearchService,
    this.heroId,
  });

  @override
  State<ChartPage> createState() => _ChartPageState();
}

///No ViewModel Required, because simple case
class _ChartPageState extends State<ChartPage> {
  List<double> prices = [];
  bool isLoading = true;
  String? errorMessage;

  Future<void> loadPrices() async {
    try {
      final result = await widget.coinSearchService.getChart(
        widget.coinModel.id,
      );
      setState(() {
        prices = result;
        isLoading = false;
      });
    } catch (_) {
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    loadPrices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).cardColor,
              ),
              child: Hero(
                tag: widget.heroId ?? '',
                child: Image.network(
                  widget.coinModel.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            verticalSpacer,
            Title3Text(
              'Daily price of ${widget.coinModel.name} (${widget.coinModel.symbol.toUpperCase()})',
            ),
            Container(
              margin: regularHorizontalMargin,
              padding: regularMargin,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).cardColor,
              ),
              child: _buildChart(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChart() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (errorMessage != null) {
      return Center(child: Text(errorMessage!));
    } else if (prices.isEmpty) {
      return const Center(child: Text('No data available'));
    } else {
      return PriceChart(prices: prices);
    }
  }

}

class PriceChart extends StatelessWidget {
  final List<double> prices;

  const PriceChart({super.key, required this.prices});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 200),
      painter: _PriceChartPainter(prices),
    );
  }
}

class _PriceChartPainter extends CustomPainter {
  final List<double> prices;
  final double margin = 80.0; // margin for Y-axis labels

  _PriceChartPainter(this.prices);

  @override
  void paint(Canvas canvas, Size size) {
    if (prices.isEmpty) return;

    final chartWidth = size.width - margin;

    final double minPrice = prices.reduce((a, b) => a < b ? a : b);
    final double maxPrice = prices.reduce((a, b) => a > b ? a : b);
    final double priceRange = maxPrice - minPrice;

    final Paint linePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    final double dxStep = chartWidth / (prices.length - 1);

    for (int i = 0; i < prices.length; i++) {
      final double dx = margin + (i * dxStep);
      final double normPrice = (prices[i] - minPrice) / priceRange;
      final double dy = size.height * (1 - normPrice);

      if (i == 0) {
        path.moveTo(dx, dy);
      } else {
        path.lineTo(dx, dy);
      }
    }

    canvas.drawPath(path, linePaint);

    // Draw Y-axis labels (min, mid, max)
    final List<double> labelValues = [
      maxPrice,
      minPrice + priceRange / 2,
      minPrice,
    ];

    for (var value in labelValues) {
      final norm = (value - minPrice) / priceRange;
      final dy = size.height * (1 - norm);

      _drawText(
        canvas,
        text: value.toValueWithCurrency(),
        offset: Offset(0, dy - 8), // slight vertical adjustment
        maxWidth: margin - 4,
      );
    }
  }

  void _drawText(Canvas canvas, {
    required String text,
    required Offset offset,
    required double maxWidth,
  }) {
    final TextSpan span = TextSpan(
      text: text,
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 12,
      ),
    );

    final TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.right,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );

    tp.layout(minWidth: 0, maxWidth: maxWidth);
    tp.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant _PriceChartPainter oldDelegate) {
    return oldDelegate.prices != prices;
  }
}

