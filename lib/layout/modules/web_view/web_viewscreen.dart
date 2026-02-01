// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewscreen extends StatelessWidget {
//   const WebViewscreen({super.key, required this.url});
//   final String url;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: WebView(
//         initialUrl: url,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewscreen extends StatefulWidget {
  const WebViewscreen({super.key, required this.url});
  final String url;

  @override
  State<WebViewscreen> createState() => _WebViewscreenState();
}

class _WebViewscreenState extends State<WebViewscreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: _controller),
    );
  }
}
