import 'dart:convert';
import 'networking.dart';

class BitCoinData {
  Future<dynamic> getCryptoCurrencyPrice(
      String selectedCrypto, String selectedCurrency) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/$selectedCrypto$selectedCurrency');
    var currencyData = await networkHelper.getData();

    return currencyData;
  }
}
