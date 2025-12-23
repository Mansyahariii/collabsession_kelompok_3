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
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 25),
              // tambahkan teks //
              const Text(
                'Find your dream job\nnow Here',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          )
        )
      )
    );
  }
}
