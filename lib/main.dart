import 'package:flutter/material.dart';
import 'Splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Evital Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: Splashscreen()
    );
  }
}
