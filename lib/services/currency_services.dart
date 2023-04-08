import 'package:currency_exchange/constants/config_constants.dart';
import 'package:http/http.dart' as http;

class CurrencyService {
  final headers = {
    'X-RapidAPI-Key': Constants.RapidAPIKey,
    'X-RapidAPI-Host': Constants.RapidAPIHost
  };

  Future<dynamic> getCurrencyList() async {
    try {
      final url = Uri.parse(Constants.BaseUrl);
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      }
    } catch (e) {}
  }
}
