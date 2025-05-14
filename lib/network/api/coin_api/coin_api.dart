abstract class CoinApi {

  Future<List<Map<String, dynamic>>> getList();

  Future<Map<String, dynamic>> getChart(String coinId);

}
