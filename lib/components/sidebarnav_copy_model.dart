import '/backend/supabase/supabase.dart';
import '/components/menu_items_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sidebarnav_copy_widget.dart' show SidebarnavCopyWidget;
import 'package:flutter/material.dart';

class SidebarnavCopyModel extends FlutterFlowModel<SidebarnavCopyWidget> {
  ///  Local state fields for this component.

  bool refresh = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in sidebarnavCopy widget.
  List<MenuItemsRow>? outputMenuItem;
  // Model for menuItems component.
  late MenuItemsModel menuItemsModel;

  @override
  void initState(BuildContext context) {
    menuItemsModel = createModel(context, () => MenuItemsModel());
  }

  @override
  void dispose() {
    menuItemsModel.dispose();
  }
}
