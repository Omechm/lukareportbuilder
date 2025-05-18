import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_report_summary_widget.dart' show TestReportSummaryWidget;
import 'package:flutter/material.dart';

class TestReportSummaryModel extends FlutterFlowModel<TestReportSummaryWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - extractImageDateMetadata] action in Image widget.
  DateTime? outputCapturedDate;
  // Stores action output result for [Custom Action - extractExifMetadata] action in Image widget.
  String? outputCapturedData;
  // Stores action output result for [Backend Call - Query Rows] action in Image widget.
  List<UserRow>? outputUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
