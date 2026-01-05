import 'package:collabsession/pages/shared/event_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/activity.dart';

class UserHomepage extends StatelessWidget {
  const UserHomepage({super.key});

  Future<List<Activity>> _fetchActivities() async {
    final response = await Supabase.instance.client
        .from('activities')
        .select()
        .order('date', ascending: true);

    return (response as List).map((e) => Activity.fromMap(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Activity>>(
      future: _fetchActivities(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Belum ada event'));
        }

        final activities = snapshot.data!;
        final eventTerdekat = activities.first;
        final eventLainnya = activities.skip(1).toList();

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              "Selamat Datang!",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari Event, Seminar...',
                prefixIcon: const HeroIcon(HeroIcons.magnifyingGlass, size: 20),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EventDetailPage(activity: eventTerdekat),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Event Terdekat',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      eventTerdekat.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${_formatDate(eventTerdekat.date)}, ${eventTerdekat.location}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        HeroIcon(
                          HeroIcons.playCircle,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Lihat Detail',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _chip('Recommended', true),
                  _chip('Hari Ini', false),
                  _chip('Minggu Ini', false),
                  _chip('Semua', false),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Event Mendatang',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...eventLainnya.map((activity) => _EventTile(activity: activity)),
          ],
        );
      },
    );
  }

  static String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  static Widget _chip(String label, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: active ? Colors.black : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(color: active ? Colors.white : Colors.black),
      ),
    );
  }
}

class _EventTile extends StatelessWidget {
  final Activity activity;
  const _EventTile({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EventDetailPage(activity: activity),
              ),
            );
          },
        ),
      ),
    );
  }
}
