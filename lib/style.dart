import 'package:flutter/material.dart';
import 'package:radio_elite/gradient_text.dart';

Decoration btnBackground = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.5),
      blurRadius: 20,
      offset: Offset.zero,
    ),
  ],
  borderRadius: BorderRadius.circular(10),
  gradient: const LinearGradient(
      colors: [
        Color(0xFF558DE2),
        Color(0xFF323232),
      ],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(0.0, 1.3),
      stops: [0.0, 1.5],
      tileMode: TileMode.clamp),
);

Decoration background = const BoxDecoration(
  gradient: LinearGradient(
      colors: [
        Color(0xFF558DE2),
        Color(0xFF323232),
      ],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(1.3, 0.0),
      stops: [0.0, 1.5],
      tileMode: TileMode.clamp),
);

GradientText gradientText(String text, double fontSize) {
  return GradientText(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    ),
    gradient: const LinearGradient(colors: [
      Color(0xFFE1AF33),
      Color(0xFFFDFB51),
    ]),
  );
}

