import '../database.dart';

class FieldTypesTable extends SupabaseTable<FieldTypesRow> {
  @override
  String get tableName => 'field_types';

  @override
  FieldTypesRow createRow(Map<String, dynamic> data) => FieldTypesRow(data);
}

class FieldTypesRow extends SupabaseDataRow {
  FieldTypesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FieldTypesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get fieldType => getField<String>('field_type');
  set fieldType(String? value) => setField<String>('field_type', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);
}
