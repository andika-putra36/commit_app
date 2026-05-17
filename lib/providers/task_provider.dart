import 'dart:convert';
import '../constants/api_constants.dart';
import '../models/task.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class TaskProvider with ChangeNotifier {
  late Map<String, Task> _tasks;

  Map<String, Task> get tasks => _tasks;

  Future<void> getTasks() async {
    print('getTasks() is called');
    Uri url = Uri.parse('${ApiConstants.baseUrl}/tasks');

    var httpResponse = await http.get(url);
    print(json.decode(httpResponse.body));

    // var dataResponse = json.decode(httpResponse.body) as Map<String, dynamic>;

    // dataResponse.forEach((key, value) {
    //   _allPlayer.add(
    //     Player(
    //       id: key,
    //       createdAt: DateFormat(
    //         'yyyy-mm-dd hh:mm:ss',
    //       ).parse(value['createdAt']),
    //       imageUrl: value['imageUrl'],
    //       name: value['name'],
    //       position: value['position'],
    //     ),
    //   );
    // });

    notifyListeners();
  }
}
