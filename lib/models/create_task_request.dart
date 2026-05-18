class CreateTaskRequest {
  final String title;
  final String subtitle;
  final String startAt;
  final String finishAt;

  CreateTaskRequest({
    required this.title,
    required this.subtitle,
    required this.startAt,
    required this.finishAt,
  });
}
