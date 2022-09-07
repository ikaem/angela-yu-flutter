import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class NetworkHelper {
  final Uri uri;

  NetworkHelper(this.uri);

  Future<dynamic> getData() async {
    try {
      final response = await get(uri);

      print("response: $response");
      if (response.statusCode != 200) {
        throw const HttpException("Bad request");
      }

      final decodedData = jsonDecode(response.body);

      print("decoded data: $decodedData");

      return decodedData;
    } catch (e) {
      print("error: $e");
      rethrow;
    }
  }
}
