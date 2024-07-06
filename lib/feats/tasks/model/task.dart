import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Id id = Isar.autoIncrement;
  late String title;
  bool isCompleted = false;

  // Task copyWith({
  //   Id? id,
  //   String? title,
  //   bool? isCompleted,
  // }) {
  //   return Task()
  //     ..id = id ?? this.id
  //     ..title = title ?? this.title
  //     ..isCompleted = isCompleted ?? this.isCompleted;
  // }
  //
  // @override
  // String toString() => 'TodoModel(id: $id, title: $title, isCompleted: $isCompleted)';
}
