import 'package:flutter/material.dart';

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
