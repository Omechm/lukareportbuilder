import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comp_account_deletion_widget.dart' show CompAccountDeletionWidget;
import 'package:flutter/material.dart';

class CompAccountDeletionModel
    extends FlutterFlowModel<CompAccountDeletionWidget> {
  ///  Local state fields for this component.

  Color? compColor;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Button widget.
  List<UserRow>? outputofAccountDeletion;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
