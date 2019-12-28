import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData child;
  final Function onPress;

  RoundIconButton({@required this.child, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(child),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      onPressed: onPress,
    );
  }
}
