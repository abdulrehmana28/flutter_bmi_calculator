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
      constraints: const BoxConstraints.tightFor(width: 46.0, height: 46.0),
      child: Icon(
        childIcon,
        color: Colors.white,
      ),
    );
  }
}
