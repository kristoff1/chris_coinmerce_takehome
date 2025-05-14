class CoinData {
  final String id;
  final String name;
  final String symbol;
  final String image;
  final double price;
  final double priceChangePercentage24h;

  CoinData({
    required this.id,
    required this.name,
    required this.symbol,
    required this.image,
    required this.price,
    required this.priceChangePercentage24h,
  });
}
