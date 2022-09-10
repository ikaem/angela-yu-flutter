import 'package:bitcoin_flutter/models/rate.dart';
import 'package:bitcoin_flutter/services/http_service.dart';

const kApiKey = "4515C0E0-DAED-44F9-A334-2C19ED9EB8F9";
const authority = "rest.coinapi.io";

class TickerService {
  Future<Rate> getCryptFiatRate({
    required String crypto,
    required String fiat,
  }) async {
    final unencodedPath = "/v1/exchangerate/$crypto/$fiat";
    final Map<String, String> headers = {
      "X-CoinAPI-Key": kApiKey,
    };

    final uri = Uri.https(authority, unencodedPath);

    final httpService = HttpService(
      uri: uri,
      headers: headers,
    );

    final json = await httpService.getData();

    print("json: $json");

    final Rate rate = Rate.fromJson(json);

    return rate;
  }
}
