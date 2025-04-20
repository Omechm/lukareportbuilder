import '../database.dart';

class LessonsTable extends SupabaseTable<LessonsRow> {
  @override
  String get tableName => 'lessons';

  @override
  LessonsRow createRow(Map<String, dynamic> data) => LessonsRow(data);
}

class LessonsRow extends SupabaseDataRow {
  LessonsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LessonsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get courseId => getField<String>('course_id')!;
  set courseId(String value) => setField<String>('course_id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get contentUrl => getField<String>('content_url');
  set contentUrl(String? value) => setField<String>('content_url', value);

  int? get order => getField<int>('order');
  set order(int? value) => setField<int>('order', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get thumbnail => getField<String>('thumbnail');
  set thumbnail(String? value) => setField<String>('thumbnail', value);
}
