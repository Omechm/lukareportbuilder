import '../database.dart';

class UserProgressTable extends SupabaseTable<UserProgressRow> {
  @override
  String get tableName => 'user_progress';

  @override
  UserProgressRow createRow(Map<String, dynamic> data) => UserProgressRow(data);
}

class UserProgressRow extends SupabaseDataRow {
  UserProgressRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserProgressTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get courseId => getField<String>('course_id')!;
  set courseId(String value) => setField<String>('course_id', value);

  String get lessonId => getField<String>('lesson_id')!;
  set lessonId(String value) => setField<String>('lesson_id', value);

  bool? get isCompleted => getField<bool>('is_completed');
  set isCompleted(bool? value) => setField<bool>('is_completed', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get lessonOrderId => getField<int>('lesson_order_id');
  set lessonOrderId(int? value) => setField<int>('lesson_order_id', value);
}
