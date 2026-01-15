import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/activity.dart';

class ActivityService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Activity>> fetchActivities() async {
    try {
      final response = await _client
          .from('activities')
          .select()
          .order('date', ascending: true);

      if (response == null) return [];

      return (response as List).map((item) => Activity.fromMap(item)).toList();
    } catch (e) {
      debugPrint('FETCH ACTIVITIES ERROR: $e');
      return [];
    }
  }

  Future<void> addActivity(Map<String, dynamic> data) async {
    await _client.from('activities').insert(data);
  }

  Future<void> updateActivity(String id, Map<String, dynamic> data) async {
    final response = await _client
        .from('activities')
        .update(data)
        .eq('id', id)
        .select();

    debugPrint('UPDATE RESULT: $response');
  }

  Future<void> deleteActivity(String id) async {
    try {
      await _client.from('activities').delete().eq('id', id);
    } catch (e) {
      debugPrint('DELETE ERROR: $e');
      rethrow;
    }
  }
}
