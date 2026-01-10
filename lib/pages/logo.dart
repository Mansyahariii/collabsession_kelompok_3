import 'package:collabsession/pages/splashscreen1.dart';
import 'package:flutter/material.dart';

class Splashfull extends StatefulWidget {
  const Splashfull({super.key});

  @override
  State<Splashfull> createState() => _SplashfullState();
}

class _SplashfullState extends State<Splashfull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SplashScreen()
        ]
        )
    );
  }
}
