import '../database.dart';

class CoursesTable extends SupabaseTable<CoursesRow> {
  @override
  String get tableName => 'courses';

  @override
  CoursesRow createRow(Map<String, dynamic> data) => CoursesRow(data);
}

class CoursesRow extends SupabaseDataRow {
  CoursesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CoursesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get thumbnail => getField<String>('thumbnail');
  set thumbnail(String? value) => setField<String>('thumbnail', value);
}
