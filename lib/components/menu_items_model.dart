import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'menu_items_widget.dart' show MenuItemsWidget;
import 'package:flutter/material.dart';

class MenuItemsModel extends FlutterFlowModel<MenuItemsWidget> {
  ///  Local state fields for this component.

  List<bool> isSelected = [];
  void addToIsSelected(bool item) => isSelected.add(item);
  void removeFromIsSelected(bool item) => isSelected.remove(item);
  void removeAtIndexFromIsSelected(int index) => isSelected.removeAt(index);
  void insertAtIndexInIsSelected(int index, bool item) =>
      isSelected.insert(index, item);
  void updateIsSelectedAtIndex(int index, Function(bool) updateFn) =>
      isSelected[index] = updateFn(isSelected[index]);

  int? compiterator = 0;

  String refreshComp = 'neeew';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in menuItems widget.
  List<MenuItemsRow>? outputMenuItems;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
