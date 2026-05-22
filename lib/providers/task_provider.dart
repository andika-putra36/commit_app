import 'dart:convert';
import 'package:commit_app/models/create_task_request.dart';
import 'package:commit_app/models/update_task_request.dart';

import '../constants/api_constants.dart';
import '../models/task.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  Task? _task;
  String _message = '';

  List<Task> get tasks => _tasks;
  Task? get task => _task;
  String get message => _message;
  int get countTasks => _tasks.length;

  Future<void> getTasks() async {
    _tasks.clear();
    try {
      // print('getTasks()');
      Uri url = Uri.parse(ApiConstants.getTasks);

      final httpResponse = await http.get(url);
      final decoded = json.decode(httpResponse.body);
      final dataResponse = decoded["data"] as List;

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

  Future<void> getTask(int id) async {
    try {
      // print('getTask()');
      Uri url = Uri.parse(
        ApiConstants.getTask.replaceAll(':id', id.toString()),
      );
      // print(url);

      final httpResponse = await http.get(url);
      final decoded = json.decode(httpResponse.body);
      final dataResponse = decoded["data"] as Map<String, dynamic>;

      _task = Task(
        id: dataResponse["id"],
        title: dataResponse["title"],
        subtitle: dataResponse["subtitle"],
        startAt: dataResponse["start_at"],
        finishAt: dataResponse["finish_at"],
        isDone: dataResponse["is_done"],
        createdAt: DateTime.parse(dataResponse["created_at"]),
        updatedAt: DateTime.parse(dataResponse["updated_at"]),
      );

      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }

  Future<void> createTask(CreateTaskRequest request) async {
    try {
      // print('createTask() started');
      Uri url = Uri.parse(ApiConstants.createTask);

      final httpResponse = await http.post(
        url,
        body: json.encode({
          'title': request.title,
          'subtitle': request.subtitle,
          'start_at': request.startAt,
          'finish_at': request.finishAt,
        }),
      );
      final decoded = json.decode(httpResponse.body);
      final dataResponse = decoded["message"] as String;

      _message = dataResponse;

      notifyListeners();
      // print('createTask() finished');
    } catch (e) {
      // print(e);
    }
  }

  Future<void> updateTask(int id, UpdateTaskRequest request) async {
    try {
      Uri url = Uri.parse(
        ApiConstants.updateTask.replaceAll(':id', id.toString()),
      );

      final httpResponse = await http.patch(
        url,
        body: json.encode({
          'title': request.title,
          'subtitle': request.subtitle,
          'start_at': request.startAt,
          'finish_at': request.finishAt,
          'is_done': request.isDone,
        }),
      );

      final decoded = json.decode(httpResponse.body);
      final dataResponse = decoded["message"] as String;

      _message = dataResponse;

      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }

  Future<void> deleteTask(int id) async {
    print('deleteTask()');
    try {
      Uri url = Uri.parse(
        ApiConstants.deleteTask.replaceAll(':id', id.toString()),
      );

      final httpResponse = await http.delete(url);
      final decoded = json.decode(httpResponse.body);
      final dataResponse = decoded["message"] as String;

      _message = dataResponse;

      notifyListeners();
    } catch (e) {
      // print(e);
    }
    print('deleteTask() is done');
  }
}
