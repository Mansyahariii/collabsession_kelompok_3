import 'package:collabsession/pages/shared/event_page.dart';
import 'package:collabsession/pages/shared/setting_page.dart';
import 'package:collabsession/pages/user/user_homepage.dart';
import 'package:collabsession/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _currentIndex = 0;
  final NotificationService _notificationService = NotificationService();

  final List<Widget> _pages = [
    const UserHomepage(),
    const EventPage(isAdmin: false),
    const Settingpage(),
  ];

  @override
  void initState() {
    super.initState();
    // Initialize notification service and start listening for event changes
    _notificationService.initialize().then((_) {
      _notificationService.startListening();
    });
  }

  @override
  void dispose() {
    // Stop listening when user leaves dashboard
    _notificationService.stopListening();
    super.dispose();
  }

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
            icon: HeroIcon(HeroIcons.cog6Tooth),
            label: '',
          ),
        ],
      ),
    );
  }
}
