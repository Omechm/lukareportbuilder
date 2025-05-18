import '../database.dart';

class Reportpictures2weeksoldTable
    extends SupabaseTable<Reportpictures2weeksoldRow> {
  @override
  String get tableName => 'reportpictures_2weeksold';

  @override
  Reportpictures2weeksoldRow createRow(Map<String, dynamic> data) =>
      Reportpictures2weeksoldRow(data);
}

class Reportpictures2weeksoldRow extends SupabaseDataRow {
  Reportpictures2weeksoldRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => Reportpictures2weeksoldTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get bucketId => getField<String>('bucket_id');
  set bucketId(String? value) => setField<String>('bucket_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get owner => getField<String>('owner');
  set owner(String? value) => setField<String>('owner', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get lastAccessedAt => getField<DateTime>('last_accessed_at');
  set lastAccessedAt(DateTime? value) =>
      setField<DateTime>('last_accessed_at', value);

  dynamic get metadata => getField<dynamic>('metadata');
  set metadata(dynamic value) => setField<dynamic>('metadata', value);

  List<String> get pathTokens => getListField<String>('path_tokens');
  set pathTokens(List<String>? value) =>
      setListField<String>('path_tokens', value);

  String? get version => getField<String>('version');
  set version(String? value) => setField<String>('version', value);

  String? get ownerId => getField<String>('owner_id');
  set ownerId(String? value) => setField<String>('owner_id', value);

  dynamic get userMetadata => getField<dynamic>('user_metadata');
  set userMetadata(dynamic value) => setField<dynamic>('user_metadata', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);
}
