import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CalculatorWebView extends StatefulWidget {
  final String url;
  final String dealerId;
  final String? role;
  final String? dealerName;
  final String? empId;
  const CalculatorWebView(
      {super.key,
      required this.url,
      required this.dealerId,
      this.role,
      this.dealerName,
      this.empId});

  @override
  State<CalculatorWebView> createState() => _CalculatorWebViewState();
}

class _CalculatorWebViewState extends State<CalculatorWebView> {
  late final WebViewController controller;
  bool loading = false;

  @override
  void initState() {
    // print(widget.dealerId);
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loading = true;
          });
        },
        onProgress: (progress) {
          setState(() {
            loading = true;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loading = false;
          });
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.url);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Color(0xff941420),

      ),
      body: (loading == true)
          ? const Center(child: CircularProgressIndicator())
          : Stack(children: [
              WebViewWidget(controller: controller),
            ]),
    );
  }
}
