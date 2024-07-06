import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_md_sample/feats/tasks/ctrl/task_controller.dart';
import 'package:todo_md_sample/feats/tasks/model/task.dart';
import 'mocks/cached_datasource_mock.dart';

void main() {

  group('TaskController Test', () {

    late TaskController taskController;

    setUp(() async {
      final mockCachedDataSource = MockCachedDataSourceImpl();

      when(mockCachedDataSource.init()).thenAnswer((_) async {});
      when(mockCachedDataSource.getAllData())
          .thenAnswer((_) async => <Task>[]); // Provide mock data as needed

      taskController = TaskController();
      taskController.tasksDataSource = mockCachedDataSource;

      taskController.onInit();
    });

    tearDown(() async {
      await taskController.tasksDataSource.close();
    });

    test('Add Task', () async {
      await taskController.addTask('Test Task');
      expect(taskController.tasks.length, 1);
      expect(taskController.tasks[0].title, 'Test Task');
    });

    test('Delete Task', () async {
      await taskController.addTask('Test Task');
      final task = taskController.tasks.last;
      await taskController.deleteTask(task);
      expect(taskController.tasks.isEmpty, true);
    });

    test('Toggle Task Completion', () async {
      await taskController.addTask('Test Task');
      final taskId = taskController.tasks[0].id;
      await taskController.toggleTaskCompletion(taskId);
      expect(taskController.tasks[0].isCompleted, true);
      await taskController.toggleTaskCompletion(taskId);
      expect(taskController.tasks[0].isCompleted, false);
    });
  });
}
