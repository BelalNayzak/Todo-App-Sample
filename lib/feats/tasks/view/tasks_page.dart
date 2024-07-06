import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_md_sample/core/const/app_constants.dart';
import '../../../core/style/AppColors.dart';
import '../ctrl/task_controller.dart';

class TasksListPage extends StatelessWidget {
  final TaskController taskController = Get.find();
  final TextEditingController textController = TextEditingController();

  TasksListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      labelText: 'Task Title',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      taskController.addTask(textController.text);
                      textController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: taskController.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskController.tasks[index];
                  return ListTile(
                    title: Text(task.title),
                    trailing: Checkbox(
                      value: task.isCompleted,
                      onChanged: (value) {
                        taskController.toggleTaskCompletion(task.id);
                      },
                    ),
                    leading: IconButton(
                      icon: const Icon(Icons.remove_circle, color: AppColors.red),
                      onPressed: () {
                        taskController.deleteTask(task);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
