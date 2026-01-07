import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/activity.dart';
import 'event_detail_page.dart';

class EventPage extends StatelessWidget {
  final bool isAdmin;
  const EventPage({super.key, required this.isAdmin});

  Future<List<Activity>> _fetchEvents() async {
    final data = await Supabase.instance.client
        .from('activities')
        .select()
        .order('date', ascending: true);

    return (data as List).map((e) => Activity.fromMap(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Activity>>(
      future: _fetchEvents(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final events = snapshot.data!;

        if (events.isEmpty) {
          return const Center(child: Text('Belum ada event'));
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Semua Event',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            ...events.map((activity) => _EventTile(activity: activity)),
          ],
        );
      },
    );
  }
}

class _EventTile extends StatelessWidget {
  final Activity activity;

  const _EventTile({required this.activity});

  @override
  Widget build(BuildContext context) {
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    EventDetailPage(activity: activity, isAdmin: true),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity.title,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${_formatDate(activity.date)}, ${activity.location}',
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
}
