import 'package:collabsession/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import '../shared/event_page.dart';
import '../shared/setting_page.dart';
import 'admin_homepage.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _currentIndex = 0;
  final NotificationService _notificationService = NotificationService();

  final List<Widget> _pages = [
    AdminHomePage(),
    EventPage(isAdmin: true),
    Settingpage(),
  ];

  PreferredSizeWidget? _buildAppBar() {
    if (_currentIndex == 2) return null;

    return AppBar(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
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
            icon: HeroIcon(HeroIcons.cog6Tooth),
            label: '',
          ),
        ],
      ),
    );
  }
}
