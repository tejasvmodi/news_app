// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailViewScreen extends StatefulWidget {
  String newsUrl;
   DetailViewScreen({
    Key? key,
    required this.newsUrl,
  }) : super(key: key);

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {
   

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      widget.newsUrl = widget.newsUrl.contains("http:") ? widget.newsUrl.replaceAll("http:", "https:") : widget.newsUrl;
    });
  }
 
  final Completer<WebViewController> controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
          initialUrl: widget.newsUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewcontroller) {
            setState(() {
              controller.complete(webViewcontroller);
            });
          } ,
        ),
    );
  }
}
