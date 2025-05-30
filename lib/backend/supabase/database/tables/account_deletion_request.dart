import '../database.dart';

class AccountDeletionRequestTable
    extends SupabaseTable<AccountDeletionRequestRow> {
  @override
  String get tableName => 'account_deletion_request';

  @override
  AccountDeletionRequestRow createRow(Map<String, dynamic> data) =>
      AccountDeletionRequestRow(data);
}

class AccountDeletionRequestRow extends SupabaseDataRow {
  AccountDeletionRequestRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AccountDeletionRequestTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get reason => getField<String>('reason');
  set reason(String? value) => setField<String>('reason', value);

  String? get additional => getField<String>('additional');
  set additional(String? value) => setField<String>('additional', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
