import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'homepage_widget.dart' show HomepageWidget;
import 'package:flutter/material.dart';

class HomepageModel extends FlutterFlowModel<HomepageWidget> {
  ///  Local state fields for this page.

  int pageExecutedReportIterator = 0;

  List<ExecutedReportDtStruct> pageWeeklyExecutedReport = [];
  void addToPageWeeklyExecutedReport(ExecutedReportDtStruct item) =>
      pageWeeklyExecutedReport.add(item);
  void removeFromPageWeeklyExecutedReport(ExecutedReportDtStruct item) =>
      pageWeeklyExecutedReport.remove(item);
  void removeAtIndexFromPageWeeklyExecutedReport(int index) =>
      pageWeeklyExecutedReport.removeAt(index);
  void insertAtIndexInPageWeeklyExecutedReport(
          int index, ExecutedReportDtStruct item) =>
      pageWeeklyExecutedReport.insert(index, item);
  void updatePageWeeklyExecutedReportAtIndex(
          int index, Function(ExecutedReportDtStruct) updateFn) =>
      pageWeeklyExecutedReport[index] =
          updateFn(pageWeeklyExecutedReport[index]);

  bool reportDetailsVisi = false;

  String? reportRecordId = 'null';

  double pageWeeklyExecutionProgressPercent = 0.0;

  double pageActiveUsersPercent = 0.0;

  int? pageNumberOFActiveUsersThisWeek;

  int? pageTotalNumberOfUsers;

  int? pageTotalNumOfPlannedReportThisWeek;

  int? pageTotalNumOfExecutedReport;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in homepage widget.
  List<UserRow>? outputUserInfo;
  // Stores action output result for [Custom Action - getCurrentWeekNumberISO] action in homepage widget.
  int? getCurrentWeekAction;
  // Stores action output result for [Backend Call - Update Row(s)] action in homepage widget.
  List<UserRow>? test;
  // Stores action output result for [Backend Call - Query Rows] action in homepage widget.
  List<ExecutedTaskNameRow>? executedReportOutput;
  // Stores action output result for [Backend Call - Query Rows] action in homepage widget.
  List<PlannedTaskRow>? outputPlannedTask;
  // Stores action output result for [Backend Call - Query Rows] action in homepage widget.
  List<UserRow>? outputUsers;
  // Model for sidebarnavCopy component.
  late SidebarnavCopyModel sidebarnavCopyModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ExecutedReportDtStruct>();
  Stream<List<UserRow>>? textSupabaseStream;

  @override
  void initState(BuildContext context) {
    sidebarnavCopyModel = createModel(context, () => SidebarnavCopyModel());
  }

  @override
  void dispose() {
    sidebarnavCopyModel.dispose();
    paginatedDataTableController.dispose();
  }
}
