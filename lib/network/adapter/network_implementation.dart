import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

import 'network.dart';

class NetworkImplementation implements Network {
  static const String defaultBaseUrl = 'https://api.coingecko.com/';
  static const Duration defaultTimeout = Duration(milliseconds: 7000);

  String _baseUrl = defaultBaseUrl;
  Duration _timeout = defaultTimeout;

  NetworkImplementation();

  @override
  void configureNetwork({String? baseUrl, int? timeout}) {
    _baseUrl = baseUrl ?? defaultBaseUrl;
    _timeout = Duration(milliseconds: timeout ?? defaultTimeout.inMilliseconds);
  }

  @override
  Future<http.Response> get({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse(_baseUrl + path).replace(queryParameters: queryParams);
    try {
      final http.Response response = await http
          .get(uri, headers: headers)
          .timeout(_timeout);
      return response;
    } catch (e) {
      developer.log('GET Error: $e');
      rethrow;
    }
  }

  Map<String, String> _getDefaultHeader() {
    return {
      'Access-Key': '',
    };
  }
}
