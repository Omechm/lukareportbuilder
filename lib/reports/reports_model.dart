import '/backend/supabase/supabase.dart';
import '/components/loading_comp_widget.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reports_widget.dart' show ReportsWidget;
import 'package:flutter/material.dart';

class ReportsModel extends FlutterFlowModel<ReportsWidget> {
  ///  Local state fields for this page.

  int? pageDataIterator = 0;

  List<ExecutedTaskNameRow> executedReportsUnfiltered = [];
  void addToExecutedReportsUnfiltered(ExecutedTaskNameRow item) =>
      executedReportsUnfiltered.add(item);
  void removeFromExecutedReportsUnfiltered(ExecutedTaskNameRow item) =>
      executedReportsUnfiltered.remove(item);
  void removeAtIndexFromExecutedReportsUnfiltered(int index) =>
      executedReportsUnfiltered.removeAt(index);
  void insertAtIndexInExecutedReportsUnfiltered(
          int index, ExecutedTaskNameRow item) =>
      executedReportsUnfiltered.insert(index, item);
  void updateExecutedReportsUnfilteredAtIndex(
          int index, Function(ExecutedTaskNameRow) updateFn) =>
      executedReportsUnfiltered[index] =
          updateFn(executedReportsUnfiltered[index]);

  String? pageRefresh;

  List<ExecutedTaskNameRow> executedReportsfiltered = [];
  void addToExecutedReportsfiltered(ExecutedTaskNameRow item) =>
      executedReportsfiltered.add(item);
  void removeFromExecutedReportsfiltered(ExecutedTaskNameRow item) =>
      executedReportsfiltered.remove(item);
  void removeAtIndexFromExecutedReportsfiltered(int index) =>
      executedReportsfiltered.removeAt(index);
  void insertAtIndexInExecutedReportsfiltered(
          int index, ExecutedTaskNameRow item) =>
      executedReportsfiltered.insert(index, item);
  void updateExecutedReportsfilteredAtIndex(
          int index, Function(ExecutedTaskNameRow) updateFn) =>
      executedReportsfiltered[index] = updateFn(executedReportsfiltered[index]);

  DateTime? dateFrom;

  DateTime? dateTo;

  bool dateFromVisi = false;

  bool dateToVisi = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in reports widget.
  List<ExecutedTaskNameRow>? outputExecutedReport;
  // Model for sidebarnavCopy component.
  late SidebarnavCopyModel sidebarnavCopyModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ExecutedTaskNameRow>();
  // Model for loadingComp component.
  late LoadingCompModel loadingCompModel;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay1;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay2;

  @override
  void initState(BuildContext context) {
    sidebarnavCopyModel = createModel(context, () => SidebarnavCopyModel());
    loadingCompModel = createModel(context, () => LoadingCompModel());
    calendarSelectedDay1 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calendarSelectedDay2 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    sidebarnavCopyModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    paginatedDataTableController.dispose();
    loadingCompModel.dispose();
  }
}
