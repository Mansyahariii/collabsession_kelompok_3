import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

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
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text('$date, $location'),
        trailing: const HeroIcon(HeroIcons.chevronRight, size: 18),
      ),
    );
  }
}
