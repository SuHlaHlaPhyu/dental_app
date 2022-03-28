import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final bool isBold;
  final double size;
  TextWidget(
      {required this.text,
      this.color = Colors.white,
      this.isBold = false,
      this.size = 11});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : null,
      ),
    );
  }
}