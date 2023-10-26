import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse("http://hot.ssnetwork.io:46931")),
      ),
    );
  }
}
