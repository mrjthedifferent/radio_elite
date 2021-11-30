import 'package:flutter/material.dart';
import 'package:radio_elite/contact_page.dart';
import 'package:radio_elite/home_page.dart';
import 'package:radio_elite/style.dart';
import 'package:radio_elite/utils.dart';
import 'package:radio_elite/webview_page.dart';

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
          '/': (context) => const AppHome(),
          '/main': (context) => const WebViewPage(
                url: "https://radioeliteusa.com/",
                title: "Radio Elite",
                isHome: false,
              ),
          '/about': (context) => const WebViewPage(
                url: "https://radioeliteusa.com/about-us/",
                isHome: false,
                title: Utils.aboutUs,
              ),
          '/events': (context) => const WebViewPage(
                url: "https://radioeliteusa.com/events/",
                title: Utils.events,
                isHome: false,
              ),
          '/stations': (context) => const WebViewPage(
                url: "https://radioeliteusa.com/stations/",
                title: Utils.stations,
                isHome: false,
              ),
        });
  }
}

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    Widget createBottomChild(position, String asset, String title) {
      if (position == MyApp.currentIndex) {
        return gradientText("", 15);
      } else {
        return InkWell(
          onTap: () {
            setState(() {
              MyApp.currentIndex = position;
            });
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
      if (MyApp.currentIndex == 0) {
        return "assets/home.png";
      } else if (MyApp.currentIndex == 1) {
        return "assets/call.png";
      } else {
        return "assets/blog.png";
      }
    }

    Widget getBody() {
      if (MyApp.currentIndex == 1) {
        return ContactScreen();
      } else if (MyApp.currentIndex == 2) {
        return WebViewPage(
          url: "https://radioeliteusa.com/",
          title: "Blog",
          isHome: true,
        );
      } else {
        return const HomePage();
      }
    }

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
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
      ),
      floatingActionButton:
          Utils.myFloatingActionButton(getCurrentFloatingIcon()),
      floatingActionButtonLocation: fabLocation(),
      body: getBody(),
    );
  }
}
