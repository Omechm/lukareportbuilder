import '../database.dart';

class ExecutedTaskMergedViewTable
    extends SupabaseTable<ExecutedTaskMergedViewRow> {
  @override
  String get tableName => 'executed_task_merged_view';

  @override
  ExecutedTaskMergedViewRow createRow(Map<String, dynamic> data) =>
      ExecutedTaskMergedViewRow(data);
}

class ExecutedTaskMergedViewRow extends SupabaseDataRow {
  ExecutedTaskMergedViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ExecutedTaskMergedViewTable();

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

  String? get etnClientAddress => getField<String>('etn_client_address');
  set etnClientAddress(String? value) =>
      setField<String>('etn_client_address', value);

  String? get recordId => getField<String>('record_id');
  set recordId(String? value) => setField<String>('record_id', value);

  String? get supervisor => getField<String>('supervisor');
  set supervisor(String? value) => setField<String>('supervisor', value);

  String? get composeKey => getField<String>('composeKey');
  set composeKey(String? value) => setField<String>('composeKey', value);

  String? get etnCompanyName => getField<String>('etn_company_name');
  set etnCompanyName(String? value) =>
      setField<String>('etn_company_name', value);

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

  String? get valueId => getField<String>('value_id');
  set valueId(String? value) => setField<String>('value_id', value);

  String? get fieldId => getField<String>('field_id');
  set fieldId(String? value) => setField<String>('field_id', value);

  String? get value => getField<String>('value');
  set value(String? value) => setField<String>('value', value);

  DateTime? get submittedAt => getField<DateTime>('submitted_at');
  set submittedAt(DateTime? value) => setField<DateTime>('submitted_at', value);

  String? get clientLocationId => getField<String>('client_location_id');
  set clientLocationId(String? value) =>
      setField<String>('client_location_id', value);

  DateTime? get reportDate => getField<DateTime>('report_date');
  set reportDate(DateTime? value) => setField<DateTime>('report_date', value);

  String? get fvClientAddress => getField<String>('fv_client_address');
  set fvClientAddress(String? value) =>
      setField<String>('fv_client_address', value);

  String? get fvCompanyName => getField<String>('fv_company_name');
  set fvCompanyName(String? value) =>
      setField<String>('fv_company_name', value);

  String? get picName => getField<String>('pic_name');
  set picName(String? value) => setField<String>('pic_name', value);

  int? get orderId => getField<int>('order_id');
  set orderId(int? value) => setField<int>('order_id', value);

  DateTime? get imgCapturedDate => getField<DateTime>('img_captured_date');
  set imgCapturedDate(DateTime? value) =>
      setField<DateTime>('img_captured_date', value);

  String? get fvFieldType => getField<String>('fv_field_type');
  set fvFieldType(String? value) => setField<String>('fv_field_type', value);

  String? get fvFieldName => getField<String>('fv_field_name');
  set fvFieldName(String? value) => setField<String>('fv_field_name', value);

  String? get fieldMetaName => getField<String>('field_meta_name');
  set fieldMetaName(String? value) =>
      setField<String>('field_meta_name', value);

  String? get fieldMetaType => getField<String>('field_meta_type');
  set fieldMetaType(String? value) =>
      setField<String>('field_meta_type', value);

  bool? get isRequired => getField<bool>('is_required');
  set isRequired(bool? value) => setField<bool>('is_required', value);

  String? get defaultValue => getField<String>('default_value');
  set defaultValue(String? value) => setField<String>('default_value', value);

  bool? get isPublished => getField<bool>('is_published');
  set isPublished(bool? value) => setField<bool>('is_published', value);

  int? get fieldIndex => getField<int>('field_index');
  set fieldIndex(int? value) => setField<int>('field_index', value);

  dynamic get fieldOptions => getField<dynamic>('field_options');
  set fieldOptions(dynamic value) => setField<dynamic>('field_options', value);

  String? get infCompanyName => getField<String>('inf_company_name');
  set infCompanyName(String? value) =>
      setField<String>('inf_company_name', value);
}
