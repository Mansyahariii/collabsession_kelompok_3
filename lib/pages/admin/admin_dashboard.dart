import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

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

      body: const Center(child: Text('Dashboard Admin')),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: const HeroIcon(
          HeroIcons.plus,
          style: HeroIconStyle.solid,
          color: Colors.white,
        ),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 0.5),
          ),
        ),
        child: BottomNavigationBar(
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
