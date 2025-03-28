import '/backend/supabase/supabase.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'twst_copy_widget.dart' show TwstCopyWidget;
import 'package:flutter/material.dart';

class TwstCopyModel extends FlutterFlowModel<TwstCopyWidget> {
  ///  Local state fields for this page.

  List<PlannedTaskRow> pagePlan = [];
  void addToPagePlan(PlannedTaskRow item) => pagePlan.add(item);
  void removeFromPagePlan(PlannedTaskRow item) => pagePlan.remove(item);
  void removeAtIndexFromPagePlan(int index) => pagePlan.removeAt(index);
  void insertAtIndexInPagePlan(int index, PlannedTaskRow item) =>
      pagePlan.insert(index, item);
  void updatePagePlanAtIndex(int index, Function(PlannedTaskRow) updateFn) =>
      pagePlan[index] = updateFn(pagePlan[index]);

  List<ExecutedTaskNameRow> pageExecution = [];
  void addToPageExecution(ExecutedTaskNameRow item) => pageExecution.add(item);
  void removeFromPageExecution(ExecutedTaskNameRow item) =>
      pageExecution.remove(item);
  void removeAtIndexFromPageExecution(int index) =>
      pageExecution.removeAt(index);
  void insertAtIndexInPageExecution(int index, ExecutedTaskNameRow item) =>
      pageExecution.insert(index, item);
  void updatePageExecutionAtIndex(
          int index, Function(ExecutedTaskNameRow) updateFn) =>
      pageExecution[index] = updateFn(pageExecution[index]);

  List<String> pageCompliantSupervisors = [];
  void addToPageCompliantSupervisors(String item) =>
      pageCompliantSupervisors.add(item);
  void removeFromPageCompliantSupervisors(String item) =>
      pageCompliantSupervisors.remove(item);
  void removeAtIndexFromPageCompliantSupervisors(int index) =>
      pageCompliantSupervisors.removeAt(index);
  void insertAtIndexInPageCompliantSupervisors(int index, String item) =>
      pageCompliantSupervisors.insert(index, item);
  void updatePageCompliantSupervisorsAtIndex(
          int index, Function(String) updateFn) =>
      pageCompliantSupervisors[index] =
          updateFn(pageCompliantSupervisors[index]);

  List<String> pageCompliantTask = [];
  void addToPageCompliantTask(String item) => pageCompliantTask.add(item);
  void removeFromPageCompliantTask(String item) =>
      pageCompliantTask.remove(item);
  void removeAtIndexFromPageCompliantTask(int index) =>
      pageCompliantTask.removeAt(index);
  void insertAtIndexInPageCompliantTask(int index, String item) =>
      pageCompliantTask.insert(index, item);
  void updatePageCompliantTaskAtIndex(int index, Function(String) updateFn) =>
      pageCompliantTask[index] = updateFn(pageCompliantTask[index]);

  List<PlannedTaskRow> plan = [];
  void addToPlan(PlannedTaskRow item) => plan.add(item);
  void removeFromPlan(PlannedTaskRow item) => plan.remove(item);
  void removeAtIndexFromPlan(int index) => plan.removeAt(index);
  void insertAtIndexInPlan(int index, PlannedTaskRow item) =>
      plan.insert(index, item);
  void updatePlanAtIndex(int index, Function(PlannedTaskRow) updateFn) =>
      plan[index] = updateFn(plan[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in twstCopy widget.
  List<PlannedTaskRow>? outputPlan;
  // Stores action output result for [Custom Action - getCurrentWeekNumber] action in twstCopy widget.
  int? currentWeekNumber;
  // Stores action output result for [Custom Action - getCurrentDate] action in twstCopy widget.
  DateTime? outputCurrentDate;
  // Stores action output result for [Backend Call - Query Rows] action in twstCopy widget.
  List<ExecutedTaskNameRow>? outputExecution;
  // Stores action output result for [Backend Call - Query Rows] action in twstCopy widget.
  List<UserClientAssignmentsRow>? outputUserClientAssignmnet;
  // Stores action output result for [Backend Call - Query Rows] action in twstCopy widget.
  List<UserRow>? outputUsers;
  // Model for sidebarnavCopy component.
  late SidebarnavCopyModel sidebarnavCopyModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {
    sidebarnavCopyModel = createModel(context, () => SidebarnavCopyModel());
  }

  @override
  void dispose() {
    sidebarnavCopyModel.dispose();
    tabBarController?.dispose();
  }
}
