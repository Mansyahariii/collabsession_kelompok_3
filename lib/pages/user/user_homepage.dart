import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class UserHomepage extends StatelessWidget {
  const UserHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Selamat Datang!", style: TextStyle(fontSize: 20.0)),
              HeroIcon(HeroIcons.moon, size: 24.0),
            ],
          ),

          TextField(
            decoration: InputDecoration(
              hintText: 'Cari Event, Seminar...',
              prefixIcon: const HeroIcon(HeroIcons.magnifyingGlass, size: 20),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
          ),
        ],
      ),
    );
  }
}
