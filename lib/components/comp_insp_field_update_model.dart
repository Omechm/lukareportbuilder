import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'comp_insp_field_update_widget.dart' show CompInspFieldUpdateWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CompInspFieldUpdateModel
    extends FlutterFlowModel<CompInspFieldUpdateWidget> {
  ///  Local state fields for this component.

  bool compVisi = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldname widget.
  FocusNode? textFieldnameFocusNode;
  TextEditingController? textFieldnameTextController;
  String? Function(BuildContext, String?)? textFieldnameTextControllerValidator;
  // State field(s) for DropDownType widget.
  String? dropDownTypeValue;
  FormFieldController<String>? dropDownTypeValueController;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextFieldOptions widget.
  FocusNode? textFieldOptionsFocusNode;
  TextEditingController? textFieldOptionsTextController;
  String? Function(BuildContext, String?)?
      textFieldOptionsTextControllerValidator;
  Completer<List<ChoiceOptionsRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldnameFocusNode?.dispose();
    textFieldnameTextController?.dispose();

    textFieldOptionsFocusNode?.dispose();
    textFieldOptionsTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
