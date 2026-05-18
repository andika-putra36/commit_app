class Task {
  final int id;
  final String title;
  final String subtitle;
  final String startAt;
  final String finishAt;
  final bool isDone;
  final DateTime createdAt;
  final DateTime updatedAt;

  Task({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.startAt,
    required this.finishAt,
    required this.isDone,
    required this.createdAt,
    required this.updatedAt,
  });
}
