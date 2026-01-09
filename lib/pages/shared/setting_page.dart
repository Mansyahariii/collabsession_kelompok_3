import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../login.dart';
import 'team_page.dart';

class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SizedBox(height: 40),
        Center(
          child: Text(
            'Pengaturan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TeamPage()),
            );
          },
        ),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.red,
            minimumSize: const Size.fromHeight(52),
            side: const BorderSide(color: Colors.transparent),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () async {
            final bool? confirm = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Konfirmasi Logout'),
                  content: const Text(
                    'Apakah kamu yakin ingin keluar dari akun ini?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text(
                        'Batal',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            );

            if (confirm != true) return;

            await Supabase.instance.client.auth.signOut();

            if (context.mounted) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const MyLogin()),
                (route) => false,
              );
            }
          },
          icon: const HeroIcon(
            HeroIcons.arrowRightOnRectangle,
            color: Colors.white,
          ),
          label: const Text('Logout', style: TextStyle(color: Colors.white)),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                HeroIcon(icon, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                const HeroIcon(HeroIcons.chevronRight, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
