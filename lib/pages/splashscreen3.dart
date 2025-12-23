import 'package:flutter/material.dart';

class Splashscreen3 extends StatelessWidget {
  const Splashscreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body : SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // tambahkan illustration splash screen//
              Center(
                child: Image.asset('assets/images/digital-nomad-working-in-airport.png',
                  width: 300,
                  height : 300,
                  fit: BoxFit.cover,
                  ),
                 ),
              const SizedBox(height: 25),
              // tambahkan teks //
              const Text(
                'Get reminders and stay updated',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              // tambahkan Indikator //
              Row(
                children: 
                  const [
                    Icon(Icons.circle, size: 5, color: Colors.grey),
                    SizedBox(width: 5),
                    Icon(Icons.circle, size: 5, color: Colors.grey),
                    SizedBox(width: 5),
                    Icon(Icons.circle, size: 5, color: Colors.grey),
                    SizedBox(width: 5),
                    Icon(Icons.circle, size: 5, color: Colors.black),
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
              
                ],
              ),
            ]

          )
      ),
      )
    );
  }
}