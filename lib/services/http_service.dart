import 'package:critterpedia/utils/log/log.dart';
import 'package:http/http.dart';

class HttpClientService {
  HttpClientService({
    this.client,
    this.baseUrl,
  });

  final Client client;
  final String baseUrl;

  Future<String> getData(String path) async {
    try {
      Log.info('Fetching data from $baseUrl$path');
      final response = await client.get('$baseUrl$path');
      return response.statusCode == 200 ? response.body : '';
    } catch (e) {
      Log.severe('Error: $e');
      return null;
    }
  }
}
