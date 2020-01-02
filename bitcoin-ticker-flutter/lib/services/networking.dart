import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bitcoin_ticker/constants.dart';
import 'package:bitcoin_ticker/coin_data.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      //print(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
