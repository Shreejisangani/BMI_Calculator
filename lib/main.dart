import 'package:flutter/material.dart';

import 'input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //one method
      // theme: ThemeData(
      //   colorScheme: const ColorScheme.light().copyWith(
      //       primary: const Color(0xff0a0f21),
      //       secondary: Colors.purple,
      //       onPrimaryContainer: Colors.white),
      //   scaffoldBackgroundColor: const Color(0xff0a0f21),
      //   textTheme: const TextTheme(
      //     bodyText1: TextStyle(color: Colors.white),
      //     bodyText2: TextStyle(color: Colors.white),
      //   ),
      // ),

      //second method
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.light().copyWith(
          primary: const Color(0xff0a0f21),
          secondary: Colors.purple,
        ),
        scaffoldBackgroundColor: const Color(0xff0a0f21),
      ),
      home: const InputPage(),
    );
  }
}

