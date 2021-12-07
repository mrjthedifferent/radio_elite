import 'package:flutter/material.dart';
import 'package:radio_elite/contact_page.dart';
import 'package:radio_elite/home_page.dart';
import 'package:radio_elite/style.dart';
import 'package:radio_elite/utils.dart';
import 'package:radio_elite/webpage_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio Elite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => AppHome(title: "home", url: ""),
        '/main': (context) =>
            AppHome(title: "main", url: "https://radioeliteusa.com"),
        '/stream': (context) =>
            AppHome(title: "main", url: "https://usa10.fastcast4u.com/radioeliteinternational"),
        '/blog': (context) =>
            AppHome(title: "main", url: "https://radioeliteusa.com"),
        '/about': (context) =>
            AppHome(title: "main", url: "https://radioeliteusa.com/about-us"),
        '/events': (context) =>
            AppHome(title: "main", url: "https://radioeliteusa.com/events"),
        '/stations': (context) =>
            AppHome(title: "main", url: "https://radioeliteusa.com/stations"),
      },
    );
  }
}

class AppHome extends StatefulWidget {
  final String title;
  final String url;
  const AppHome({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: myBottomAppBar(),
      floatingActionButton:
          Utils.myFloatingActionButton(getCurrentFloatingIcon()),
      floatingActionButtonLocation: fabLocation(),
      body: getBody(),
    );
  }

  FloatingActionButtonLocation fabLocation() {
    if (MyApp.currentIndex == 0) {
      return FloatingActionButtonLocation.centerDocked;
    } else if (MyApp.currentIndex == 1) {
      return FloatingActionButtonLocation.startDocked;
    } else {
      return FloatingActionButtonLocation.endDocked;
    }
  }

  String getCurrentFloatingIcon() {
    if (MyApp.currentIndex == 2) {
      return "assets/blog.png";
    } else if (MyApp.currentIndex == 1) {
      return "assets/call.png";
    } else {
      return "assets/home.png";
    }
  }

  Widget getBody() {
    if (MyApp.currentIndex == 1) {
      return const ContactScreen();
    } else if (MyApp.currentIndex == 2) {
      return WebViewExample(
        url: widget.url,
        title: widget.title,
      );
    } else {
      return const HomePage();
    }
  }

  BottomAppBar myBottomAppBar() {
    Widget createBottomChild(position, String asset, String title) {
      if (position == MyApp.currentIndex) {
        return gradientText("", 15);
      } else {
        return InkWell(
          onTap: () {
            if (position == 2) {
              MyApp.currentIndex = position;
              Navigator.pushNamedAndRemoveUntil(
                  context, "/blog", (route) => false);
              return;
            } else {
              setState(() {
                MyApp.currentIndex = position;
              });
            }
          },
          child: Column(
            children: [
              Image.asset(asset),
              gradientText(title, 15),
            ],
          ),
        );
      }
    }

    return BottomAppBar(
      color: const Color(0xFF558DE2),
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: createBottomChild(1, "assets/call.png", "Contact Us"),
              ),
              Expanded(
                child: createBottomChild(0, "assets/home.png", "Home"),
              ),
              Expanded(
                child: createBottomChild(2, "assets/blog.png", "Blog"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
