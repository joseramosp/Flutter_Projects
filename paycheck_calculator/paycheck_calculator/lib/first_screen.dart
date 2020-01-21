import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class FirstScreen extends StatefulWidget {
  static String id = 'calculation_screen';

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  double hoursWorked = 0;
  double rate = 0;
  int taxPercentageDeducted = 15;
  var rateTextInputController = new MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
    leftSymbol: '\$',
    precision: 2,
    initialValue: 0.0,
  );

  double calculateNetPay(double hours, double rate) {
    print(rate);
    print(hoursWorked);
    return rate * hours;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paycheck Calculator',
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.save_alt),
            title: Text('Saved'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later),
            title: Text('History'),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            DataInputTextField(
              showCursor: true,
              controller:
                  TextEditingController(text: rateTextInputController.text),
              text: 'Rate:',
              exampleOfInput: '\$24.50',
              onChanged: (String newValue) {
                if (newValue.length < rateTextInputController.text.length) {
                  int temp = (rate * 10).truncate();
                  this.rate = temp / 100;
                  if (rate < 0.01) {
                    rate = 0;
                  }
                } else
                  this.rate = (rateTextInputController.numberValue * 10) +
                      double.parse(
                          '00.0${newValue.substring(newValue.length - 1)}');
                setState(() {
                  rateTextInputController
                      .updateValue(double.parse(rate.toString()));
                  //rateTextInputController.
                });
                print(newValue);
                print(rate);
              },
            ),
            DataInputTextField(
              showCursor: true,
              text: 'Hours:',
              exampleOfInput: '35.25',
              onChanged: (String newValue) {
                setState(() {
                  this.hoursWorked = double.parse(newValue);
                });
              },
            ),
            TaxSlider(
              taxAmount: taxPercentageDeducted,
              onChanged: (newValue) {
                setState(() {
                  taxPercentageDeducted = newValue.round();
                });
              },
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  print(calculateNetPay(hoursWorked, rate));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataInputTextField extends StatelessWidget {
  final String text;
  final String exampleOfInput;
  final Function onChanged;
  final TextEditingController controller;
  final bool showCursor;

  DataInputTextField(
      {this.text,
      this.exampleOfInput,
      this.onChanged,
      this.controller,
      this.showCursor = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
        Container(
          width: 150,
          padding: EdgeInsets.all(20.0),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              icon: null,
              hintText: exampleOfInput,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: onChanged,
            showCursor: showCursor,
          ),
        ),
      ],
    );
  }
}

class TaxSlider extends StatelessWidget {
  final int taxAmount;
  final Function onChanged;

  TaxSlider({this.taxAmount, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Estimated tax deduction: $taxAmount%'),
        Container(
          width: 250,
          child: Slider(
            value: taxAmount.toDouble(),
            onChanged: onChanged,
            min: 0,
            max: 100,
          ),
        ),
      ],
    );
  }
}
