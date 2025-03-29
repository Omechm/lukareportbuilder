import '/backend/supabase/supabase.dart';
import '/components/loading_comp_widget.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'plannedreporttask_widget.dart' show PlannedreporttaskWidget;
import 'package:flutter/material.dart';

class PlannedreporttaskModel extends FlutterFlowModel<PlannedreporttaskWidget> {
  ///  Local state fields for this page.

  String? pageRefresh;

  List<String> pageTask = [];
  void addToPageTask(String item) => pageTask.add(item);
  void removeFromPageTask(String item) => pageTask.remove(item);
  void removeAtIndexFromPageTask(int index) => pageTask.removeAt(index);
  void insertAtIndexInPageTask(int index, String item) =>
      pageTask.insert(index, item);
  void updatePageTaskAtIndex(int index, Function(String) updateFn) =>
      pageTask[index] = updateFn(pageTask[index]);

  List<String> pageClientName = [];
  void addToPageClientName(String item) => pageClientName.add(item);
  void removeFromPageClientName(String item) => pageClientName.remove(item);
  void removeAtIndexFromPageClientName(int index) =>
      pageClientName.removeAt(index);
  void insertAtIndexInPageClientName(int index, String item) =>
      pageClientName.insert(index, item);
  void updatePageClientNameAtIndex(int index, Function(String) updateFn) =>
      pageClientName[index] = updateFn(pageClientName[index]);

  List<String> pageClientAddress = [];
  void addToPageClientAddress(String item) => pageClientAddress.add(item);
  void removeFromPageClientAddress(String item) =>
      pageClientAddress.remove(item);
  void removeAtIndexFromPageClientAddress(int index) =>
      pageClientAddress.removeAt(index);
  void insertAtIndexInPageClientAddress(int index, String item) =>
      pageClientAddress.insert(index, item);
  void updatePageClientAddressAtIndex(int index, Function(String) updateFn) =>
      pageClientAddress[index] = updateFn(pageClientAddress[index]);

  bool pageEditing = false;

  List<PlannedTaskRow> pagePlannedTask = [];
  void addToPagePlannedTask(PlannedTaskRow item) => pagePlannedTask.add(item);
  void removeFromPagePlannedTask(PlannedTaskRow item) =>
      pagePlannedTask.remove(item);
  void removeAtIndexFromPagePlannedTask(int index) =>
      pagePlannedTask.removeAt(index);
  void insertAtIndexInPagePlannedTask(int index, PlannedTaskRow item) =>
      pagePlannedTask.insert(index, item);
  void updatePagePlannedTaskAtIndex(
          int index, Function(PlannedTaskRow) updateFn) =>
      pagePlannedTask[index] = updateFn(pagePlannedTask[index]);

  int? numberOfRow = 10;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in plannedreporttask widget.
  List<PlannedTaskRow>? outputPlannedReportTask;
  // Model for sidebarnavCopy component.
  late SidebarnavCopyModel sidebarnavCopyModel;
  // State field(s) for DrpClientFilterWidget widget.
  String? drpClientFilterWidgetValue;
  FormFieldController<String>? drpClientFilterWidgetValueController;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<PlannedTaskRow>();
  // Model for loadingComp component.
  late LoadingCompModel loadingCompModel;

  @override
  void initState(BuildContext context) {
    sidebarnavCopyModel = createModel(context, () => SidebarnavCopyModel());
    loadingCompModel = createModel(context, () => LoadingCompModel());
  }

  @override
  void dispose() {
    sidebarnavCopyModel.dispose();
    paginatedDataTableController.dispose();
    loadingCompModel.dispose();
  }
}
