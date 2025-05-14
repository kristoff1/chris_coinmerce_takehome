import 'package:http/http.dart' as http;

abstract class Network {
  void configureNetwork({
    String baseUrl,
    int timeout,
  });

  Future<http.Response> get({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  });

}
