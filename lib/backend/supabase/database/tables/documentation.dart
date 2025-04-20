import '../database.dart';

class DocumentationTable extends SupabaseTable<DocumentationRow> {
  @override
  String get tableName => 'documentation';

  @override
  DocumentationRow createRow(Map<String, dynamic> data) =>
      DocumentationRow(data);
}

class DocumentationRow extends SupabaseDataRow {
  DocumentationRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DocumentationTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get order => getField<int>('order');
  set order(int? value) => setField<int>('order', value);
}
