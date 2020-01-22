import 'package:flutter/material.dart';

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
