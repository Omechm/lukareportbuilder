import '../database.dart';

class UserAssignmentsViewTable extends SupabaseTable<UserAssignmentsViewRow> {
  @override
  String get tableName => 'user_assignments_view';

  @override
  UserAssignmentsViewRow createRow(Map<String, dynamic> data) =>
      UserAssignmentsViewRow(data);
}

class UserAssignmentsViewRow extends SupabaseDataRow {
  UserAssignmentsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserAssignmentsViewTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  DateTime? get lastSeen => getField<DateTime>('last_seen');
  set lastSeen(DateTime? value) => setField<DateTime>('last_seen', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get userCompanyName => getField<String>('user_company_name');
  set userCompanyName(String? value) =>
      setField<String>('user_company_name', value);

  String? get supervisorName => getField<String>('supervisor_name');
  set supervisorName(String? value) =>
      setField<String>('supervisor_name', value);

  String? get userEmail => getField<String>('user_email');
  set userEmail(String? value) => setField<String>('user_email', value);

  String? get userUsername => getField<String>('user_username');
  set userUsername(String? value) => setField<String>('user_username', value);

  dynamic get assignments => getField<dynamic>('assignments');
  set assignments(dynamic value) => setField<dynamic>('assignments', value);
}
