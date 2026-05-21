class ApiConstants {
  static const String baseUrl = 'http://10.0.2.2:8888/api/v1';
  static const String getTasks = '$baseUrl/tasks';
  static const String getTask = '$baseUrl/tasks/:id';
  static const String createTask = '$baseUrl/tasks';
  static const String updateTask = '$baseUrl/tasks/:id';
  static const String deleteTask = '$baseUrl/tasks/:id';
}
