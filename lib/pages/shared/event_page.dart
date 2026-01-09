import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../models/activity.dart';
import '../../services/activity_service.dart';
import 'event_detail_page.dart';

class EventPage extends StatefulWidget {
  final bool isAdmin;

  const EventPage({super.key, required this.isAdmin});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final ActivityService _activityService = ActivityService();
  List<Activity> _activities = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadActivities();
  }

  Future<void> _loadActivities() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final activities = await _activityService.fetchActivities();
      if (mounted) {
        setState(() {
          _activities = activities;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Gagal memuat data. Tarik untuk refresh.';
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Memuat kegiatan...'),
          ],
        ),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeroIcon(
              HeroIcons.exclamationCircle,
              size: 48,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(_errorMessage!, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadActivities,
              child: const Text('Coba Lagi'),
            ),
          ],
        ),
      );
    }

    if (_activities.isEmpty) {
      return RefreshIndicator(
        onRefresh: _loadActivities,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            SizedBox(height: 200),
            Center(
              child: Column(
                children: [
                  HeroIcon(HeroIcons.calendar, size: 48, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Belum ada kegiatan',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadActivities,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _activities.length,
        itemBuilder: (context, index) {
          return _EventTile(
            activity: _activities[index],
            isAdmin: widget.isAdmin,
            onReturn: (shouldRefresh) {
              if (shouldRefresh == true) {
                _loadActivities();
              }
            },
          );
        },
      ),
    );
  }
}

class _EventTile extends StatelessWidget {
  final Activity activity;
  final bool isAdmin;
  final Function(bool?) onReturn;

  const _EventTile({
    required this.activity,
    required this.isAdmin,
    required this.onReturn,
  });

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
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    EventDetailPage(activity: activity, isAdmin: isAdmin),
              ),
            );
            onReturn(result);
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
                        activity.location,
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