import 'package:collabsession/models/activity.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key, required Activity activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Detail Event Page'),
      ),
    );
  }
}