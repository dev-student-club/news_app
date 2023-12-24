// Import necessary Flutter packages.
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Define a StatefulWidget for the detailed view of a news article.
class DetailMobilePage extends StatefulWidget {
  // Constructor to receive a NewsModel as a parameter.
  final NewsModel model;

  // Constructor for the DetailMobilePage widget.
  const DetailMobilePage({Key? key, required this.model}) : super(key: key);

  // Create an associated state for the DetailMobilePage.
  @override
  State<DetailMobilePage> createState() => _WebViewAppState();
}

// Define the state for the DetailMobilePage widget.
class _WebViewAppState extends State<DetailMobilePage> {
  // Declare a WebViewController to control the WebView.
  late final WebViewController controller;

  // Declare a NewsModel variable to store the passed model.
  late final NewsModel model;

  // Initialize the state of the widget.
  @override
  void initState() {
    super.initState();
    // Assign the passed model to the local model variable.
    model = widget.model;
    // Create and configure the WebViewController.
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(model.url),
      );
  }

  // Build the UI for the DetailMobilePage widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Set the title of the app bar to the author's name.
        title: Text(
          model.author,
          style:
              const TextStyle(color: Colors.white), // Set text color to white
        ),
        backgroundColor: const Color.fromARGB(255, 125, 5, 45),
        // Set the icon color of the app bar to white.
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
