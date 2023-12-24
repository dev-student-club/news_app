// Import the Flutter Material package, which contains the necessary widgets for building the UI.
import 'package:flutter/material.dart';

// Import the custom MainScreen widget from the home folder.
import 'package:news_app/home/main_screen.dart';

// The main entry point for the Flutter application.
void main() {
  // Run the app by calling the runApp function and passing an instance of MyApp.
  runApp(const MyApp());
}

// Define a StatelessWidget called MyApp.
class MyApp extends StatelessWidget {
  // Create a constructor for MyApp, taking an optional key parameter.
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Return a MaterialApp widget, the root of the app, with specified properties.
    return MaterialApp(
      // Set the title of the app, which is displayed in the device task switcher.
      title: 'News App',

      // Set the theme of the app. (Note: Currently, it's an empty ThemeData.)
      theme: ThemeData(),

      // Set the home property to an instance of the MainScreen widget.
      home: const MainScreen(),

      // Disable the debug banner in the top-right corner of the app.
      debugShowCheckedModeBanner: false,
    );
  }
}
