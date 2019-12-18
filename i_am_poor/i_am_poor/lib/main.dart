import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I Am Poor'),
          backgroundColor: Colors.red[900],
        ),
        backgroundColor: Colors.red[700],
        body: Center(
          child: Image(
            image: AssetImage('images/homeless-cut.png'),
          ),
        ),
      ),
    ),
  );
}
