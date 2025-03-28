import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reset_password_request_widget.dart' show ResetPasswordRequestWidget;
import 'package:flutter/material.dart';

class ResetPasswordRequestModel
    extends FlutterFlowModel<ResetPasswordRequestWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
