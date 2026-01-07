class Activity {
  final int id;
  final String title;
  final String description;
  final DateTime date;
  final String location;

  Activity({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
  });

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: DateTime.parse(map['date']),
      location: map['location'],
    );
  }
}
