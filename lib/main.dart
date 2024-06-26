import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}