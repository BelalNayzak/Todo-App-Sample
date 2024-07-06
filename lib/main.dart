import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_md_sample/core/const/app_constants.dart';
import 'core/services/navigation_services.dart';
import 'feats/tasks/view/tasks_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      getPages: [
        GetPage(
          name: NavigationServices.tasksRoute, page: () => TasksListPage(), binding: TasksBinding(),
        ),
        // ...
      ],
    );
  }
}
