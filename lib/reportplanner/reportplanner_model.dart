import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/sidebarnav_copy_widget.dart';
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

  List<String> pageSelectedClientAddress = [];
  void addToPageSelectedClientAddress(String item) =>
      pageSelectedClientAddress.add(item);
  void removeFromPageSelectedClientAddress(String item) =>
      pageSelectedClientAddress.remove(item);
  void removeAtIndexFromPageSelectedClientAddress(int index) =>
      pageSelectedClientAddress.removeAt(index);
  void insertAtIndexInPageSelectedClientAddress(int index, String item) =>
      pageSelectedClientAddress.insert(index, item);
  void updatePageSelectedClientAddressAtIndex(
          int index, Function(String) updateFn) =>
      pageSelectedClientAddress[index] =
          updateFn(pageSelectedClientAddress[index]);

  bool pageEditing = false;

  int pageiterator = 0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in reportplanner widget.
  List<ClientsRow>? outputClient;
  // Stores action output result for [Backend Call - Query Rows] action in reportplanner widget.
  List<InspectionTasksRow>? outputTask;
  // Model for sidebarnavCopy component.
  late SidebarnavCopyModel sidebarnavCopyModel;
  // State field(s) for drpFrequency widget.
  String? drpFrequencyValue;
  FormFieldController<String>? drpFrequencyValueController;
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
  // Stores action output result for [Backend Call - API (GetClientsWithoutTask)] action in drpTaskName widget.
  ApiCallResponse? apiResultdv2;
  // State field(s) for drpClientname widget.
  List<String>? drpClientnameValue;
  FormFieldController<List<String>>? drpClientnameValueController;

  @override
  void initState(BuildContext context) {
    sidebarnavCopyModel = createModel(context, () => SidebarnavCopyModel());
    txtReporttaskNameTextControllerValidator =
        _txtReporttaskNameTextControllerValidator;
  }

  @override
  void dispose() {
    sidebarnavCopyModel.dispose();
    txtReporttaskNameFocusNode?.dispose();
    txtReporttaskNameTextController?.dispose();
  }
}
