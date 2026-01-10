import 'package:collabsession/pages/splashscreen1.dart';
import 'package:flutter/material.dart';

class Splashfull extends StatefulWidget {
  const Splashfull({super.key});

  @override
  State<Splashfull> createState() => _SplashfullState();
}

class _SplashfullState extends State<Splashfull> {
  bool showLogo = false;
  bool slideUp = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() => showLogo = true);
    });

    Future.delayed(const Duration(milliseconds: 1400), () {
      setState(() => slideUp = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SplashScreen(),
          Container(color: Colors.grey),
        ]
        )
    );
  }
}
