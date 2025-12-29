import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Dashboard Admin')),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 0.5),
          ),
        ),
        child: BottomNavigationBar(
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
      ),
    );
  }
}
