import 'package:flutter/material.dart';
import 'package:radio_elite/main.dart';
import 'package:radio_elite/style.dart';
import 'package:radio_elite/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget btnItem(String title, String asset) {
      if (title == Utils.pressToJoin) {
        return InkWell(
          onTap: () {
            MyApp.currentIndex = 2;
            Navigator.pushNamedAndRemoveUntil(
                context, '/main', (route) => false);
          },
          child: Container(
            height: 80,
            alignment: Alignment.center,
            decoration: btnBackground,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: gradientText(title, 18),
            ),
          ),
        );
      } else if (title == Utils.stations) {
        return InkWell(
          onTap: () {
            MyApp.currentIndex = 2;
            Navigator.pushNamedAndRemoveUntil(
                context, '/stations', (route) => false);
          },
          child: Container(
            height: 170,
            alignment: Alignment.center,
            decoration: btnBackground,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  gradientText(title, 18),
                  Image.asset(
                    asset,
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return InkWell(
          onTap: () {
            MyApp.currentIndex = 2;
            switch (title) {
              case Utils.aboutUs:
                Navigator.pushNamedAndRemoveUntil(
                    context, '/about', (route) => false);
                break;
              case Utils.events:
                Navigator.pushNamedAndRemoveUntil(
                    context, '/events', (route) => false);
                break;
              case Utils.liveBtn:
                Navigator.pushNamedAndRemoveUntil(
                    context, '/stream', (route) => false);
                break;
            }
          },
          child: Container(
            height: 80,
            alignment: Alignment.center,
            decoration: btnBackground,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  gradientText(title, 18),
                  Image.asset(
                    asset,
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }

    Widget radioOptions() {
      return Row(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    btnItem(Utils.events, "assets/event.png"),
                    const SizedBox(height: 10),
                    btnItem(Utils.aboutUs, "assets/about.png"),
                  ],
                ),
              )),
          Expanded(
              flex: 1, child: btnItem(Utils.stations, "assets/station.png")),
        ],
      );
    }

    Widget drawTwoLines() {
      return Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.amber,
              height: 2,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            color: Colors.amber,
            height: 5,
            width: 5,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.amber,
              height: 2,
            ),
          )
        ],
      );
    }

    Widget appBody() {
      return Column(
        children: [
          gradientText(Utils.welcome, 20),
          const SizedBox(height: 20.0),
          btnItem(Utils.liveBtn, "assets/live.png"),
          const SizedBox(height: 20.0),
          radioOptions(),
          const SizedBox(height: 20.0),/*
          gradientText(Utils.holidayShow, 20),
          const SizedBox(height: 10),
          drawTwoLines(),
          const SizedBox(height: 20),*/
          btnItem(Utils.pressToJoin, ""),
          const SizedBox(height: 60),
        ],
      );
    }

    return Container(
      decoration: background,
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/app_logo.png',
                      fit: BoxFit.contain,
                    ),
                  )),
              Expanded(
                  flex: 8,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0, bottom: 30.0),
                      child: appBody(),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
