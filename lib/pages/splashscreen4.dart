import 'package:flutter/material.dart';

class Splashscreen4 extends StatelessWidget {
  const Splashscreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: const Column(
            children: [
              SizedBox(
                height: 500,
                child: Center(
                  child: Image(
                    image: AssetImage(
                      "assets/images/digital-nomad-working-near-beach.png",
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                "Share Event \nWith Friends",
                style: TextStyle(
                  fontSize: 24.0,
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
