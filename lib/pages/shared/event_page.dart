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
    return ListView();
  }
}

class _EventTile extends StatelessWidget {
  final Activity activity;

  const _EventTile({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
