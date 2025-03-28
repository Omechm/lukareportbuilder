import '../database.dart';

class ClientServiceOfferingTable
    extends SupabaseTable<ClientServiceOfferingRow> {
  @override
  String get tableName => 'client_service_offering';

  @override
  ClientServiceOfferingRow createRow(Map<String, dynamic> data) =>
      ClientServiceOfferingRow(data);
}

class ClientServiceOfferingRow extends SupabaseDataRow {
  ClientServiceOfferingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClientServiceOfferingTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get serviceOfferingName => getField<String>('service_offering_name');
  set serviceOfferingName(String? value) =>
      setField<String>('service_offering_name', value);

  int? get serviceOfferingId => getField<int>('service_offering_id');
  set serviceOfferingId(int? value) =>
      setField<int>('service_offering_id', value);

  String? get clientName => getField<String>('client_name');
  set clientName(String? value) => setField<String>('client_name', value);

  String? get clientId => getField<String>('client_id');
  set clientId(String? value) => setField<String>('client_id', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);
}
