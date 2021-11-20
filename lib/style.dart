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

GradientText gradientText(String text) {
  return GradientText(
    text,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    gradient: const LinearGradient(colors: [
      Color(0xFFE1AF33),
      Color(0xFFFDFB51),
    ]),
  );
}

BottomAppBar myBottomAppBar() {
  return BottomAppBar(
    color: const Color(0xFF558DE2),
    shape: const CircularNotchedRectangle(),
    notchMargin: 8.0,
    child: Container(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Image.asset("assets/call.png"),
                  gradientText("Contact Us")
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [Image.asset("assets/blog.png"), gradientText("")],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Image.asset("assets/blog.png"),
                  gradientText("Blog")
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
