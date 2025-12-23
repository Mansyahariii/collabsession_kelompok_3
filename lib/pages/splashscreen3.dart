import 'package:flutter/material.dart';

class Splashscreen3 extends StatelessWidget {
  const Splashscreen3({super.key});

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
              // tambahkan illustration splash screen//
              const SizedBox(height: 30),
              Center(
                child: Image.asset(
                  'assets/images/digital-nomad-working-in-airport.png',
                  width: 500,
                  height: 500,
                  fit: BoxFit.cover,
                ),
              ),
              // tambahkan teks //
              const Text(
                'Get reminders and stay updated',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 28),
              // tambahkan Indikator //
              Row(
                children: const [
                  Icon(Icons.circle, size: 6, color: Colors.grey),
                  SizedBox(width: 4),
                  Icon(Icons.circle, size: 6, color: Colors.grey),
                  SizedBox(width: 4),
                  Icon(Icons.circle, size: 6, color: Color.fromARGB(255, 12, 0, 0)),
                  SizedBox(width: 4),
                  Icon(Icons.circle, size: 6, color: Colors.grey),
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
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(0, 255, 255, 255),
                    ),

                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () { },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(25),
                      backgroundColor: Colors.black,
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
