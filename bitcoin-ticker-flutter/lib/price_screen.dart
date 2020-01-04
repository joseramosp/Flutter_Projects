import 'package:flutter/material.dart';
import 'services/bitcoin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:bitcoin_ticker/coin_data.dart';
import 'crypto_info_card.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  BitCoinData coinData = BitCoinData();
  String selectedCurrency = 'USD';
  int btcPrice;
  int ethPrice;
  int ltcPrice;

  DropdownButton androidDropdownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        androidUpdateUI(value);
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> cupertinoPickerItems = [];

    for (String currency in currenciesList) {
      cupertinoPickerItems.add(
        Text(
          currency,
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return CupertinoPicker(
      itemExtent: 35,
      backgroundColor: Colors.lightBlue,
      children: cupertinoPickerItems,
      onSelectedItemChanged: (selectedIndex) {
        iOSUpdateUI(selectedIndex);
      },
    );
  }

  void iOSUpdateUI(int selectedIndex) async {
    String newCurrencyValue = currenciesList[selectedIndex];
    var btcCurrencyData =
        await coinData.getCryptoCurrencyPrice('BTC', newCurrencyValue);
    double btcValue = btcCurrencyData['last'];
    var ethCurrencyData =
        await coinData.getCryptoCurrencyPrice('ETH', newCurrencyValue);
    double ethValue = ethCurrencyData['last'];
    var ltcCurrencyData =
        await coinData.getCryptoCurrencyPrice('LTC', newCurrencyValue);
    double ltcValue = ltcCurrencyData['last'];
    setState(() {
      selectedCurrency = newCurrencyValue;
      btcPrice = btcValue.toInt();
      ethPrice = ethValue.toInt();
      ltcPrice = ltcValue.toInt();
    });
  }

  //TODO: Needs to be optimized to show all the crypto
  void androidUpdateUI(String selectedCurrency) async {
    var currencyData =
        await coinData.getCryptoCurrencyPrice('BTC', selectedCurrency);
    double value = currencyData['last'];
    setState(() {
      this.selectedCurrency = selectedCurrency;
      btcPrice = value.toInt();
    });
  }

  @override
  void initState() {
    super.initState();
    Platform.isIOS ? iOSUpdateUI(0) : androidUpdateUI('USD');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CryptoInfoCard(
                  cryptoList[0], this.btcPrice, this.selectedCurrency),
              CryptoInfoCard(
                  cryptoList[1], this.ethPrice, this.selectedCurrency),
              CryptoInfoCard(
                  cryptoList[2], this.ltcPrice, this.selectedCurrency),
            ],
          ),
          Expanded(
            child: Image(
              image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Coat_of_arms_of_the_Dominican_Republic.svg/250px-Coat_of_arms_of_the_Dominican_Republic.svg.png',
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdownButton(),
          ),
        ],
      ),
    );
  }
}
