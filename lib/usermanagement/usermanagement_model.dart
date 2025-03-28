import '/backend/supabase/supabase.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'usermanagement_widget.dart' show UsermanagementWidget;
import 'package:flutter/material.dart';

class UsermanagementModel extends FlutterFlowModel<UsermanagementWidget> {
  ///  Local state fields for this page.

  List<UserRow> unfilteredUsersPageState = [];
  void addToUnfilteredUsersPageState(UserRow item) =>
      unfilteredUsersPageState.add(item);
  void removeFromUnfilteredUsersPageState(UserRow item) =>
      unfilteredUsersPageState.remove(item);
  void removeAtIndexFromUnfilteredUsersPageState(int index) =>
      unfilteredUsersPageState.removeAt(index);
  void insertAtIndexInUnfilteredUsersPageState(int index, UserRow item) =>
      unfilteredUsersPageState.insert(index, item);
  void updateUnfilteredUsersPageStateAtIndex(
          int index, Function(UserRow) updateFn) =>
      unfilteredUsersPageState[index] =
          updateFn(unfilteredUsersPageState[index]);

  List<UserRow> filteredUsersPageState = [];
  void addToFilteredUsersPageState(UserRow item) =>
      filteredUsersPageState.add(item);
  void removeFromFilteredUsersPageState(UserRow item) =>
      filteredUsersPageState.remove(item);
  void removeAtIndexFromFilteredUsersPageState(int index) =>
      filteredUsersPageState.removeAt(index);
  void insertAtIndexInFilteredUsersPageState(int index, UserRow item) =>
      filteredUsersPageState.insert(index, item);
  void updateFilteredUsersPageStateAtIndex(
          int index, Function(UserRow) updateFn) =>
      filteredUsersPageState[index] = updateFn(filteredUsersPageState[index]);

  String? pageRefresh;

  bool pageAcoountDeletionScreen = false;

  String? pageUserID;

  String? pageUserfullname;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in usermanagement widget.
  List<UserRow>? outputUsers;
  // Model for sidebarnavCopy component.
  late SidebarnavCopyModel sidebarnavCopyModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  List<String> simpleSearchResults = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
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

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
