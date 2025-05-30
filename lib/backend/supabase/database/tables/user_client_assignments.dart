import '../database.dart';

class UserClientAssignmentsTable
    extends SupabaseTable<UserClientAssignmentsRow> {
  @override
  String get tableName => 'user_client_assignments';

  @override
  UserClientAssignmentsRow createRow(Map<String, dynamic> data) =>
      UserClientAssignmentsRow(data);
}

class UserClientAssignmentsRow extends SupabaseDataRow {
  UserClientAssignmentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserClientAssignmentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get clientId => getField<String>('client_id')!;
  set clientId(String value) => setField<String>('client_id', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get clientName => getField<String>('client_name');
  set clientName(String? value) => setField<String>('client_name', value);

  String? get clientAddress => getField<String>('client_address');
  set clientAddress(String? value) => setField<String>('client_address', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String get lastName => getField<String>('last_name')!;
  set lastName(String value) => setField<String>('last_name', value);

  String? get compKey => getField<String>('comp_key');
  set compKey(String? value) => setField<String>('comp_key', value);

  String? get userRole => getField<String>('user_role');
  set userRole(String? value) => setField<String>('user_role', value);
}
