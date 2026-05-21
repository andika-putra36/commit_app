class UpdateTaskRequest {
  final String title;
  final String subtitle;
  final String startAt;
  final String finishAt;
  final bool isDone;

  UpdateTaskRequest({
    required this.title,
    required this.subtitle,
    required this.startAt,
    required this.finishAt,
    required this.isDone,
  });
}
