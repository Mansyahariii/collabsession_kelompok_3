import '../models/activity.dart';

class ActivityService {
  Future<List<Activity>> fetchActivities() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      Activity(
        id: '1',
        title: 'Seminar Teknologi',
        description: 'Seminar seputar teknologi terbaru',
        date: DateTime.now(),
        location: 'Aula Kampus',
      ),
      Activity(
        id: '2',
        title: 'Lomba UI/UX',
        description: 'Kompetisi desain UI/UX',
        date: DateTime.now().add(const Duration(days: 3)),
        location: 'Lab Multimedia',
      ),
    ];
  }
}
