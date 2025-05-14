import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_coinmerce/network/exceptions/server_error_exception.dart';

import '../../adapter/network.dart';
import '../../exceptions/under_maintenance_exception.dart';
import 'coin_api.dart';

class CoinApiImplementation extends CoinApi {
  final Network adapter;

  CoinApiImplementation({required this.adapter});

  @override
  Future<List<Map<String, dynamic>>> getList() async {
    try {
      http.Response response = await adapter.get(
        path: 'api/v3/coins/markets',
        queryParams: {
          'vs_currency': 'usd',
          'order': 'market_cap_desc',
          'per_page': '10',
          'page': '1',
          'sparkline': 'false',
        },
      );

      return _convertListResponseToJSON(response);
    } on http.ClientException {
      throw Exception('Network Exception');
    } catch (e) {
      // You can check status codes in your adapter or inside helper methods
      if (e is UnderMaintenanceException) {
        rethrow;
      } else if (e is ServerErrorException) {
        rethrow;
      }
      throw Exception('Unknown Exception');
    }
  }

  @override
  Future<Map<String, dynamic>> getChart(String coinId) async {
    try {
      http.Response response = await adapter.get(
        path: 'api/v3/coins/$coinId/market_chart',
        queryParams: {
          'vs_currency': 'usd',
          'days': '1',
        },
        headers: {
          'accept': 'application/json',
        },
      );
      return _convertResponseToJSON(response);
    } on http.ClientException {
      throw Exception('Network Exception');
    } catch (e) {
      // You can check status codes in your adapter or inside helper methods
      if (e is UnderMaintenanceException) {
        rethrow;
      } else if (e is ServerErrorException) {
        rethrow;
      }
      throw Exception('Unknown Exception');
    }
  }

  bool _getError500(http.Response response) {
    return response.statusCode >= 500 && response.statusCode < 600;
  }

  Map<String, dynamic> convertResponseToJSON(http.Response response) {
    try {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      throw Exception('Network Exception');
    }
  }

  List<Map<String, dynamic>> _convertListResponseToJSON(
    http.Response response,
  ) {
    try {
      if (response.statusCode == 503) {
        throw UnderMaintenanceException('Under Maintenance');
      } else if (_getError500(response)) {
        throw UnderMaintenanceException('Error Connecting to Server');
      }
      final decoded = jsonDecode(response.body) as List<dynamic>;
      return decoded.map((e) => Map<String, dynamic>.from(e as Map)).toList();
    } catch (e) {
      throw Exception('Invalid JSON or Server Error');
    }
  }

  Map<String, dynamic> _convertResponseToJSON(
    http.Response response,
  ) {
    try {
      if (response.statusCode == 503) {
        throw UnderMaintenanceException('Under Maintenance');
      } else if (_getError500(response)) {
        throw UnderMaintenanceException('Error Connecting to Server');
      }

      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      throw Exception('Invalid JSON or Server Error');
    }
  }

}
