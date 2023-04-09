import 'dart:convert';

import 'package:currency_exchange/constants/config_constants.dart';
import 'package:http/http.dart' as http;

class CurrencyService {
  final headers = {
    'X-RapidAPI-Key': Constants.RapidAPIKey,
    'X-RapidAPI-Host': Constants.RapidAPIHost
  };

  Future<dynamic> getCurrencyList() async {
    try {
      final url = Uri.parse(Constants.BaseUrlForExchange);

      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        return result;
      }
    } catch (e) {}
  }

  Future<dynamic> exchangeCurrency(from, to, q) async {
    try {
      final url =
          Uri.https(Constants.BaseUrlForExchange + '?from=$from&to=$to&q=$q');
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {}
  }
}
