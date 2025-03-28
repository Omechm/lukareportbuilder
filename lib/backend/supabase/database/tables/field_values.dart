import '../database.dart';

class FieldValuesTable extends SupabaseTable<FieldValuesRow> {
  @override
  String get tableName => 'field_values';

  @override
  FieldValuesRow createRow(Map<String, dynamic> data) => FieldValuesRow(data);
}

class FieldValuesRow extends SupabaseDataRow {
  FieldValuesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FieldValuesTable();

  String get valueId => getField<String>('value_id')!;
  set valueId(String value) => setField<String>('value_id', value);

  String? get taskId => getField<String>('task_id');
  set taskId(String? value) => setField<String>('task_id', value);

  String? get fieldId => getField<String>('field_id');
  set fieldId(String? value) => setField<String>('field_id', value);

  String get value => getField<String>('value')!;
  set value(String value) => setField<String>('value', value);

  DateTime? get submittedAt => getField<DateTime>('submitted_at');
  set submittedAt(DateTime? value) => setField<DateTime>('submitted_at', value);

  String? get recordId => getField<String>('record_id');
  set recordId(String? value) => setField<String>('record_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get clientId => getField<String>('client_id');
  set clientId(String? value) => setField<String>('client_id', value);

  String? get clientLocationId => getField<String>('client_location_id');
  set clientLocationId(String? value) =>
      setField<String>('client_location_id', value);

  DateTime? get reportDate => getField<DateTime>('report_date');
  set reportDate(DateTime? value) => setField<DateTime>('report_date', value);

  String? get clientAddress => getField<String>('client_address');
  set clientAddress(String? value) => setField<String>('client_address', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get picName => getField<String>('pic_name');
  set picName(String? value) => setField<String>('pic_name', value);

  int? get orderId => getField<int>('order_id');
  set orderId(int? value) => setField<int>('order_id', value);

  DateTime? get imgCapturedDate => getField<DateTime>('img_captured_date');
  set imgCapturedDate(DateTime? value) =>
      setField<DateTime>('img_captured_date', value);

  String? get fieldType => getField<String>('field_type');
  set fieldType(String? value) => setField<String>('field_type', value);

  String? get fieldName => getField<String>('field_name');
  set fieldName(String? value) => setField<String>('field_name', value);
}
