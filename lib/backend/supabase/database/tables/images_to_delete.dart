import '../database.dart';

class ImagesToDeleteTable extends SupabaseTable<ImagesToDeleteRow> {
  @override
  String get tableName => 'images_to_delete';

  @override
  ImagesToDeleteRow createRow(Map<String, dynamic> data) =>
      ImagesToDeleteRow(data);
}

class ImagesToDeleteRow extends SupabaseDataRow {
  ImagesToDeleteRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ImagesToDeleteTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get imageName => getField<String>('image_name');
  set imageName(String? value) => setField<String>('image_name', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);
}
