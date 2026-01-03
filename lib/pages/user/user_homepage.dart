import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class UserHomepage extends StatelessWidget {
  const UserHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Text("Selamat Datang!", style: TextStyle(fontSize: 20.0)),
          HeroIcon(HeroIcons.moon, size: 24.0),
        ],
      ),
    );
  }
}
