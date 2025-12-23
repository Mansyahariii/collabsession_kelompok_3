import 'package:collabsession/pages/splashscreen4.dart';
import 'package:collabsession/pages/login.dart';
import 'package:flutter/material.dart';

class Splashscreen3 extends StatelessWidget {
  const Splashscreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // tambahkan illustration splash screen//
              const SizedBox(height: 50),
              Center(
                child: Image.asset(
                  'assets/images/digital-nomad-working-in-airport.png',
                  width: 325,
                  height: 325,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              // tambahkan teks //
              const Text(
                'Get reminders and stay updated',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              // tambahkan Indikator //
              Row(
                children: const [
                  Icon(Icons.circle, size: 6, color: Colors.grey),
                  SizedBox(width: 4),
                  Icon(Icons.circle, size: 6, color: Colors.grey),
                  SizedBox(width: 4),
                  Icon(
                    Icons.circle,
                    size: 6,
                    color: Color.fromARGB(255, 12, 0, 0),
                  ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyLogin()),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(0, 255, 255, 255),
                    ),

                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Splashscreen4(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(24),
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
