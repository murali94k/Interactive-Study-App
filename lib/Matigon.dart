import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MathigonChapter extends StatelessWidget {
  const MathigonChapter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue[500],
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MathigonWebView()));
        },
        child: const Text("Mathigon Page"),
      ),
    );
  }
}

class MathigonWebView extends StatefulWidget {
  const MathigonWebView({super.key});

  @override
  State<MathigonWebView> createState() => _MathigonWebViewState();
}

class _MathigonWebViewState extends State<MathigonWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.dataFromString('<html><body><iframe width="100%" height="100%"  src="https://mathigon.org/polypad/embed/FXEDUoro0j3mYQ" frameborder="0" allowfullscreen></iframe></body></html>',mimeType: 'text/html'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.cyan[900],
        title: const Text("Mathigon")),
    body:
        Center(
           child: WebViewWidget(
              controller: controller,
          ),
         ),
    );
  }
}
