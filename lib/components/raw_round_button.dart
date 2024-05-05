import 'package:flutter/material.dart';

class RawRoundButton extends StatelessWidget {
  RawRoundButton({required this.childIcon, required this.onPress});

  final IconData childIcon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      elevation: 5.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      child: Icon(
        childIcon,
        color: Colors.white,
      ),
    );
  }
}
