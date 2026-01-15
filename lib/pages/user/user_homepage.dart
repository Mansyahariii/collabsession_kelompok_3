import 'package:collabsession/pages/shared/event_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/activity.dart';

class UserHomepage extends StatefulWidget {
  const UserHomepage({super.key});

  @override
  State<UserHomepage> createState() => _UserHomepageState();
}

class _UserHomepageState extends State<UserHomepage> {
  List<Activity> _activities = [];
  bool _isLoading = true;
  RealtimeChannel? _channel;

  @override
  void initState() {
    super.initState();
    _fetchActivities();
    _setupRealtimeListener();
  }

  @override
  void dispose() {
    _channel?.unsubscribe();
    super.dispose();
  }

  Future<void> _fetchActivities() async {
    setState(() => _isLoading = true);

    try {
      final response = await Supabase.instance.client
          .from('activities')
          .select()
          .order('date', ascending: true)
          .limit(5);

      setState(() {
        _activities = (response as List)
            .map((e) => Activity.fromMap(e))
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Error fetching activities: $e');
      setState(() => _isLoading = false);
    }
  }

  void _setupRealtimeListener() {
    _channel = Supabase.instance.client.channel('user-activities-changes');

    _channel!.on(
      RealtimeListenTypes.postgresChanges,
      ChannelFilter(
        event: '*', // Listen to all events (INSERT, UPDATE, DELETE)
        schema: 'public',
        table: 'activities',
      ),
      (payload, [ref]) {
        debugPrint('Activities changed, refreshing...');
        _fetchActivities(); // Auto-refresh when any change happens
      },
    ).subscribe();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_activities.isEmpty) {
      return const Center(child: Text('Belum ada event'));
    }

    final eventTerdekat = _activities.first;
    final eventLainnya = _activities.skip(1).toList();

    return RefreshIndicator(
      onRefresh: _fetchActivities,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Selamat Datang!",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Cari Event, Seminar...',
              prefixIcon: const HeroIcon(HeroIcons.magnifyingGlass, size: 20),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      EventDetailPage(activity: eventTerdekat, isAdmin: false),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Event Terdekat',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    eventTerdekat.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${_formatDate(eventTerdekat.date)}, ${eventTerdekat.location}',
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      HeroIcon(
                        HeroIcons.playCircle,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Lihat Detail',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 36,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _chip('Recommended', true),
                _chip('Hari Ini', false),
                _chip('Minggu Ini', false),
                _chip('Semua', false),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Event Mendatang',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...eventLainnya.map((activity) => _EventTile(activity: activity)),
        ],
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

  static Widget _chip(String label, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: active ? Colors.black : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(color: active ? Colors.white : Colors.black),
      ),
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
                    EventDetailPage(activity: activity, isAdmin: false),
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
                        '${_UserHomepageState._formatDate(activity.date)}, ${activity.location}',
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
}
