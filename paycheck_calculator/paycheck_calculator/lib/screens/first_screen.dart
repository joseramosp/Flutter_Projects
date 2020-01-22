import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import '../components/data_input_text_field.dart';
import '../components/tax_slider.dart';

class FirstScreen extends StatefulWidget {
  static String id = 'calculation_screen';

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  double hoursWorked = 0;
  double rate = 0;
  int taxPercentageDeducted = 15;
  double grossPay = 0;
  double takeHome = 0;
  double taxDeductedAmount = 0;
  var rateTextInputController = new MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
    leftSymbol: '\$',
    precision: 2,
    initialValue: 0.0,
  );

  void calculatePaymentInfo() {
    grossPay = rate * hoursWorked;
    taxDeductedAmount = grossPay * (taxPercentageDeducted / 100);
    takeHome = grossPay - taxDeductedAmount;
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
            SizedBox(),
            Column(
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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TaxSlider(
                    taxAmount: taxPercentageDeducted,
                    onChanged: (newValue) {
                      setState(() {
                        taxPercentageDeducted = newValue.round();
                      });
                    },
                  ),
                ),
              ],
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
                  FocusScope.of(context).requestFocus(new FocusNode());
                  calculatePaymentInfo();
                  print(grossPay);
                  print(taxDeductedAmount);
                  print(takeHome);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
