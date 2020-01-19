import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  static String id = 'calculation_screen';

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  double hoursWorked = 0;
  double rate = 0;

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
          'Calculator',
        ),
      ),
      body: Column(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DataInputTextField(
            text: 'Rate',
            exampleOfInput: '\$24.50',
            onChanged: (String newValue) {
              this.rate = double.parse(newValue);
              print(newValue);
              print(rate);
            },
          ),
          DataInputTextField(
            text: 'Hours',
            exampleOfInput: '35.25',
            onChanged: (String newValue) {
              setState(() {
                this.hoursWorked = double.parse(newValue);
              });
            },
          ),
          FlatButton(
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
        ],
      ),
    );
  }
}

class DataInputTextField extends StatelessWidget {
  final String text;
  final String exampleOfInput;
  final Function onChanged;

  DataInputTextField({this.text, this.exampleOfInput, this.onChanged});

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
          ),
        ),
      ],
    );
  }
}
