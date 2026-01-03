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
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Cari Event, Seminar...',
              prefixIcon: const HeroIcon(HeroIcons.magnifyingGlass, size: 20),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Event Terdekat',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Seminar Nasional',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '12 Okt 2026, Aula Kampus',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    HeroIcon(
                      HeroIcons.playCircle,
                      color: Colors.black,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text('Lihat Detail', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
