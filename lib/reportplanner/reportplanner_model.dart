import '/backend/supabase/supabase.dart';
import '/components/sidebarnav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'reportplanner_widget.dart' show ReportplannerWidget;
import 'package:flutter/material.dart';

class ReportplannerModel extends FlutterFlowModel<ReportplannerWidget> {
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

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in reportplanner widget.
  List<ClientsRow>? outputClient;
  // Stores action output result for [Backend Call - Query Rows] action in reportplanner widget.
  List<InspectionTasksRow>? outputTask;
  // Model for sidebarnav component.
  late SidebarnavModel sidebarnavModel;
  // State field(s) for txtReporttaskName widget.
  FocusNode? txtReporttaskNameFocusNode;
  TextEditingController? txtReporttaskNameTextController;
  String? Function(BuildContext, String?)?
      txtReporttaskNameTextControllerValidator;
  String? _txtReporttaskNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for drpTaskName widget.
  String? drpTaskNameValue;
  FormFieldController<String>? drpTaskNameValueController;
  // State field(s) for drpClientname widget.
  String? drpClientnameValue;
  FormFieldController<String>? drpClientnameValueController;
  // State field(s) for drpAddress widget.
  String? drpAddressValue;
  FormFieldController<String>? drpAddressValueController;
  // State field(s) for drpFrequency widget.
  String? drpFrequencyValue;
  FormFieldController<String>? drpFrequencyValueController;

  @override
  void initState(BuildContext context) {
    sidebarnavModel = createModel(context, () => SidebarnavModel());
    txtReporttaskNameTextControllerValidator =
        _txtReporttaskNameTextControllerValidator;
  }

  @override
  void dispose() {
    sidebarnavModel.dispose();
    txtReporttaskNameFocusNode?.dispose();
    txtReporttaskNameTextController?.dispose();
  }
}
