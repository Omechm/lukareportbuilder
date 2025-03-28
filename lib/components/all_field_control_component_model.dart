import '/backend/supabase/supabase.dart';
import '/components/comp_insp_field_update_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'all_field_control_component_widget.dart'
    show AllFieldControlComponentWidget;
import 'package:flutter/material.dart';

class AllFieldControlComponentModel
    extends FlutterFlowModel<AllFieldControlComponentWidget> {
  ///  Local state fields for this component.

  bool expandBtnVisi = true;

  bool collapseBtnVisi = false;

  bool editCompVisi = false;

  String? fieldName = 'null';

  String? fieldType = 'null';

  bool? isRquired = false;

  bool? pageRefreshed = false;

  bool fieldControlVisi = true;

  List<bool> isVisibleList = [];
  void addToIsVisibleList(bool item) => isVisibleList.add(item);
  void removeFromIsVisibleList(bool item) => isVisibleList.remove(item);
  void removeAtIndexFromIsVisibleList(int index) =>
      isVisibleList.removeAt(index);
  void insertAtIndexInIsVisibleList(int index, bool item) =>
      isVisibleList.insert(index, item);
  void updateIsVisibleListAtIndex(int index, Function(bool) updateFn) =>
      isVisibleList[index] = updateFn(isVisibleList[index]);

  int? compItarator = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in AllFieldControlComponent widget.
  List<InspectionFieldsRow>? inspectionFieldsOutput;
  // Models for compInspFieldUpdate dynamic component.
  late FlutterFlowDynamicModels<CompInspFieldUpdateModel>
      compInspFieldUpdateModels;

  @override
  void initState(BuildContext context) {
    compInspFieldUpdateModels =
        FlutterFlowDynamicModels(() => CompInspFieldUpdateModel());
  }

  @override
  void dispose() {
    compInspFieldUpdateModels.dispose();
  }
}
