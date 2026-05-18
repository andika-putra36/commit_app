import 'dart:convert';
import '../constants/api_constants.dart';
import '../models/task.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;
  int get countTasks => _tasks.length;

  Future<void> getTasks() async {
    try {
      // print('getTasks()');
      Uri url = Uri.parse(ApiConstants.getTasks);

      final httpResponse = await http.get(url);

      final decoded = json.decode(httpResponse.body);

      // print(decoded);

      final dataResponse = decoded["data"] as List;

      _tasks.clear();

      for (var value in dataResponse) {
        _tasks.add(
          Task(
            id: value["id"],
            title: value["title"],
            subtitle: value["subtitle"],
            startAt: value["start_at"],
            finishAt: value["finish_at"],
            isDone: value["is_done"],
            createdAt: DateTime.parse(value["created_at"]),
            updatedAt: DateTime.parse(value["updated_at"]),
          ),
        );
      }

      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }
}
