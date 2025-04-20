import '../database.dart';

class NonCompliantTaskExecutionGroupTable
    extends SupabaseTable<NonCompliantTaskExecutionGroupRow> {
  @override
  String get tableName => 'non_compliant_task_execution_group';

  @override
  NonCompliantTaskExecutionGroupRow createRow(Map<String, dynamic> data) =>
      NonCompliantTaskExecutionGroupRow(data);
}

class NonCompliantTaskExecutionGroupRow extends SupabaseDataRow {
  NonCompliantTaskExecutionGroupRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NonCompliantTaskExecutionGroupTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get plannedTaskClientName =>
      getField<String>('planned_task_client_name')!;
  set plannedTaskClientName(String value) =>
      setField<String>('planned_task_client_name', value);

  String get plannedTaskName => getField<String>('planned_task_name')!;
  set plannedTaskName(String value) =>
      setField<String>('planned_task_name', value);

  int get count => getField<int>('count')!;
  set count(int value) => setField<int>('count', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get plannedExecutionDate =>
      getField<DateTime>('planned_execution_date');
  set plannedExecutionDate(DateTime? value) =>
      setField<DateTime>('planned_execution_date', value);

  String? get compKey => getField<String>('comp_key');
  set compKey(String? value) => setField<String>('comp_key', value);

  String get companyName => getField<String>('company_name')!;
  set companyName(String value) => setField<String>('company_name', value);
}
