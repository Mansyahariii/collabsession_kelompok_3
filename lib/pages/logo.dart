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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          const SplashScreen(),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
            top: slideUp ? -height : 0,
            left: 0,
            right: 0,
            bottom: slideUp ? height : 0,
            child: Container(
              decoration: const BoxDecoration(color: Colors.grey),
              child: Center(
                child: AnimatedOpacity(
                  opacity: showLogo ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 600),
                  child: SizedBox(
                    width: 180,
                    height: 180,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/logo global.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
