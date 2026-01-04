import 'package:flutter/material.dart';

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
  const _EventTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}