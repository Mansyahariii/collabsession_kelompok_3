import 'package:flutter/material.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 500,
                  height: 500,
                  child: ClipRect(
                    child: Transform.scale(
                      scale: 0.9,
                      child: Image.asset(
                        "assets/images/smart-people.png",
                        fit: BoxFit.cover,
                        alignment: Alignment(0, 0),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'Join your favorite \ncampus activities',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
