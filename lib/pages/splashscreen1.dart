import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // buat scaffold untuk splash screen //
    return Scaffold(
    backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // tambahkan illustration splash screen //
              Center(
                child: Image.asset(
                  'assets/images/megaphone-voice-being-heard.png',
                  width: 500,
                  height: 400,
                ),
              ),
            ],
          )
        )
      )
    );
  }
}
