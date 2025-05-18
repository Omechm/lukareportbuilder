import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/loading_comp_widget.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/index.dart';
import 'userroleassignment_widget.dart' show UserroleassignmentWidget;
import 'package:flutter/material.dart';

class UserroleassignmentModel
    extends FlutterFlowModel<UserroleassignmentWidget> {
  ///  Local state fields for this page.

  List<String> pageRoles = [];
  void addToPageRoles(String item) => pageRoles.add(item);
  void removeFromPageRoles(String item) => pageRoles.remove(item);
  void removeAtIndexFromPageRoles(int index) => pageRoles.removeAt(index);
  void insertAtIndexInPageRoles(int index, String item) =>
      pageRoles.insert(index, item);
  void updatePageRolesAtIndex(int index, Function(String) updateFn) =>
      pageRoles[index] = updateFn(pageRoles[index]);

  List<String> pageLocation = [];
  void addToPageLocation(String item) => pageLocation.add(item);
  void removeFromPageLocation(String item) => pageLocation.remove(item);
  void removeAtIndexFromPageLocation(int index) => pageLocation.removeAt(index);
  void insertAtIndexInPageLocation(int index, String item) =>
      pageLocation.insert(index, item);
  void updatePageLocationAtIndex(int index, Function(String) updateFn) =>
      pageLocation[index] = updateFn(pageLocation[index]);

  List<String> pageAddress = [];
  void addToPageAddress(String item) => pageAddress.add(item);
  void removeFromPageAddress(String item) => pageAddress.remove(item);
  void removeAtIndexFromPageAddress(int index) => pageAddress.removeAt(index);
  void insertAtIndexInPageAddress(int index, String item) =>
      pageAddress.insert(index, item);
  void updatePageAddressAtIndex(int index, Function(String) updateFn) =>
      pageAddress[index] = updateFn(pageAddress[index]);

  bool pageClientSelected = false;

  List<UserClientAssignmentStruct> pageClientForUserAssignmentView = [];
  void addToPageClientForUserAssignmentView(UserClientAssignmentStruct item) =>
      pageClientForUserAssignmentView.add(item);
  void removeFromPageClientForUserAssignmentView(
          UserClientAssignmentStruct item) =>
      pageClientForUserAssignmentView.remove(item);
  void removeAtIndexFromPageClientForUserAssignmentView(int index) =>
      pageClientForUserAssignmentView.removeAt(index);
  void insertAtIndexInPageClientForUserAssignmentView(
          int index, UserClientAssignmentStruct item) =>
      pageClientForUserAssignmentView.insert(index, item);
  void updatePageClientForUserAssignmentViewAtIndex(
          int index, Function(UserClientAssignmentStruct) updateFn) =>
      pageClientForUserAssignmentView[index] =
          updateFn(pageClientForUserAssignmentView[index]);

  List<UserClientAssignmentStruct> pageClientForUserAssignmentEdit = [];
  void addToPageClientForUserAssignmentEdit(UserClientAssignmentStruct item) =>
      pageClientForUserAssignmentEdit.add(item);
  void removeFromPageClientForUserAssignmentEdit(
          UserClientAssignmentStruct item) =>
      pageClientForUserAssignmentEdit.remove(item);
  void removeAtIndexFromPageClientForUserAssignmentEdit(int index) =>
      pageClientForUserAssignmentEdit.removeAt(index);
  void insertAtIndexInPageClientForUserAssignmentEdit(
          int index, UserClientAssignmentStruct item) =>
      pageClientForUserAssignmentEdit.insert(index, item);
  void updatePageClientForUserAssignmentEditAtIndex(
          int index, Function(UserClientAssignmentStruct) updateFn) =>
      pageClientForUserAssignmentEdit[index] =
          updateFn(pageClientForUserAssignmentEdit[index]);

  int pageIterator = 0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in userroleassignment widget.
  List<UserRow>? outputUsers;
  // Stores action output result for [Backend Call - Query Rows] action in userroleassignment widget.
  List<UserClientAssignmentsRow>? outputClientForUserAssignmentView;
  // Stores action output result for [Backend Call - Query Rows] action in userroleassignment widget.
  List<RolesRow>? outputRoles;
  // Stores action output result for [Backend Call - Query Rows] action in userroleassignment widget.
  List<PlannedTaskRow>? outputPlannedTaskLocation;
  // Model for sidebarnavCopy component.
  late SidebarnavCopyModel sidebarnavCopyModel;
  Stream<List<UserRow>>? listViewSupabaseStream;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserRow>? updateUserInfo;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UserRolesRow>? outputUserRole;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserRolesRow>? outputUpdateUserInfo;
  // State field(s) for DropDownClientName widget.
  String? dropDownClientNameValue;
  FormFieldController<String>? dropDownClientNameValueController;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ClientsRow>? outputPlannedTaskClientAddress;
  Stream<List<UserClientAssignmentsRow>>? listViewUserClientSupabaseStream;
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
    loadingCompModel.dispose();
  }
}
