import 'dart:convert';

class Rate {
  late String fiat;
  late String crypto;
  late double rate;

  Rate({
    required this.fiat,
    required this.crypto,
    required this.rate,
  });

  Rate.fromJson(String json) {
    final data = jsonDecode(json);
    fiat = data["asset_id_quote"];
    crypto = data["asset_id_base"];
    rate = double.parse(data["rate"].toStringAsFixed(2));
  }
}
