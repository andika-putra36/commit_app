import './widgets/master_app_bar.dart';
import 'package:flutter/material.dart';
import './theme/app_theme.dart';

void main() {
  runApp(CommitApp());
}

class CommitApp extends StatelessWidget {
  const CommitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: MasterAppBar(title: 'Commit'),
        body: Container(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
