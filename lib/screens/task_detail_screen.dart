import 'package:commit_app/providers/task_provider.dart';
import 'package:commit_app/theme/app_color.dart';
import 'package:commit_app/theme/app_theme.dart';
import 'package:commit_app/utils/app_size.dart';
import 'package:commit_app/utils/time_utils.dart';
import 'package:commit_app/widgets/divider.dart';
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

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  TimeOfDay? _selectedStartAt;
  TimeOfDay? _selectedFinishAt;
  bool _finished = false;

  final TextEditingController _oldTitleController = TextEditingController();
  final TextEditingController _oldSubtitleController = TextEditingController();
  TimeOfDay? _oldSelectedStartAt;
  TimeOfDay? _oldSelectedFinishAt;
  bool _oldFinished = false;

  bool _isEditSaveLoading = false;
  bool _isDeleteSaveLoading = false;
  bool _isEditMode = false;

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
    _oldTitleController.dispose();
    _oldSubtitleController.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    final id = args["id"] as int;

    if (isInit) {
      await Provider.of<TaskProvider>(context).getTask(id);
      final taskProvider = Provider.of<TaskProvider>(context, listen: false);
      _titleController.text = taskProvider.task!.title!;
      _subtitleController.text = taskProvider.task!.subtitle!;
      _selectedStartAt = timeOfDayFromString(taskProvider.task!.startAt!);
      _selectedFinishAt = timeOfDayFromString(taskProvider.task!.finishAt!);
      _finished = taskProvider.task!.isDone!;

      _oldTitleController.text = taskProvider.task!.title!;
      _oldSubtitleController.text = taskProvider.task!.subtitle!;
      _oldSelectedStartAt = timeOfDayFromString(taskProvider.task!.startAt!);
      _oldSelectedFinishAt = timeOfDayFromString(taskProvider.task!.finishAt!);
      _oldFinished = taskProvider.task!.isDone!;

      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final taskProvider = Provider.of<TaskProvider>(context);
    // _titleController.text = taskProvider.task!.title!;
    // _subtitleController.text = taskProvider.task!.subtitle!;
    // _selectedStartAt = timeOfDayFromString(taskProvider.task!.startAt!);
    // _selectedFinishAt = timeOfDayFromString(taskProvider.task!.finishAt!);
    // _finished = taskProvider.task!.isDone!;

    // print(_finished);

    return MasterBasePage(
      appBarChild: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (_isEditMode) {
                  _titleController.text = _oldTitleController.text;
                  _subtitleController.text = _oldSubtitleController.text;
                  _selectedStartAt = _oldSelectedStartAt;
                  _selectedFinishAt = _oldSelectedFinishAt;
                  _finished = _oldFinished;
                }
                _isEditMode = !_isEditMode;
              });
            },
            icon: _isEditMode == true
                ? Icon(Icons.cancel_outlined)
                : Icon(Icons.edit_outlined),
          ),
        ],
      ),
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
                child: Text(
                  'Review your task details and make changes as needed.',
                  style: AppTheme.lightTheme.textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TextFormString(
              textController: _titleController,
              labelText: 'Title',
              enabled: _isEditMode ? true : false,
            ),
            CleanDividerSmall(),
            TextFormString(
              textController: _subtitleController,
              labelText: 'Subtitle',
              enabled: _isEditMode ? true : false,
            ),
            CleanDividerSmall(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: AppSize.screenWidth(context) / 3,
                  child: GestureDetector(
                    onTap: _isEditMode
                        ? () {
                            _pickTime(
                              onPicked: (time) {
                                _selectedStartAt = time;
                                // print(formatTimeOfDay(_selectedStartAt!));
                              },
                            );
                          }
                        : null,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _isEditMode ? AppColor.border : Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        // color: _isEditMode ? null : Colors.grey.shade200,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedStartAt == null
                                ? 'Start At'
                                : _selectedStartAt!.format(context),
                            style: TextStyle(
                              color: _isEditMode
                                  ? AppColor.border
                                  : Colors.black38,
                            ),
                          ),
                          Icon(
                            Icons.access_time,
                            color: _isEditMode
                                ? AppColor.border
                                : Colors.black38,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  ' - ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _isEditMode ? AppColor.textPrimary : Colors.black38,
                  ),
                ),
                SizedBox(
                  width: AppSize.screenWidth(context) / 3,
                  child: GestureDetector(
                    onTap: _isEditMode
                        ? () {
                            _pickTime(
                              onPicked: (time) {
                                _selectedFinishAt = time;
                                // print(formatTimeOfDay(_selectedFinishAt!));
                              },
                            );
                          }
                        : null,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _isEditMode ? AppColor.border : Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        // color: _isEditMode ? null : Colors.grey.shade200,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedFinishAt == null
                                ? 'Start At'
                                : _selectedFinishAt!.format(context),
                            style: TextStyle(
                              color: _isEditMode
                                  ? AppColor.border
                                  : Colors.black38,
                            ),
                          ),
                          Icon(
                            Icons.access_time,
                            color: _isEditMode
                                ? AppColor.border
                                : Colors.black38,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CleanDividerSmall(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: _finished,
                  onChanged: _isEditMode
                      ? (value) {
                          setState(() {
                            _finished = !_finished;
                            // print(_finished);
                          });
                        }
                      : null,
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Text(
                  'Finished',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: _isEditMode ? AppColor.textPrimary : Colors.black38,
                  ),
                ),
              ],
            ),
            CleanDivider(),
            _isEditMode
                ? _isEditSaveLoading
                      ? CircularProgressIndicator(
                          strokeWidth: 3,
                          color: AppColor.textPrimary,
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            // setState(() => _isEditSaveLoading = true);

                            // try {
                            //   await taskProvider.createTask(
                            //     CreateTaskRequest(
                            //       title: _titleController.text,
                            //       subtitle: _subtitleController.text,
                            //       startAt: formatTimeOfDay(_selectedStartAt!),
                            //       finishAt: formatTimeOfDay(_selectedFinishAt!),
                            //     ),
                            //   );
                            //   await taskProvider.getTasks();

                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(content: Text(taskProvider.message)),
                            //   );

                            //   Navigator.pop(context);
                            // } catch (e) {
                            //   //
                            // } finally {
                            //   setState(() => _isEditSaveLoading = false);
                            // }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.background,
                            foregroundColor: AppColor.border,
                            surfaceTintColor: AppColor.textPrimary,
                          ),
                          child: Text(
                            'Save Task',
                            style: AppTheme.lightTheme.textTheme.bodyLarge,
                          ),
                        )
                : ElevatedButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          // title: Text('Task Deletion Warning'),
                          contentPadding: EdgeInsets.all(30),
                          content: Text(
                            'Are you sure you want to delete this task?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context), // cancel
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.textPrimary,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // your action here
                              },
                              child: Text(
                                'Confirm',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                      // setState(() => _isDeleteSaveLoading = true);

                      // try {
                      //   await taskProvider.createTask(
                      //     CreateTaskRequest(
                      //       title: _titleController.text,
                      //       subtitle: _subtitleController.text,
                      //       startAt: formatTimeOfDay(_selectedStartAt!),
                      //       finishAt: formatTimeOfDay(_selectedFinishAt!),
                      //     ),
                      //   );
                      //   await taskProvider.getTasks();

                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text(taskProvider.message)),
                      //   );

                      //   Navigator.pop(context);
                      // } catch (e) {
                      //   //
                      // } finally {
                      //   setState(() => _isDeleteSaveLoading = false);
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.background,
                      foregroundColor: AppColor.border,
                      surfaceTintColor: AppColor.textPrimary,
                    ),
                    child: Text(
                      'Delete Task',
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
  final bool? enabled;

  const TextFormString({
    super.key,
    required this.textController,
    this.maxLines,
    this.labelText,
    this.validator,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      maxLines: maxLines ?? 1,
      enabled: enabled ?? true,
      decoration: InputDecoration(
        labelText: labelText ?? '',
        border: OutlineInputBorder(),
        // labelStyle: TextStyle(fontSize: 35),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.border),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.border, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        floatingLabelStyle: TextStyle(
          color: enabled == true ? Colors.black : Colors.black38,
        ),
      ),
      cursorColor: AppColor.border,
      // style: AppTheme.lightTheme.textTheme.bodyMedium,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: enabled == true ? AppColor.textPrimary : Colors.black38,
      ),

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
