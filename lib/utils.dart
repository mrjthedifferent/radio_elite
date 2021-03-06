import 'package:flutter/material.dart';

class Utils {
  static const welcome = "Welcome to the World of Radio Elite International";
  static const liveBtn = "Radio Elite International";
  static const stations = "Stations";
  static const events = "Events";
  static const aboutUs = "About Us";
  static const pressToJoin = "Press to join";
  static const holidayShow = "Don’t Miss The Holiday Video Show";
  static const contactUs = "Stations";
  static const blog = "Blog";
  static const freeToContact = "Feel Free to Contact Us";
  static const address =
      "1645 Palm Beach Lakes Blvd #240\nWest Palm Beach, FL 33401";

  static FloatingActionButton myFloatingActionButton(String icon) {
    return FloatingActionButton(
      onPressed: () {},
      elevation: 20,
      child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                colors: [
                  Color(0xFF558DE2),
                  Color(0xFF323232),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.3, 0.0),
                stops: [0.0, 1.5],
                tileMode: TileMode.clamp),
          ),
          child: Image.asset(icon)),
    );
  }

  static void showSnackBar(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(message),
          actions: [
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
