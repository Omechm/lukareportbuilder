import '../database.dart';

class ExecutedTaskWithFieldsJsonTable
    extends SupabaseTable<ExecutedTaskWithFieldsJsonRow> {
  @override
  String get tableName => 'executed_task_with_fields_json';

  @override
  ExecutedTaskWithFieldsJsonRow createRow(Map<String, dynamic> data) =>
      ExecutedTaskWithFieldsJsonRow(data);
}

class ExecutedTaskWithFieldsJsonRow extends SupabaseDataRow {
  ExecutedTaskWithFieldsJsonRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ExecutedTaskWithFieldsJsonTable();

  int? get executedTaskId => getField<int>('executed_task_id');
  set executedTaskId(int? value) => setField<int>('executed_task_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get taskName => getField<String>('task_name');
  set taskName(String? value) => setField<String>('task_name', value);

  String? get taskId => getField<String>('task_id');
  set taskId(String? value) => setField<String>('task_id', value);

  DateTime? get executedDate => getField<DateTime>('executed_date');
  set executedDate(DateTime? value) =>
      setField<DateTime>('executed_date', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get weekNo => getField<int>('week_no');
  set weekNo(int? value) => setField<int>('week_no', value);

  String? get clientName => getField<String>('client_name');
  set clientName(String? value) => setField<String>('client_name', value);

  String? get clientAddress => getField<String>('client_address');
  set clientAddress(String? value) => setField<String>('client_address', value);

  String? get recordId => getField<String>('record_id');
  set recordId(String? value) => setField<String>('record_id', value);

  String? get supervisor => getField<String>('supervisor');
  set supervisor(String? value) => setField<String>('supervisor', value);

  String? get composeKey => getField<String>('composeKey');
  set composeKey(String? value) => setField<String>('composeKey', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get clientId => getField<String>('client_id');
  set clientId(String? value) => setField<String>('client_id', value);

  String? get compKey2 => getField<String>('comp_key_2');
  set compKey2(String? value) => setField<String>('comp_key_2', value);

  String? get compKeytaskIdclientIdtaskId =>
      getField<String>('comp_keytask_idclient_idtask_id');
  set compKeytaskIdclientIdtaskId(String? value) =>
      setField<String>('comp_keytask_idclient_idtask_id', value);

  String? get refreshConTrigger => getField<String>('refresh_con_trigger');
  set refreshConTrigger(String? value) =>
      setField<String>('refresh_con_trigger', value);

  dynamic get fieldsJson => getField<dynamic>('fields_json');
  set fieldsJson(dynamic value) => setField<dynamic>('fields_json', value);
}
