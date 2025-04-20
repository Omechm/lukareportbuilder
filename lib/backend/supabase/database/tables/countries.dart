import '../database.dart';

class CountriesTable extends SupabaseTable<CountriesRow> {
  @override
  String get tableName => 'countries';

  @override
  CountriesRow createRow(Map<String, dynamic> data) => CountriesRow(data);
}

class CountriesRow extends SupabaseDataRow {
  CountriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CountriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get countryName => getField<String>('country_name')!;
  set countryName(String value) => setField<String>('country_name', value);

  String get companyName => getField<String>('company_name')!;
  set companyName(String value) => setField<String>('company_name', value);
}
