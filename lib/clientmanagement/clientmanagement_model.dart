import '/backend/supabase/supabase.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'clientmanagement_widget.dart' show ClientmanagementWidget;
import 'package:flutter/material.dart';

class ClientmanagementModel extends FlutterFlowModel<ClientmanagementWidget> {
  ///  Local state fields for this page.

  List<ClientsRow> unfilteredClientPageState = [];
  void addToUnfilteredClientPageState(ClientsRow item) =>
      unfilteredClientPageState.add(item);
  void removeFromUnfilteredClientPageState(ClientsRow item) =>
      unfilteredClientPageState.remove(item);
  void removeAtIndexFromUnfilteredClientPageState(int index) =>
      unfilteredClientPageState.removeAt(index);
  void insertAtIndexInUnfilteredClientPageState(int index, ClientsRow item) =>
      unfilteredClientPageState.insert(index, item);
  void updateUnfilteredClientPageStateAtIndex(
          int index, Function(ClientsRow) updateFn) =>
      unfilteredClientPageState[index] =
          updateFn(unfilteredClientPageState[index]);

  List<ClientsRow> filteredClientPageState = [];
  void addToFilteredClientPageState(ClientsRow item) =>
      filteredClientPageState.add(item);
  void removeFromFilteredClientPageState(ClientsRow item) =>
      filteredClientPageState.remove(item);
  void removeAtIndexFromFilteredClientPageState(int index) =>
      filteredClientPageState.removeAt(index);
  void insertAtIndexInFilteredClientPageState(int index, ClientsRow item) =>
      filteredClientPageState.insert(index, item);
  void updateFilteredClientPageStateAtIndex(
          int index, Function(ClientsRow) updateFn) =>
      filteredClientPageState[index] = updateFn(filteredClientPageState[index]);

  String? pageRefresh;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in clientmanagement widget.
  List<ClientsRow>? outputClient;
  // Model for sidebarnavCopy component.
  late SidebarnavCopyModel sidebarnavCopyModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    sidebarnavCopyModel = createModel(context, () => SidebarnavCopyModel());
  }

  @override
  void dispose() {
    sidebarnavCopyModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
