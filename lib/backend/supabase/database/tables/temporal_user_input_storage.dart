import '../database.dart';

class TemporalUserInputStorageTable
    extends SupabaseTable<TemporalUserInputStorageRow> {
  @override
  String get tableName => 'temporal_user_input_storage';

  @override
  TemporalUserInputStorageRow createRow(Map<String, dynamic> data) =>
      TemporalUserInputStorageRow(data);
}

class TemporalUserInputStorageRow extends SupabaseDataRow {
  TemporalUserInputStorageRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TemporalUserInputStorageTable();

  int? get index => getField<int>('index');
  set index(int? value) => setField<int>('index', value);

  String? get fieldName => getField<String>('field_name');
  set fieldName(String? value) => setField<String>('field_name', value);

  String? get fieldValue => getField<String>('field_value');
  set fieldValue(String? value) => setField<String>('field_value', value);

  String? get isRequired => getField<String>('is_required');
  set isRequired(String? value) => setField<String>('is_required', value);

  String? get fieldId => getField<String>('field_id');
  set fieldId(String? value) => setField<String>('field_id', value);

  String? get taskId => getField<String>('task_id');
  set taskId(String? value) => setField<String>('task_id', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get recordId => getField<String>('record_id');
  set recordId(String? value) => setField<String>('record_id', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get inputType => getField<String>('input_type');
  set inputType(String? value) => setField<String>('input_type', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);
}
