import 'package:flutter/material.dart';
import 'package:radio_elite/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AppHome(),
    );
  }
}

class AppHome extends StatelessWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget btnItem(String title, String asset) {
      return Container(
        height: 80,
        alignment: Alignment.center,
        decoration: btnBackground,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: asset.isEmpty
              ? gradientText(title)
              : Column(
                  children: [
                    gradientText(title),
                    Image.asset(
                      asset,
                      height: 30,
                    ),
                  ],
                ),
        ),
      );
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
                    btnItem("Events", "assets/event.png"),
                    const SizedBox(height: 20),
                    btnItem("About Us", "assets/about.png"),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    height: 180,
                    alignment: Alignment.center,
                    decoration: btnBackground,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          gradientText("Stations"),
                          Image.asset(
                            "assets/station.png",
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
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
          gradientText('Welcome to the World of Radio Elite International'),
          const SizedBox(height: 20.0),
          btnItem("Radio Elite International", "assets/live.png"),
          const SizedBox(height: 20.0),
          radioOptions(),
          const SizedBox(height: 30.0),
          gradientText("Don’t Miss The Holiday Video Show"),
          const SizedBox(height: 10),
          drawTwoLines(),
          const SizedBox(height: 20),
          btnItem("Press to join", ""),
          const SizedBox(height: 60),
        ],
      );
    }

    FloatingActionButton myFloatingActionButton() {
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
            child: Image.asset("assets/home.png")),
      );
    }

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: myBottomAppBar(),
      floatingActionButton: myFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
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
      ),
    );
  }
}
