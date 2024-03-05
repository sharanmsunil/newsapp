import 'package:flutter/material.dart';
class GreyFont extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  const GreyFont({super.key,
    this.color =  Colors.grey,
    required this.text,
    this.size = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? 10:size,
        fontWeight: FontWeight.bold
      ),
    );
  }
}