import '../database.dart';

class ClientsTable extends SupabaseTable<ClientsRow> {
  @override
  String get tableName => 'clients';

  @override
  ClientsRow createRow(Map<String, dynamic> data) => ClientsRow(data);
}

class ClientsRow extends SupabaseDataRow {
  ClientsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClientsTable();

  String get clientId => getField<String>('client_id')!;
  set clientId(String value) => setField<String>('client_id', value);

  String get clientName => getField<String>('client_name')!;
  set clientName(String value) => setField<String>('client_name', value);

  String? get contactEmail => getField<String>('contact_email');
  set contactEmail(String? value) => setField<String>('contact_email', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get state => getField<String>('state');
  set state(String? value) => setField<String>('state', value);

  String? get security => getField<String>('security');
  set security(String? value) => setField<String>('security', value);

  String? get cleaning => getField<String>('cleaning');
  set cleaning(String? value) => setField<String>('cleaning', value);

  String? get gardening => getField<String>('gardening');
  set gardening(String? value) => setField<String>('gardening', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);
}
