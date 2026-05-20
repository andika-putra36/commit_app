import 'package:commit_app/providers/task_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/master_base_screen.dart';
import 'package:flutter/material.dart';

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({super.key});

  static const routeName = '/task-detail';

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  bool isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    final id = args["id"] as int;

    if (isInit) {
      Provider.of<TaskProvider>(context).getTask(id);
      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final taskProvider = Provider.of<TaskProvider>(context);

    return MasterBasePage(masterChild: SizedBox(child: Column()));
  }
}
