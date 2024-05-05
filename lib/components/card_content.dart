import 'package:flutter/material.dart';

import '../constants.dart';

class CardContent extends StatelessWidget {
  CardContent({
    this.cardIcon,
    required this.cardText,
  });

  final IconData? cardIcon;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 65.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          cardText,
          style: kCardTextStyle,
        ),
      ],
    );
  }
}
