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
        const SizedBox(height: 16),
        _settingCard(
          icon: HeroIcons.user,
          title: 'Akun Saya',
          subtitle: 'Informasi akun dan profil',
          onTap: () {},
        ),
        _settingCard(
          icon: HeroIcons.lockClosed,
          title: 'Keamanan',
          subtitle: 'Ubah password & keamanan akun',
          onTap: () {},
        ),
        _settingCard(
          icon: HeroIcons.questionMarkCircle,
          title: 'Bantuan & Dukungan',
          subtitle: 'FAQ dan pusat bantuan',
          onTap: () {},
        ),
        _settingCard(
          icon: HeroIcons.informationCircle,
          title: 'Tentang Aplikasi',
          subtitle: 'Versi dan informasi aplikasi',
          onTap: () {},
        ),
        _settingCard(
          icon: HeroIcons.users,
          title: 'Tim Pengembang',
          subtitle: 'Profil tim pengembang',
          onTap: () {},
        ),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(52),
            side: BorderSide(color: Colors.red.shade300),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: () {},
          icon: const HeroIcon(
            HeroIcons.arrowRightOnRectangle,
            color: Colors.red,
          ),
          label: const Text('Logout', style: TextStyle(color: Colors.red)),
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
