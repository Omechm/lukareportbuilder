import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detailspage_widget.dart' show DetailspageWidget;
import 'package:flutter/material.dart';

class DetailspageModel extends FlutterFlowModel<DetailspageWidget> {
  ///  Local state fields for this page.

  int? pageFieldNamesIterator;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in detailspage widget.
  List<FieldValuesRow>? fieldValueOutput;
  // Stores action output result for [Backend Call - Query Rows] action in detailspage widget.
  List<InspectionFieldsRow>? fieldNameOutput;
  // Stores action output result for [Backend Call - Query Rows] action in Image widget.
  List<ExecutedTaskNameRow>? outputExecutedReport;
  // Stores action output result for [Backend Call - Query Rows] action in Image widget.
  List<UserRow>? outputExecutedReportUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
