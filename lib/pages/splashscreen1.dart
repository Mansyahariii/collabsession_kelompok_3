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
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 25),
              // tambahkan teks //
              const Text(
                'Dapatkan informasi\nkegiatan terbaru.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              // tambahkan Indikator //
              Row(
                children: 
                  const [
                    Icon(Icons.circle, size: 12, color: Colors.blue),
                    SizedBox(width: 8),
                    Icon(Icons.circle, size: 12, color: Colors.grey),
                    SizedBox(width: 8),
                    Icon(Icons.circle, size: 12, color: Colors.grey),
                  ],
              ),

              const Spacer(),
              // tambahkan Bottom buttons//
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Aksi Skip 
                    },
                    child : const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: () {
                      // Next 
                    },
                    child: const Icon(Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    
                  ),
                ],
              )
            ],
          )
        )
      )
    );
  }
}
