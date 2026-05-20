class Task {
  final int? id;
  final String? title;
  final String? subtitle;
  final String? startAt;
  final String? finishAt;
  final bool? isDone;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Task({
    this.id,
    this.title,
    this.subtitle,
    this.startAt,
    this.finishAt,
    this.isDone,
    this.createdAt,
    this.updatedAt,
  });
}
