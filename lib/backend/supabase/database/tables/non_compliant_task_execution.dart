import '../database.dart';

class NonCompliantTaskExecutionTable
    extends SupabaseTable<NonCompliantTaskExecutionRow> {
  @override
  String get tableName => 'non_compliant_task_execution';

  @override
  NonCompliantTaskExecutionRow createRow(Map<String, dynamic> data) =>
      NonCompliantTaskExecutionRow(data);
}

class NonCompliantTaskExecutionRow extends SupabaseDataRow {
  NonCompliantTaskExecutionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NonCompliantTaskExecutionTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get plannedTaskName => getField<String>('planned_task_name');
  set plannedTaskName(String? value) =>
      setField<String>('planned_task_name', value);

  String? get inspectionTaskName => getField<String>('inspection_task_name');
  set inspectionTaskName(String? value) =>
      setField<String>('inspection_task_name', value);

  String? get inspectionTaskId => getField<String>('inspection_task_id');
  set inspectionTaskId(String? value) =>
      setField<String>('inspection_task_id', value);

  String? get plannedTaskInterval => getField<String>('planned_task_interval');
  set plannedTaskInterval(String? value) =>
      setField<String>('planned_task_interval', value);

  String? get plannedTaskClientName =>
      getField<String>('planned_task_client_name');
  set plannedTaskClientName(String? value) =>
      setField<String>('planned_task_client_name', value);

  String? get plannedTaskClientId => getField<String>('planned_task_client_id');
  set plannedTaskClientId(String? value) =>
      setField<String>('planned_task_client_id', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get compKey => getField<String>('comp_key');
  set compKey(String? value) => setField<String>('comp_key', value);

  String? get supervisorUserId => getField<String>('supervisor_user_id');
  set supervisorUserId(String? value) =>
      setField<String>('supervisor_user_id', value);

  String? get compKey2 => getField<String>('comp_key_2');
  set compKey2(String? value) => setField<String>('comp_key_2', value);

  String? get compKeyUniqueEnforcer =>
      getField<String>('comp_Key_unique_enforcer');
  set compKeyUniqueEnforcer(String? value) =>
      setField<String>('comp_Key_unique_enforcer', value);

  DateTime? get plannedExecutionDate =>
      getField<DateTime>('planned_execution_date');
  set plannedExecutionDate(DateTime? value) =>
      setField<DateTime>('planned_execution_date', value);
}
