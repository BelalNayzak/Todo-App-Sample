import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../model/task.dart';

abstract class CachedDataSource {
  init();

  getAllData();

  putData(Task task);

  updateData(Task task);

  deleteData(Task task);

  close();
}

class CachedDataSourceImpl implements CachedDataSource{
  late Isar isar;

  @override
  init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [TaskSchema],
      directory: dir.path,
    );
  }

  @override
  getAllData() async {
    return await isar.tasks.where().findAll();
  }

  @override
  putData(Task task) async {
    await isar.writeTxn(() async {
      await isar.tasks.put(task);
    });
  }

  @override
  updateData(Task task) async {
    await isar.writeTxn(() async {
      await isar.tasks.put(task);
    });
  }

  @override
  deleteData(Task task) async {
    await isar.writeTxn(() async => await isar.tasks.delete(task.id));
  }

  @override
  close() {
    isar.close();
  }

}