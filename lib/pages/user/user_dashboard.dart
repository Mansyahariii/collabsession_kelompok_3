import 'package:collabsession/pages/user/user_homepage.dart';
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
    UserHomepage(),
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
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.rectangleStack),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.newspaper),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.userCircle),
            label: '',
          ),
        ],
      ),
    );
  }
}
