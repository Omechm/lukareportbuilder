import '../database.dart';

class VacancyClosureTable extends SupabaseTable<VacancyClosureRow> {
  @override
  String get tableName => 'vacancy_closure';

  @override
  VacancyClosureRow createRow(Map<String, dynamic> data) =>
      VacancyClosureRow(data);
}

class VacancyClosureRow extends SupabaseDataRow {
  VacancyClosureRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VacancyClosureTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get numberOfReplacedVacancy =>
      getField<int>('number_of_replaced_vacancy');
  set numberOfReplacedVacancy(int? value) =>
      setField<int>('number_of_replaced_vacancy', value);

  String? get recordId => getField<String>('record_id');
  set recordId(String? value) => setField<String>('record_id', value);

  int? get numberOfReportedVacancy =>
      getField<int>('number_of_reported_vacancy');
  set numberOfReportedVacancy(int? value) =>
      setField<int>('number_of_reported_vacancy', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);
}
