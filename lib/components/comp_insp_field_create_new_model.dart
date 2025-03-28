import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'comp_insp_field_create_new_widget.dart'
    show CompInspFieldCreateNewWidget;
import 'package:flutter/material.dart';

class CompInspFieldCreateNewModel
    extends FlutterFlowModel<CompInspFieldCreateNewWidget> {
  ///  Local state fields for this component.

  bool compVisi = true;

  int? compIterator = 0;

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
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  InspectionFieldsRow? outputInsertedOptions;
  // State field(s) for TextFieldOptions widget.
  FocusNode? textFieldOptionsFocusNode;
  TextEditingController? textFieldOptionsTextController;
  String? Function(BuildContext, String?)?
      textFieldOptionsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldnameFocusNode?.dispose();
    textFieldnameTextController?.dispose();

    textFieldOptionsFocusNode?.dispose();
    textFieldOptionsTextController?.dispose();
  }
}
