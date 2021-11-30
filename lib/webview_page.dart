import 'dart:io';

import 'package:flutter/material.dart';
import 'package:radio_elite/style.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;
  final bool isHome;

  const WebViewPage(
      {Key? key, required this.url, required this.title, required this.isHome})
      : super(key: key);

  @override
  WebViewPageState createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isHome) {
      return Scaffold(
        body: getView(context),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            flexibleSpace: Container(
              decoration: background,
            )),
        body: getView(context),
      );
    }
  }

  WebView getView(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (function) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: Container(
                  margin: const EdgeInsets.only(top: 80, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      generateContainer(20.0, double.infinity),
                      const SizedBox(height: 10),
                      generateContainer(40.0, double.infinity),
                      const SizedBox(height: 10),
                      generateContainer(30.0, 60.0),
                      const SizedBox(height: 10),
                      generateContainer(60.0, 90.0),
                      const SizedBox(height: 10),
                      generateContainer(20.0, double.infinity),
                      const SizedBox(height: 10),
                      generateContainer(30.0, 40.0),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            });

        // Future.delayed(const Duration(seconds: 3), () {
        //   Navigator.pop(context);
        // });
      },
      onPageStarted: (url) {
        Navigator.pop(context);
      },
    );
  }

  Container generateContainer(double height, double width) {
    return Container(
      width: width,
      height: height,
      color: Colors.white,
    );
  }
}
