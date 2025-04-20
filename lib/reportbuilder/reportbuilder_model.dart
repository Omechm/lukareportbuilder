import '/backend/supabase/supabase.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'reportbuilder_widget.dart' show ReportbuilderWidget;
import 'package:flutter/material.dart';

class ReportbuilderModel extends FlutterFlowModel<ReportbuilderWidget> {
  ///  Local state fields for this page.

  String? newTemplateId;

  String? templateTitle;

  int? rowsReturned;

  bool isTemplatedSaved = false;

  bool saveTemplateButtonVisibility = false;

  String? pageRebuild;

  int? iterator = 0;

  bool publishTemplateButtonVisibility = false;

  int fieldOptionsIterator = 0;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? designReportTemplateController;
  // Model for sidebarnavCopy component.
  late SidebarnavCopyModel sidebarnavCopyModel;
  // State field(s) for TextFieldTitle widget.
  FocusNode? textFieldTitleFocusNode;
  TextEditingController? textFieldTitleTextController;
  String? Function(BuildContext, String?)?
      textFieldTitleTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<ClientsRow>? clientListOutput;
  // Stores action output result for [Backend Call - Update Row(s)] action in IconButton widget.
  List<InspectionTasksRow>? updatedTemplateTitleOutput;
  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  InspectionTasksRow? taskTitleNewInsertOutput;
  // State field(s) for TextFieldname widget.
  FocusNode? textFieldnameFocusNode;
  TextEditingController? textFieldnameTextController;
  String? Function(BuildContext, String?)? textFieldnameTextControllerValidator;
  // State field(s) for DropDownType widget.
  String? dropDownTypeValue;
  FormFieldController<String>? dropDownTypeValueController;
  // State field(s) for TextFieldOptions widget.
  FocusNode? textFieldOptionsFocusNode;
  TextEditingController? textFieldOptionsTextController;
  String? Function(BuildContext, String?)?
      textFieldOptionsTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<InspectionFieldsRow>? checkIfFieldNameExistQueryOutput;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<InspectionFieldsRow>? updatedInspectionFieldWithSinglChoice;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChoiceOptionsRow>? fieldOptionsOutput;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<InspectionFieldsRow>? updatedInspectionField;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  InspectionFieldsRow? inspectionFieldInsertOutput;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChoiceOptionsRow? newOP;
  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<InspectionFieldsRow>? newTemplateFieldOutputs;

  @override
  void initState(BuildContext context) {
    sidebarnavCopyModel = createModel(context, () => SidebarnavCopyModel());
  }

  @override
  void dispose() {
    designReportTemplateController?.finish();
    sidebarnavCopyModel.dispose();
    textFieldTitleFocusNode?.dispose();
    textFieldTitleTextController?.dispose();

    textFieldnameFocusNode?.dispose();
    textFieldnameTextController?.dispose();

    textFieldOptionsFocusNode?.dispose();
    textFieldOptionsTextController?.dispose();
  }
}
