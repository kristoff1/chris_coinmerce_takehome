import 'package:test_coinmerce/datasource/data/coin/coin_data.dart';
import 'package:test_coinmerce/datasource/parsers/coin_parsers/coin_parser.dart';

class CoinParserImplementation extends CoinParser {

  @override
  List<CoinData> getCoinsFromJson(List<Map<String, dynamic>> json) {
    try{
      //Parse the result into a usable data
      return json.map((result) => CoinData(
        id: result['id'].toString(),
        name: result['name'],
        symbol: result['symbol'],
        image: result['image'] ,
        price: _parseNumberResult(result['current_price']),
        priceChangePercentage24h: _parseNumberResult(result['price_change_percentage_24h']),

      )).toList();
    } catch (e) {
      ///TODO Change to parse error
      throw Exception('Error parsing coin data');
    }
  }

  ///To handle the case when the result is an int
  double _parseNumberResult(var element) {
    if(element is int) {
      return element.toDouble();
    } else {
      return element;
    }
  }

}