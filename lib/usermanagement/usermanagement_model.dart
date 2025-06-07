import '/backend/supabase/supabase.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'usermanagement_widget.dart' show UsermanagementWidget;
import 'package:flutter/material.dart';

class UsermanagementModel extends FlutterFlowModel<UsermanagementWidget> {
  ///  Local state fields for this page.

  List<UserAssignmentsViewRow> unfilteredUsersPageState = [];
  void addToUnfilteredUsersPageState(UserAssignmentsViewRow item) =>
      unfilteredUsersPageState.add(item);
  void removeFromUnfilteredUsersPageState(UserAssignmentsViewRow item) =>
      unfilteredUsersPageState.remove(item);
  void removeAtIndexFromUnfilteredUsersPageState(int index) =>
      unfilteredUsersPageState.removeAt(index);
  void insertAtIndexInUnfilteredUsersPageState(
          int index, UserAssignmentsViewRow item) =>
      unfilteredUsersPageState.insert(index, item);
  void updateUnfilteredUsersPageStateAtIndex(
          int index, Function(UserAssignmentsViewRow) updateFn) =>
      unfilteredUsersPageState[index] =
          updateFn(unfilteredUsersPageState[index]);

  List<UserAssignmentsViewRow> filteredUsersPageState = [];
  void addToFilteredUsersPageState(UserAssignmentsViewRow item) =>
      filteredUsersPageState.add(item);
  void removeFromFilteredUsersPageState(UserAssignmentsViewRow item) =>
      filteredUsersPageState.remove(item);
  void removeAtIndexFromFilteredUsersPageState(int index) =>
      filteredUsersPageState.removeAt(index);
  void insertAtIndexInFilteredUsersPageState(
          int index, UserAssignmentsViewRow item) =>
      filteredUsersPageState.insert(index, item);
  void updateFilteredUsersPageStateAtIndex(
          int index, Function(UserAssignmentsViewRow) updateFn) =>
      filteredUsersPageState[index] = updateFn(filteredUsersPageState[index]);

  String? pageRefresh;

  bool pageAcoountDeletionScreen = false;

  String? pageUserID;

  String? pageUserfullname;

  bool? pageRole = false;

  bool? pageState = false;

  bool? pageCity = false;

  bool? pageFullname = false;

  bool? pageClient = false;

  List<ClientsRow> clients = [];
  void addToClients(ClientsRow item) => clients.add(item);
  void removeFromClients(ClientsRow item) => clients.remove(item);
  void removeAtIndexFromClients(int index) => clients.removeAt(index);
  void insertAtIndexInClients(int index, ClientsRow item) =>
      clients.insert(index, item);
  void updateClientsAtIndex(int index, Function(ClientsRow) updateFn) =>
      clients[index] = updateFn(clients[index]);

  List<String> cities = [];
  void addToCities(String item) => cities.add(item);
  void removeFromCities(String item) => cities.remove(item);
  void removeAtIndexFromCities(int index) => cities.removeAt(index);
  void insertAtIndexInCities(int index, String item) =>
      cities.insert(index, item);
  void updateCitiesAtIndex(int index, Function(String) updateFn) =>
      cities[index] = updateFn(cities[index]);

  List<String> roles = [];
  void addToRoles(String item) => roles.add(item);
  void removeFromRoles(String item) => roles.remove(item);
  void removeAtIndexFromRoles(int index) => roles.removeAt(index);
  void insertAtIndexInRoles(int index, String item) =>
      roles.insert(index, item);
  void updateRolesAtIndex(int index, Function(String) updateFn) =>
      roles[index] = updateFn(roles[index]);

  int iterator = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in usermanagement widget.
  List<ClientsRow>? outputClients;
  // Stores action output result for [Backend Call - Query Rows] action in usermanagement widget.
  List<RolesRow>? outputRoles;
  // Model for sidebarnavCopy component.
  late SidebarnavCopyModel sidebarnavCopyModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextFieldclient widget.
  FocusNode? textFieldclientFocusNode;
  TextEditingController? textFieldclientTextController;
  String? Function(BuildContext, String?)?
      textFieldclientTextControllerValidator;
  // State field(s) for DropDownRole widget.
  String? dropDownRoleValue;
  FormFieldController<String>? dropDownRoleValueController;
  // State field(s) for DropDownState widget.
  String? dropDownStateValue;
  FormFieldController<String>? dropDownStateValueController;
  // State field(s) for DropDownCity widget.
  String? dropDownCityValue;
  FormFieldController<String>? dropDownCityValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Button widget.
  List<UserRow>? outputofAccountDeletion;

  @override
  void initState(BuildContext context) {
    sidebarnavCopyModel = createModel(context, () => SidebarnavCopyModel());
  }

  @override
  void dispose() {
    sidebarnavCopyModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldclientFocusNode?.dispose();
    textFieldclientTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();
  }
}
