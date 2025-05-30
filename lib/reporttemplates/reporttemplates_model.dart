import '/backend/supabase/supabase.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reporttemplates_widget.dart' show ReporttemplatesWidget;
import 'package:flutter/material.dart';

class ReporttemplatesModel extends FlutterFlowModel<ReporttemplatesWidget> {
  ///  Local state fields for this page.

  String? pageRebuild;

  ///  State fields for stateful widgets in this page.

  // Model for sidebarnavCopy component.
  late SidebarnavCopyModel sidebarnavCopyModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - Update Row(s)] action in Text widget.
  List<InspectionTasksRow>? unArchivedTaskOutput;
  // Stores action output result for [Backend Call - Update Row(s)] action in Text widget.
  List<InspectionFieldsRow>? unArchivedInspectionFieldOutput;

  @override
  void initState(BuildContext context) {
    sidebarnavCopyModel = createModel(context, () => SidebarnavCopyModel());
  }

  @override
  void dispose() {
    sidebarnavCopyModel.dispose();
    tabBarController?.dispose();
  }
}
