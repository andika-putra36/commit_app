import './providers/task_provider.dart';
import './screens/task_detail_screen.dart';
import './screens/task_create_screen.dart';
import 'package:provider/provider.dart';
import './screens/task_list_screen.dart';
import './theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CommitApp());
}

class CommitApp extends StatelessWidget {
  const CommitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => TaskProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: TaskListScreen(),
        initialRoute: TaskListScreen.routeName,
        routes: {
          TaskListScreen.routeName: (context) => TaskListScreen(),
          TaskDetailScreen.routeName: (context) => TaskDetailScreen(),
          TaskCreateScreen.routeName: (context) => TaskCreateScreen(),
        },
      ),
    );
  }
}
