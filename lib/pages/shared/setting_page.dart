import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: const Text(
            'Pengaturan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
  
  static Widget _settingCard({
    required HeroIcons icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: HeroIcon(icon, size: 22),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const HeroIcon(HeroIcons.chevronRight, size: 18),
        onTap: onTap,
      ),
    );
  }
}
