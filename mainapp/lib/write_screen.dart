import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class writeingPage extends StatelessWidget {
  const writeingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          //この辺もちゃんとドメイン周り設定しないといけない
          ..loadRequest(Uri.parse("http://localhost:8080/")),
      ),
    );
  }
}
