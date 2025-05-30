import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comp_option_list_widget.dart' show CompOptionListWidget;
import 'package:flutter/material.dart';

class CompOptionListModel extends FlutterFlowModel<CompOptionListWidget> {
  ///  Local state fields for this component.

  int iterator = 0;

  bool loading = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Update Row(s)] action in Container widget.
  List<InspectionTasksRow>? archivedTaskOutput;
  // Stores action output result for [Backend Call - Update Row(s)] action in Container widget.
  List<InspectionFieldsRow>? archivedInspectionFieldOutput;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<InspectionTasksRow>? outputExistingTask;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  InspectionTasksRow? ouputNewlyCreatedTaskCopy;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<InspectionFieldsRow>? outputOfExistingTaskFields;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<ChoiceOptionsRow>? outputOfExistingFieldOptions;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  ChoiceOptionsRow? outputNewlyCreatedOption;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  InspectionFieldsRow? ouputNewlyCreatedTaskFieldCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
