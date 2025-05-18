import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'courselessons_widget.dart' show CourselessonsWidget;
import 'package:flutter/material.dart';

class CourselessonsModel extends FlutterFlowModel<CourselessonsWidget> {
  ///  Local state fields for this page.

  String? videourl;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in courselessons widget.
  List<UserProgressRow>? outputUncompleteLessons;
  // Stores action output result for [Backend Call - Query Rows] action in courselessons widget.
  List<LessonsRow>? outputFirstUncompleteLesson;
  // Stores action output result for [Backend Call - Query Rows] action in Row widget.
  List<LessonsRow>? outputSelectedLesson;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
