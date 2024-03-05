import 'package:flutter/material.dart';
class WhiteFont extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  const WhiteFont({super.key,
    this.color =  Colors.white,
    required this.text,
    this.size = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? 15:size,
        fontWeight: FontWeight.bold
      ),
    );
  }
}