import '/backend/supabase/supabase.dart';
import '/components/loading_comp_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'report_summary_copy_widget.dart' show ReportSummaryCopyWidget;
import 'package:flutter/material.dart';

class ReportSummaryCopyModel extends FlutterFlowModel<ReportSummaryCopyWidget> {
  ///  Local state fields for this page.

  List<ExecutedTaskNameRow> pageExecutedReportUnfiltered = [];
  void addToPageExecutedReportUnfiltered(ExecutedTaskNameRow item) =>
      pageExecutedReportUnfiltered.add(item);
  void removeFromPageExecutedReportUnfiltered(ExecutedTaskNameRow item) =>
      pageExecutedReportUnfiltered.remove(item);
  void removeAtIndexFromPageExecutedReportUnfiltered(int index) =>
      pageExecutedReportUnfiltered.removeAt(index);
  void insertAtIndexInPageExecutedReportUnfiltered(
          int index, ExecutedTaskNameRow item) =>
      pageExecutedReportUnfiltered.insert(index, item);
  void updatePageExecutedReportUnfilteredAtIndex(
          int index, Function(ExecutedTaskNameRow) updateFn) =>
      pageExecutedReportUnfiltered[index] =
          updateFn(pageExecutedReportUnfiltered[index]);

  List<ExecutedTaskNameRow> pageExecutedReportFiltered = [];
  void addToPageExecutedReportFiltered(ExecutedTaskNameRow item) =>
      pageExecutedReportFiltered.add(item);
  void removeFromPageExecutedReportFiltered(ExecutedTaskNameRow item) =>
      pageExecutedReportFiltered.remove(item);
  void removeAtIndexFromPageExecutedReportFiltered(int index) =>
      pageExecutedReportFiltered.removeAt(index);
  void insertAtIndexInPageExecutedReportFiltered(
          int index, ExecutedTaskNameRow item) =>
      pageExecutedReportFiltered.insert(index, item);
  void updatePageExecutedReportFilteredAtIndex(
          int index, Function(ExecutedTaskNameRow) updateFn) =>
      pageExecutedReportFiltered[index] =
          updateFn(pageExecutedReportFiltered[index]);

  bool pageIsFiltered = false;

  int? refresh = 0;

  bool pageToggleFullScreenMode = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ReportSummaryCopy widget.
  List<InspectionTasksRow>? outputFieldTaskVacancy;
  // Stores action output result for [Backend Call - Query Rows] action in ReportSummaryCopy widget.
  List<ExecutedTaskNameRow>? outputExecutedReport;
  // Stores action output result for [Backend Call - Query Rows] action in ReportSummaryCopy widget.
  List<FieldValuesRow>? outputFieldValue;
  // Stores action output result for [Backend Call - Query Rows] action in ReportSummaryCopy widget.
  List<InspectionFieldsRow>? outputFieldVacancy;
  // Stores action output result for [Backend Call - Query Rows] action in ReportSummaryCopy widget.
  List<UserRow>? outputAuthUserInfo;
  // Stores action output result for [Backend Call - Query Rows] action in ReportSummaryCopy widget.
  List<UserRow>? outputUsers;
  // State field(s) for Summary widget.
  TabController? summaryController;
  int get summaryCurrentIndex =>
      summaryController != null ? summaryController!.index : 0;

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<ExecutedTaskNameRow>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<ExecutedTaskNameRow>();
  // Model for loadingComp component.
  late LoadingCompModel loadingCompModel;
  // State field(s) for CalendarDateFrom widget.
  DateTimeRange? calendarDateFromSelectedDay;
  // State field(s) for CalendarDateTo widget.
  DateTimeRange? calendarDateToSelectedDay;

  @override
  void initState(BuildContext context) {
    loadingCompModel = createModel(context, () => LoadingCompModel());
    calendarDateFromSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calendarDateToSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    summaryController?.dispose();
    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
    loadingCompModel.dispose();
  }
}
