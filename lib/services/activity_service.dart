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
}
