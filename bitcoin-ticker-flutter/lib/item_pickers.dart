//import 'package:flutter/material.dart';
//
//import 'coin_data.dart';
//
//class ItemPicker {
//  DropdownButton androidDropdownButton() {
//    List<DropdownMenuItem<String>> dropdownItems = [];
//
//    for (String currency in currenciesList) {
//      var newItem = DropdownMenuItem(
//        child: Text(currency),
//        value: currency,
//      );
//      dropdownItems.add(newItem);
//    }
//
//    return DropdownButton<String>(
//      value: selectedCurrency,
//      items: dropdownItems,
//      onChanged: (value) {
//        androidUpdateUI(value);
//      },
//    );
//  }
//
//  CupertinoPicker iOSPicker() {
//    List<Text> cupertinoPickerItems = [];
//
//    for (String currency in currenciesList) {
//      cupertinoPickerItems.add(
//        Text(
//          currency,
//          style: TextStyle(color: Colors.white),
//        ),
//      );
//    }
//
//    return CupertinoPicker(
//      itemExtent: 35,
//      backgroundColor: Colors.lightBlue,
//      children: cupertinoPickerItems,
//      onSelectedItemChanged: (selectedIndex) {
//        iOSUpdateUI(selectedIndex);
//      },
//    );
//  }
//
//  void iOSUpdateUI(int selectedIndex) async {
//    String newCurrencyValue = currenciesList[selectedIndex];
//    var currencyData = await coinData.getBitCoinPrice(newCurrencyValue);
//    double value = currencyData['last'];
//    setState(() {
//      selectedCurrency = newCurrencyValue;
//      price = value.toInt();
//    });
//  }
//
//  void androidUpdateUI(String selectedCurrency) async {
//    var currencyData = await coinData.getBitCoinPrice(selectedCurrency);
//    double value = currencyData['last'];
//    setState(() {
//      this.selectedCurrency = selectedCurrency;
//      price = value.toInt();
//    });
//  }
//}
