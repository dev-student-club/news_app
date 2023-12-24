import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailMobilePage extends StatefulWidget {
  final NewsModel model;

  const DetailMobilePage({Key? key, required this.model}) : super(key: key);

  @override
  State<DetailMobilePage> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<DetailMobilePage> {
  late final WebViewController controller;

  late final NewsModel model;

  @override
  void initState() {
    super.initState();
    model = widget.model;
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(model.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.author,
          style:
              const TextStyle(color: Colors.white), // Set text color to white
        ),
        backgroundColor: const Color.fromARGB(255, 125, 5, 45),
        iconTheme: const IconThemeData(
            color: Colors.white), // Set back icon color to white
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
