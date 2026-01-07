import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/activity.dart';

class ActivityService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Activity>> fetchActivities() async {
    final response = await _client
        .from('activities')
        .select()
        .order('date', ascending: true);

    return response.map<Activity>((item) => Activity.fromMap(item)).toList();
  }

  Future<void> addActivity(Map<String, dynamic> data) async {
    await _client.from('activities').insert(data);
  }

  Future<void> updateActivity(int id, Map<String, dynamic> data) async {
    final response = await _client
        .from('activities')
        .update(data)
        .eq('id', id)
        .select();

    debugPrint('UPDATE RESULT: $response');
  }

  Future<void> deleteActivity(int id) async {
    await _client.from('activities').delete().eq('id', id);
  }
}
