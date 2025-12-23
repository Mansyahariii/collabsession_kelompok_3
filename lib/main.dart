// import 'package:card/pages/latihan_card.dart';
import 'package:collabsession/pages/splashscreen2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "card UI",
      theme: ThemeData(useMaterial3: true),
      home: SplashScreen2(),
      debugShowCheckedModeBanner: false,
    );
  }
}