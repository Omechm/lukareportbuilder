import '../database.dart';

class SessionsTable extends SupabaseTable<SessionsRow> {
  @override
  String get tableName => 'sessions';

  @override
  SessionsRow createRow(Map<String, dynamic> data) => SessionsRow(data);
}

class SessionsRow extends SupabaseDataRow {
  SessionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SessionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);
}
