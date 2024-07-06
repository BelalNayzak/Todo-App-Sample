import 'package:get/get.dart';

import '../../feats/tasks/ctrl/task_controller.dart';

class NavigationServices {
  static const String tasksRoute = '/';
  // ...
}


/// ================== Navigation Bindings ==============

class TasksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskController>(() => TaskController());
  }
}

// ...