import '../database.dart';

class UserTable extends SupabaseTable<UserRow> {
  @override
  String get tableName => 'user';

  @override
  UserRow createRow(Map<String, dynamic> data) => UserRow(data);
}

class UserRow extends SupabaseDataRow {
  UserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userPhoto => getField<String>('user_photo');
  set userPhoto(String? value) => setField<String>('user_photo', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  int? get roleId => getField<int>('role_id');
  set roleId(int? value) => setField<int>('role_id', value);

  String? get userRole => getField<String>('user_role');
  set userRole(String? value) => setField<String>('user_role', value);

  String? get userClientAddress => getField<String>('user_client_address');
  set userClientAddress(String? value) =>
      setField<String>('user_client_address', value);

  String? get userClientAddressId => getField<String>('user_client_address_id');
  set userClientAddressId(String? value) =>
      setField<String>('user_client_address_id', value);

  String? get userCompanyName => getField<String>('user_company_name');
  set userCompanyName(String? value) =>
      setField<String>('user_company_name', value);

  String? get userClientName => getField<String>('user_client_name');
  set userClientName(String? value) =>
      setField<String>('user_client_name', value);

  DateTime? get lastSeen => getField<DateTime>('last_seen');
  set lastSeen(DateTime? value) => setField<DateTime>('last_seen', value);

  int? get currentWeek => getField<int>('current_week');
  set currentWeek(int? value) => setField<int>('current_week', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get supervisorName => getField<String>('supervisor_name');
  set supervisorName(String? value) =>
      setField<String>('supervisor_name', value);
}
