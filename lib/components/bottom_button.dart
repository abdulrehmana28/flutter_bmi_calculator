import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonText, required this.onClick});

  final String buttonText;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBottomButtonColor,
      margin: const EdgeInsets.only(top: 10.0),
      height: kBottomButtonHeight,
      width: double.infinity,
      child: GestureDetector(
        child: Center(
          child: Text(
            buttonText.toUpperCase(),
            style: kLargeButtonTextStyle,
          ),
        ),
        onTap: onClick,
      ),
    );
  }
}
