import 'package:mockito/mockito.dart';
import 'package:todo_md_sample/feats/tasks/datasource/cached_data.dart';
import 'package:todo_md_sample/feats/tasks/model/task.dart';

class MockCachedDataSourceImpl extends Mock implements CachedDataSourceImpl {}

final mockCachedDataSource = MockCachedDataSourceImpl();
