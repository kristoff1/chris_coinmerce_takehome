import 'package:intl/intl.dart';

extension CurrencyParsing on double {
  String toValueWithCurrency() {
    NumberFormat currencyFormat = NumberFormat.simpleCurrency(
      decimalDigits: 0,
      locale: 'en_US',
      name: 'USD',
    );
    return currencyFormat.format(this);
  }
}