import '../database.dart';

class InspectionTasksTable extends SupabaseTable<InspectionTasksRow> {
  @override
  String get tableName => 'inspection_tasks';

  @override
  InspectionTasksRow createRow(Map<String, dynamic> data) =>
      InspectionTasksRow(data);
}

class InspectionTasksRow extends SupabaseDataRow {
  InspectionTasksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InspectionTasksTable();

  String get taskId => getField<String>('task_id')!;
  set taskId(String value) => setField<String>('task_id', value);

  String? get clientId => getField<String>('client_id');
  set clientId(String? value) => setField<String>('client_id', value);

  String get taskName => getField<String>('task_name')!;
  set taskName(String value) => setField<String>('task_name', value);

  DateTime? get createdDate => getField<DateTime>('created_date');
  set createdDate(DateTime? value) => setField<DateTime>('created_date', value);

  bool? get isPublished => getField<bool>('is_published');
  set isPublished(bool? value) => setField<bool>('is_published', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);
}
