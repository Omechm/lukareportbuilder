import '../database.dart';

class MenuItemsTable extends SupabaseTable<MenuItemsRow> {
  @override
  String get tableName => 'menu_items';

  @override
  MenuItemsRow createRow(Map<String, dynamic> data) => MenuItemsRow(data);
}

class MenuItemsRow extends SupabaseDataRow {
  MenuItemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MenuItemsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get menuItemName => getField<String>('menu_item_name')!;
  set menuItemName(String value) => setField<String>('menu_item_name', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  int? get itemOrder => getField<int>('item_order');
  set itemOrder(int? value) => setField<int>('item_order', value);

  String? get itemIcon => getField<String>('item_icon');
  set itemIcon(String? value) => setField<String>('item_icon', value);
}
