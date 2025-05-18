import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'deletepictures_widget.dart' show DeletepicturesWidget;
import 'package:flutter/material.dart';

class DeletepicturesModel extends FlutterFlowModel<DeletepicturesWidget> {
  ///  Local state fields for this page.

  int? pageIterator = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<Reportpictures2weeksoldRow>? output2weeksOldReports;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ReportpicturesUnmatchedRow>? outputUnMatchedImages;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
