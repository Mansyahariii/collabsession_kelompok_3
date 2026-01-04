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
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Text('$date, $location'),
        trailing: const HeroIcon(HeroIcons.chevronRight, size: 18),
      ),
    );
  }
}
