import '../database.dart';

class PsServiceOfferingsTable extends SupabaseTable<PsServiceOfferingsRow> {
  @override
  String get tableName => 'ps_service_offerings';

  @override
  PsServiceOfferingsRow createRow(Map<String, dynamic> data) =>
      PsServiceOfferingsRow(data);
}

class PsServiceOfferingsRow extends SupabaseDataRow {
  PsServiceOfferingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PsServiceOfferingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get serviceName => getField<String>('service_name');
  set serviceName(String? value) => setField<String>('service_name', value);

  double? get durationmonths => getField<double>('duration(months)');
  set durationmonths(double? value) =>
      setField<double>('duration(months)', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);
}
