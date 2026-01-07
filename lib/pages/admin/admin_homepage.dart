import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import '../../models/activity.dart';
import '../../services/activity_service.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final ActivityService _activityService = ActivityService();
  late Future<List<Activity>> _activitiesFuture;

  @override
  void initState() {
    super.initState();
    _activitiesFuture = _activityService.fetchActivities();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Activity>>(
      future: _activitiesFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final activities = snapshot.data!;

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Dashboard Admin',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Kelola kegiatan kampus',
              style: TextStyle(color: Colors.grey.shade600),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: _statCard(
                    title: 'Total Event',
                    value: activities.length.toString(),
                    icon: HeroIcons.calendarDays,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _statCard(
                    title: 'Event Aktif',
                    value: activities.length.toString(),
                    icon: HeroIcons.playCircle,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {},
              icon: const HeroIcon(HeroIcons.plus, color: Colors.white),
              label: const Text(
                'Tambah Event',
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Event Terbaru',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            ...activities.take(3).map((activity) => _eventItem(activity)),
          ],
        );
      },
    );
  }

  Widget _statCard({
    required String title,
    required String value,
    required HeroIcons icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeroIcon(icon, size: 22, color: Colors.white),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(title, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _eventItem(Activity activity) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            activity.title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            '${activity.date.day}/${activity.date.month}/${activity.date.year}',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
