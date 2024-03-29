import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RkDoorCalculatorView extends StatefulWidget {
  final String url;
  final String dealerId;
  final String? role;
  final String? dealerName;
  final String? empId;
  const RkDoorCalculatorView(
      {super.key,
      required this.url,
      required this.dealerId,
      this.role,
      this.dealerName,
      this.empId});

  @override
  State<RkDoorCalculatorView> createState() => _RkDoorCalculatorViewState();
}

class _RkDoorCalculatorViewState extends State<RkDoorCalculatorView> {
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
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)),
      ),
      body: (loading == true)
          ? const Center(child: CircularProgressIndicator())
          : Stack(children: [
              WebViewWidget(controller: controller),
            ]),
    );
  }
}
