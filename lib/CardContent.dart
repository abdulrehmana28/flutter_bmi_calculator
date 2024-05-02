import 'package:flutter/material.dart';

import 'input_page.dart';

class CardContent extends StatelessWidget {
  CardContent({required this.cardIcon, required this.cardText});

  final IconData cardIcon;
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
          style: const TextStyle(color: cardTextColor, fontSize: 20.0),
        ),
      ],
    );
  }
}
