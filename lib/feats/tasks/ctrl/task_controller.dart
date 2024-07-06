import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_md_sample/core/utils/ui_utils/ui_utils.dart';
import 'package:todo_md_sample/feats/tasks/datasource/cached_data.dart';
import '../model/task.dart';

/// Developer Note:
/// ---------------
/// 1. For the error handling, in some cases we can customize the messages based on the error
/// 2. We could create a datasource lcass that wraps the Isar and use this datasource instead
///    it here instead of directly calling the data in
///    the controller, but the app is totally simple
/// ---------------

class TaskController extends GetxController {
  RxList<Task> tasks = <Task>[].obs;
  CachedDataSource tasksDataSource = CachedDataSourceImpl();

  @override
  void onInit() async {
    super.onInit();
    await tasksDataSource.init();
    await loadTasks();
  }

  Future<void> loadTasks() async {
    try {
      final loadedTasks = await tasksDataSource.getAllData();
      tasks.addAll(loadedTasks);
    } catch (e) {
      UiUtils.snack(msg: 'Oops! Something went wrong.');
    }
  }

  Future<void> addTask(String title) async {
    try {
      final task = Task()..title = title;
      tasksDataSource.putData(task);
      tasks.add(task);
    } catch (e) {
      UiUtils.snack(msg: 'Oops! Something went wrong.');
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      tasksDataSource.deleteData(task);
      tasks.remove(task);
    } catch (e) {
      UiUtils.snack(msg: 'Oops! Something went wrong.');
    }
  }

  Future<void> toggleTaskCompletion(int id) async {
    try {
      final task = tasks.firstWhere((task) => task.id == id);
      task.isCompleted = !task.isCompleted;
      tasksDataSource.updateData(task);
      tasks.refresh();
    } catch (e) {
      UiUtils.snack(msg: 'Oops! Something went wrong.');
    }
  }
}
