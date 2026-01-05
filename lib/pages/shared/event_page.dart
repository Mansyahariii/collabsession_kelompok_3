import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/activity.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  Future<List<Activity>> _fetchEvents() async {
    final data = await Supabase.instance.client
        .from('activities')
        .select()
        .order('date', ascending: true);

    return (data as List).map((e) => Activity.fromMap(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text(
          "Semua Event",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _EventTile(
          title: 'Seminar Nasional',
          date: '12 Okt 2026',
          location: 'Aula Kampus',
        ),
        _EventTile(
          title: 'Workshop Flutter',
          date: '20 Nov 2026',
          location: 'Lab Komputer',
        ),
        _EventTile(
          title: 'Lomba UI/UX',
          date: '20 Okt 2026',
          location: 'Aula Kampus',
        ),
        _EventTile(
          title: 'Webinar Startup',
          date: '25 Okt 2026',
          location: 'Online',
        ),
        _EventTile(
          title: 'Konferensi AI',
          date: '5 Des 2026',
          location: 'Gedung Serbaguna',
        ),
      ],
    );
  }
}

class _EventTile extends StatelessWidget {
  final String title;
  final String date;
  final String location;

  const _EventTile({
    required this.title,
    required this.date,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
