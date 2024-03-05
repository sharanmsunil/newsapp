import 'package:flutter/material.dart';
class BlackFont extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  const BlackFont({super.key,
    this.color =  Colors.black,
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