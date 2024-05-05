import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.cardColor, this.cardChild, this.onPressed});

  final Color cardColor;
  final Widget? cardChild;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: cardColor),
        child: cardChild,
      ),
    );
  }
}

// const Color(0xFF1d1e33),
