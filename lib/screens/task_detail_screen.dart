import '../widgets/master_base_screen.dart';
import 'package:flutter/material.dart';

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({super.key});

  static const routeName = '/task-detail';

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return MasterBasePage(masterChild: Container());
  }
}
