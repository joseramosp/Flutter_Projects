import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  static String id = 'calculation_screen';

  double calculateNetPay(double hours, int rate) {
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
          ),
          DataInputTextField(
            text: 'Hours',
            exampleOfInput: '35.25',
          )
        ],
      ),
    );
  }
}

class DataInputTextField extends StatelessWidget {
  final String text;
  final String exampleOfInput;

  DataInputTextField({this.text, this.exampleOfInput});

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
          ),
        ),
      ],
    );
  }
}
