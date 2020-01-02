import 'dart:convert';
import 'package:bitcoin_ticker/constants.dart';
import 'networking.dart';

class BitCoinData {
  Future<dynamic> getBitCoinPrice(
      String selectedCrypto, String selectedCurrency) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/$selectedCrypto$selectedCurrency');
    var currencyData = await networkHelper.getData();

    return currencyData;
  }
}
