import '../database.dart';

class InspectionFieldsTable extends SupabaseTable<InspectionFieldsRow> {
  @override
  String get tableName => 'inspection_fields';

  @override
  InspectionFieldsRow createRow(Map<String, dynamic> data) =>
      InspectionFieldsRow(data);
}

class InspectionFieldsRow extends SupabaseDataRow {
  InspectionFieldsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InspectionFieldsTable();

  String get fieldId => getField<String>('field_id')!;
  set fieldId(String value) => setField<String>('field_id', value);

  String? get taskId => getField<String>('task_id');
  set taskId(String? value) => setField<String>('task_id', value);

  String? get fieldName => getField<String>('field_name');
  set fieldName(String? value) => setField<String>('field_name', value);

  String? get fieldType => getField<String>('field_type');
  set fieldType(String? value) => setField<String>('field_type', value);

  bool? get isRequired => getField<bool>('is_required');
  set isRequired(bool? value) => setField<bool>('is_required', value);

  String? get defaultValue => getField<String>('default_value');
  set defaultValue(String? value) => setField<String>('default_value', value);

  bool? get isPublished => getField<bool>('is_published');
  set isPublished(bool? value) => setField<bool>('is_published', value);

  int get id => getField<int>('ID')!;
  set id(int value) => setField<int>('ID', value);

  int? get index => getField<int>('index');
  set index(int? value) => setField<int>('index', value);

  dynamic get fieldOptions => getField<dynamic>('field_options');
  set fieldOptions(dynamic value) => setField<dynamic>('field_options', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);
}
