import '../providers/task_provider.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../theme/app_color.dart';
import '../theme/app_theme.dart';
import '../utils/app_size.dart';
import '../widgets/master_app_bar.dart';
import 'package:flutter/material.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  static const routeName = '/task-list';

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  // bool isInit = true;

  // @override
  // void didChangeDependencies() {
  //   if (isInit) {
  //     Provider.of<TaskProvider>(context).getTasks();
  //   }
  //   isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Test');
    Provider.of<TaskProvider>(context, listen: false).getTasks();
  }

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = [
      Task(
        id: '1',
        title: 'Study Postgresql',
        subtitle: 'Data will be stored in Postgre',
        startAt: '09:00:00',
        finishAt: '13:00:00',
        isDone: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Task(
        id: '2',
        title: 'Study Go',
        subtitle: 'Data will be transmitted through Go',
        startAt: '13:30:00',
        finishAt: '16:00:00',
        isDone: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Task(
        id: '3',
        title: 'Study Flutter',
        subtitle: 'Data will be shown in Flutter (Mobile)',
        startAt: '16:30:00',
        finishAt: '19:00:00',
        isDone: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      // Task(
      //   id: '1',
      //   title: 'Study Postgresql',
      //   subtitle: 'Data will be stored in Postgre',
      //   startAt: '09:00:00',
      //   finishAt: '13:00:00',
      //   isDone: false,
      //   createdAt: DateTime.now(),
      //   updatedAt: DateTime.now(),
      // ),
      // Task(
      //   id: '2',
      //   title: 'Study Go',
      //   subtitle: 'Data will be transmitted through Go',
      //   startAt: '13:30:00',
      //   finishAt: '16:00:00',
      //   isDone: false,
      //   createdAt: DateTime.now(),
      //   updatedAt: DateTime.now(),
      // ),
      // Task(
      //   id: '3',
      //   title: 'Study Flutter',
      //   subtitle: 'Data will be shown in Flutter (Mobile)',
      //   startAt: '16:30:00',
      //   finishAt: '19:00:00',
      //   isDone: false,
      //   createdAt: DateTime.now(),
      //   updatedAt: DateTime.now(),
      // ),
    ];

    return Scaffold(
      appBar: MasterAppBar(title: 'Commit'),
      body: RefreshIndicator(
        color: AppColor.background,
        backgroundColor: AppColor.textPrimary,
        onRefresh: () async {
          Provider.of<TaskProvider>(context, listen: false).getTasks();
        },
        child: SizedBox(
          height: AppSize.bodyHeight(context),
          width: AppSize.screenWidth(context),
          // color: Colors.amber,
          // padding: EdgeInsets.all(20),
          child: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: tasks.isNotEmpty
                  ? TaskView(tasks: tasks)
                  : EmptyTaskView(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class EmptyTaskView extends StatelessWidget {
  const EmptyTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.bodyHeight(context),
      width: AppSize.screenWidth(context),
      padding: EdgeInsets.only(
        left: AppSize.screenWidth(context) / 10,
        right: AppSize.screenWidth(context) / 10,
        top: AppSize.screenWidth(context) / 15,
        bottom: AppSize.screenWidth(context) / 15,
      ),
      child: Center(
        child: Text(
          'Your task list is empty. Add a new task using the + button below.',
          style: AppTheme.lightTheme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class TaskView extends StatelessWidget {
  const TaskView({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            left: AppSize.screenWidth(context) / 10,
            right: AppSize.screenWidth(context) / 10,
            top: AppSize.screenWidth(context) / 15,
            bottom: AppSize.screenWidth(context) / 15,
          ),
          child: Center(
            child: Text.rich(
              TextSpan(
                style: AppTheme.lightTheme.textTheme.titleSmall,
                children: [
                  TextSpan(text: 'You are now '),
                  TextSpan(
                    text: 'committed',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ' to finish all of your tasks below.'),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        for (int i = 0; i < tasks.length; i++)
          if (i < tasks.length - 1)
            Column(
              children: [
                Container(
                  // height: AppSize.screenHeight(context) / 5,
                  width: AppSize.screenWidth(context),
                  margin: EdgeInsets.only(
                    left: AppSize.screenWidth(context) / 10,
                    right: AppSize.screenWidth(context) / 10,
                  ),
                  padding: EdgeInsets.only(
                    left: AppSize.screenWidth(context) / 10,
                    right: AppSize.screenWidth(context) / 10,
                    top: AppSize.screenHeight(context) / 50,
                    bottom: AppSize.screenHeight(context) / 50,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.background,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColor.border, width: 1.5),
                  ),
                  // color: Colors.red,
                  child: Text(
                    tasks[i].title,
                    style: AppTheme.lightTheme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: AppSize.screenHeight(context) / 30,
                  width: AppSize.screenWidth(context) / 1.3,
                  child: Divider(color: AppColor.border, thickness: 1),
                ),
              ],
            )
          else
            Container(
              // height: AppSize.screenHeight(context) / 5,
              width: AppSize.screenWidth(context),
              margin: EdgeInsets.only(
                left: AppSize.screenWidth(context) / 10,
                right: AppSize.screenWidth(context) / 10,
              ),
              padding: EdgeInsets.only(
                left: AppSize.screenWidth(context) / 10,
                right: AppSize.screenWidth(context) / 10,
                top: AppSize.screenHeight(context) / 50,
                bottom: AppSize.screenHeight(context) / 50,
              ),
              decoration: BoxDecoration(
                color: AppColor.background,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColor.border, width: 1.5),
              ),
              // color: Colors.red,
              child: Text(
                tasks[i].title,
                style: AppTheme.lightTheme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
      ],
    );
  }
}
