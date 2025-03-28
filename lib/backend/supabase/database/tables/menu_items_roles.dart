import '../database.dart';

class MenuItemsRolesTable extends SupabaseTable<MenuItemsRolesRow> {
  @override
  String get tableName => 'menu_items_roles';

  @override
  MenuItemsRolesRow createRow(Map<String, dynamic> data) =>
      MenuItemsRolesRow(data);
}

class MenuItemsRolesRow extends SupabaseDataRow {
  MenuItemsRolesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MenuItemsRolesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get menuItemId => getField<int>('menu_item_id');
  set menuItemId(int? value) => setField<int>('menu_item_id', value);

  int? get roleId => getField<int>('role_id');
  set roleId(int? value) => setField<int>('role_id', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);
}
