import 'package:flutter/material.dart';

class Detileprofile2 extends StatelessWidget {
  const Detileprofile2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(child: Column(children: [Stack(
         clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 220,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1E3A8A),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),
              ]

      )
      ]
      )
      ),
    );
  }
}
