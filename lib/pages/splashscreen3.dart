import 'package:flutter/material.dart';

class Splashscreen3 extends StatelessWidget {
  const Splashscreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body : SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // tambahkan illustration splash screen//
              Center()
            ],

          )
      ),
      )
    );
  }
}