import 'dart:io';

import 'package:http/http.dart';

class HttpService {
  final Uri uri;
  final Map<String, String>? headers;

  HttpService({
    required this.uri,
    this.headers,
  });

  Future<dynamic> getData() async {
    final response = await get(uri, headers: headers);

    if (response.statusCode != 200) {
      throw HttpException(
        response.statusCode.toString(),
      );
    }

    return response.body;
  }
}
