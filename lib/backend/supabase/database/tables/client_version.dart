import '../database.dart';

class ClientVersionTable extends SupabaseTable<ClientVersionRow> {
  @override
  String get tableName => 'client_version';

  @override
  ClientVersionRow createRow(Map<String, dynamic> data) =>
      ClientVersionRow(data);
}

class ClientVersionRow extends SupabaseDataRow {
  ClientVersionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClientVersionTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get verison => getField<String>('verison');
  set verison(String? value) => setField<String>('verison', value);

  String? get build => getField<String>('build');
  set build(String? value) => setField<String>('build', value);

  String? get updateChanges => getField<String>('update_changes');
  set updateChanges(String? value) => setField<String>('update_changes', value);
}
