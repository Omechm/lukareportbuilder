import '../database.dart';

class ChoiceOptionsTable extends SupabaseTable<ChoiceOptionsRow> {
  @override
  String get tableName => 'choice_options';

  @override
  ChoiceOptionsRow createRow(Map<String, dynamic> data) =>
      ChoiceOptionsRow(data);
}

class ChoiceOptionsRow extends SupabaseDataRow {
  ChoiceOptionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChoiceOptionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get choice => getField<String>('choice');
  set choice(String? value) => setField<String>('choice', value);

  String? get fieldId => getField<String>('field_id');
  set fieldId(String? value) => setField<String>('field_id', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);
}
