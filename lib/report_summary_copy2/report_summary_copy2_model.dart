import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/loading_comp_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dart:async';
import 'report_summary_copy2_widget.dart' show ReportSummaryCopy2Widget;
import 'package:flutter/material.dart';

class ReportSummaryCopy2Model
    extends FlutterFlowModel<ReportSummaryCopy2Widget> {
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

  List<String> pageCompliantLocationId = [];
  void addToPageCompliantLocationId(String item) =>
      pageCompliantLocationId.add(item);
  void removeFromPageCompliantLocationId(String item) =>
      pageCompliantLocationId.remove(item);
  void removeAtIndexFromPageCompliantLocationId(int index) =>
      pageCompliantLocationId.removeAt(index);
  void insertAtIndexInPageCompliantLocationId(int index, String item) =>
      pageCompliantLocationId.insert(index, item);
  void updatePageCompliantLocationIdAtIndex(
          int index, Function(String) updateFn) =>
      pageCompliantLocationId[index] = updateFn(pageCompliantLocationId[index]);

  int? iterator = 0;

  String? pageNonCompliantLocationId;

  bool pageDataisLoading = false;

  List<NonCompliantLocationCountStruct> pageNonCompAgr = [];
  void addToPageNonCompAgr(NonCompliantLocationCountStruct item) =>
      pageNonCompAgr.add(item);
  void removeFromPageNonCompAgr(NonCompliantLocationCountStruct item) =>
      pageNonCompAgr.remove(item);
  void removeAtIndexFromPageNonCompAgr(int index) =>
      pageNonCompAgr.removeAt(index);
  void insertAtIndexInPageNonCompAgr(
          int index, NonCompliantLocationCountStruct item) =>
      pageNonCompAgr.insert(index, item);
  void updatePageNonCompAgrAtIndex(
          int index, Function(NonCompliantLocationCountStruct) updateFn) =>
      pageNonCompAgr[index] = updateFn(pageNonCompAgr[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ReportSummaryCopy2 widget.
  List<InspectionTasksRow>? outputFieldTaskVacancy;
  // Stores action output result for [Backend Call - Query Rows] action in ReportSummaryCopy2 widget.
  List<ExecutedTaskNameRow>? outputExecutedReport;
  // Stores action output result for [Backend Call - Query Rows] action in ReportSummaryCopy2 widget.
  List<InspectionFieldsRow>? outputFieldVacancy;
  // Stores action output result for [Backend Call - Query Rows] action in ReportSummaryCopy2 widget.
  List<FieldValuesRow>? outputFieldValue;
  // Stores action output result for [Backend Call - Query Rows] action in ReportSummaryCopy2 widget.
  List<UserRow>? outputAuthUserInfo;
  // Stores action output result for [Backend Call - Query Rows] action in ReportSummaryCopy2 widget.
  List<UserRow>? outputUsers;
  // Stores action output result for [Backend Call - Query Rows] action in ReportSummaryCopy2 widget.
  List<NonCompliantTaskExecutionGroupRow>? outputNonCompAgr;
  Completer<List<NonCompliantTaskExecutionRow>>? requestCompleter1;
  Completer<List<ExecutedTaskWithFieldsJsonRow>>? requestCompleter2;
  // State field(s) for Summary widget.
  TabController? summaryController;
  int get summaryCurrentIndex =>
      summaryController != null ? summaryController!.index : 0;
  int get summaryPreviousIndex =>
      summaryController != null ? summaryController!.previousIndex : 0;

  // Stores action output result for [Backend Call - API (GetExecutionPercentage)] action in Icon widget.
  ApiCallResponse? outputExecutionPercentage;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  // Stores action output result for [Custom Action - extractImageDateMetadata] action in Image widget.
  DateTime? outputCapturedDate;
  // Stores action output result for [Custom Action - extractExifMetadata] action in Image widget.
  String? outputCapturedData;
  // Stores action output result for [Backend Call - Query Rows] action in Image widget.
  List<UserRow>? outputUser;
  // Stores action output result for [Custom Action - extractImageDateMetadata] action in Image widget.
  DateTime? outputCapturedDateSearched;
  // Stores action output result for [Custom Action - extractExifMetadata] action in Image widget.
  String? outputCapturedDataDateSearched;
  // Stores action output result for [Backend Call - Query Rows] action in Image widget.
  List<UserRow>? outputUserDateSearched;
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
    loadingCompModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
