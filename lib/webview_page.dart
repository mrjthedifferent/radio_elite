import 'dart:io';

import 'package:flutter/material.dart';
import 'package:radio_elite/style.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  const WebViewPage({Key? key, required this.url, required this.title})
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
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            flexibleSpace: Container(
              decoration: background,
            )),
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (function) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    title: Text('Loading'),
                    content: SizedBox(
                        height: 50,
                        child: Center(child: CircularProgressIndicator())),
                  );
                });

            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pop(context);
            });
          },
        ));
  }
}
