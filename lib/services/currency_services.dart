import 'package:currency_exchange/constants/config_constants.dart';

class CurrencyService {
  final options = {
    'method': 'GET',
    'url': Constants.BaseUrl,
    'headers': {
      'X-RapidAPI-Key': Constants.RapidAPIKey,
      'X-RapidAPI-Host': Constants.RapidAPIHost
    }
  };
}
