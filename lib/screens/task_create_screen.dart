import 'package:commit_app/theme/app_color.dart';
import 'package:commit_app/theme/app_theme.dart';
import 'package:commit_app/utils/app_size.dart';
import 'package:commit_app/widgets/divider.dart';

import '../widgets/master_base_screen.dart';
import 'package:flutter/material.dart';

class TaskCreateScreen extends StatefulWidget {
  const TaskCreateScreen({super.key});

  static const routeName = '/task-input';

  @override
  State<TaskCreateScreen> createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  final TextEditingController _startAtController = TextEditingController();
  final TextEditingController _finishAtController = TextEditingController();

  TimeOfDay? _selectedStartAt;
  TimeOfDay? _selectedFinishAt;

  Future<void> _pickTime({required void Function(TimeOfDay) onPicked}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        onPicked(picked);
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    _startAtController.dispose();
    _finishAtController.dispose();

    super.dispose();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MasterBasePage(
      masterChild: SizedBox(
        // height: AppSize.bodyHeight(context) / 1.8,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(
                // left: AppSize.screenWidth(context) / 10,
                // right: AppSize.screenWidth(context) / 10,
                // top: AppSize.screenWidth(context) / 15,
                bottom: AppSize.screenWidth(context) / 15,
              ),
              child: Center(
                child: Text.rich(
                  TextSpan(
                    style: AppTheme.lightTheme.textTheme.titleSmall,
                    children: [
                      TextSpan(text: 'Please fill in all '),
                      TextSpan(
                        text: 'required fields',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' to create a new task.'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TextFormString(
              textController: _titleController,
              labelText: 'Title',
            ),
            CleanDividerSmall(),
            TextFormString(
              textController: _subtitleController,
              labelText: 'Subtitle',
            ),
            CleanDividerSmall(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: AppSize.screenWidth(context) / 3,
                  child: GestureDetector(
                    onTap: () {
                      _pickTime(
                        onPicked: (time) {
                          _selectedStartAt = time;
                          print(formatTimeOfDay(_selectedStartAt!));
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.border),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedStartAt == null
                                ? 'Start At'
                                : _selectedStartAt!.format(context),
                          ),
                          const Icon(Icons.access_time),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(' - ', style: AppTheme.lightTheme.textTheme.bodyLarge),
                SizedBox(
                  width: AppSize.screenWidth(context) / 3,
                  child: GestureDetector(
                    onTap: () {
                      _pickTime(
                        onPicked: (time) {
                          _selectedFinishAt = time;
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.border),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedFinishAt == null
                                ? 'Finish At'
                                : _selectedFinishAt!.format(context),
                          ),
                          const Icon(Icons.access_time),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CleanDivider(),
            _isLoading
                ? CircularProgressIndicator(
                    strokeWidth: 3,
                    color: AppColor.textPrimary,
                  )
                : ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.background,
                      foregroundColor: AppColor.border,
                      surfaceTintColor: AppColor.textPrimary,
                    ),
                    child: Text(
                      'Save Task',
                      style: AppTheme.lightTheme.textTheme.bodyLarge,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class TextFormString extends StatelessWidget {
  final TextEditingController textController;
  final int? maxLines;
  final String? labelText;
  final String? Function(String?)? validator;

  const TextFormString({
    super.key,
    required this.textController,
    this.maxLines,
    this.labelText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        labelText: labelText ?? '',
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.border),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.border, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        floatingLabelStyle: TextStyle(color: Colors.black),
      ),
      cursorColor: AppColor.border,
      style: AppTheme.lightTheme.textTheme.bodyMedium,
      validator: validator,
      // (value) {
      //   if (value == null || value.trim().isEmpty) {
      //     return 'Title is required';
      //   }
      //   return null;
      // },
    );
  }
}

String formatTimeOfDay(TimeOfDay time) {
  final hour = time.hour.toString().padLeft(2, '0');
  final minute = time.minute.toString().padLeft(2, '0');

  return '$hour:$minute:00';
}
