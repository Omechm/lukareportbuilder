import '/backend/supabase/supabase.dart';
import '/components/all_field_control_component_widget.dart';
import '/components/comp_insp_field_create_new_widget.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'reporttemplatesfieldsediting_widget.dart'
    show ReporttemplatesfieldseditingWidget;
import 'package:flutter/material.dart';

class ReporttemplatesfieldseditingModel
    extends FlutterFlowModel<ReporttemplatesfieldseditingWidget> {
  ///  Local state fields for this page.

  String? rebuildPage;

  int? iterator = 0;

  bool pageVarComponentVisi = true;

  List<String> fieldTypes = [];
  void addToFieldTypes(String item) => fieldTypes.add(item);
  void removeFromFieldTypes(String item) => fieldTypes.remove(item);
  void removeAtIndexFromFieldTypes(int index) => fieldTypes.removeAt(index);
  void insertAtIndexInFieldTypes(int index, String item) =>
      fieldTypes.insert(index, item);
  void updateFieldTypesAtIndex(int index, Function(String) updateFn) =>
      fieldTypes[index] = updateFn(fieldTypes[index]);

  bool pageEditTemplateName = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in reporttemplatesfieldsediting widget.
  List<InspectionFieldsRow>? inspectionFieldsQueryOutput;
  // Stores action output result for [Backend Call - Query Rows] action in reporttemplatesfieldsediting widget.
  List<FieldTypesRow>? fieldTypesOutput;
  // Model for sidebarnavCopy component.
  late SidebarnavCopyModel sidebarnavCopyModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<List<InspectionTasksRow>>? requestCompleter;
  // Model for AllFieldControlComponent component.
  late AllFieldControlComponentModel allFieldControlComponentModel;
  // Model for compInspFieldCreateNew component.
  late CompInspFieldCreateNewModel compInspFieldCreateNewModel;

  @override
  void initState(BuildContext context) {
    sidebarnavCopyModel = createModel(context, () => SidebarnavCopyModel());
    allFieldControlComponentModel =
        createModel(context, () => AllFieldControlComponentModel());
    compInspFieldCreateNewModel =
        createModel(context, () => CompInspFieldCreateNewModel());
  }

  @override
  void dispose() {
    sidebarnavCopyModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    allFieldControlComponentModel.dispose();
    compInspFieldCreateNewModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
