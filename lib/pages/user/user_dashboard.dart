import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Dashboard User')),
    const Center(child: Text('Events Page')),
    const Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const HeroIcon(
          HeroIcons.squares2x2,
          style: HeroIconStyle.outline,
          color: Colors.black,
        ),
        actions: const [
          HeroIcon(
            HeroIcons.megaphone,
            style: HeroIconStyle.outline,
            color: Colors.black,
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}