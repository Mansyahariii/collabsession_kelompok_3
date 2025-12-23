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
              const SizedBox(height: 40),
              Row(
                children: [
                  _dot(),
                  const SizedBox(width: 6),
                  _dot(isActive: true),
                  const SizedBox(width: 6),
                  _dot(),
                  const SizedBox(width: 6),
                  _dot(),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(25),
                      backgroundColor: Colors.black,
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dot({bool isActive = false}) {
    return Container(
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.black : Colors.grey,
      ),
    );
  }
}
