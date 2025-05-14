///A model class that represents a coin
///Any data should gathered from any datasource
///should be converted to this model
class CoinModel {
  final String id;
  final String name;
  final String symbol;
  final String imageUrl;
  final double price;
  final double dailyPriceChange;

  CoinModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.dailyPriceChange,
  });
}
