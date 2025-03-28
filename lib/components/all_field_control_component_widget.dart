import '/backend/supabase/supabase.dart';
import '/components/comp_insp_field_update_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'all_field_control_component_model.dart';
export 'all_field_control_component_model.dart';

class AllFieldControlComponentWidget extends StatefulWidget {
  const AllFieldControlComponentWidget({
    super.key,
    String? taskId,
    required this.fieldTypeList,
  }) : this.taskId = taskId ?? 'null';

  final String taskId;
  final List<String>? fieldTypeList;

  @override
  State<AllFieldControlComponentWidget> createState() =>
      _AllFieldControlComponentWidgetState();
}

class _AllFieldControlComponentWidgetState
    extends State<AllFieldControlComponentWidget> {
  late AllFieldControlComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllFieldControlComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.inspectionFieldsOutput = await InspectionFieldsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'task_id',
              widget.taskId,
            )
            .order('ID', ascending: true),
      );
      while (_model.compItarator! < _model.inspectionFieldsOutput!.length) {
        _model.addToIsVisibleList(false);
        _model.compItarator = _model.compItarator! + 1;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<InspectionFieldsRow>>(
      future: InspectionFieldsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'task_id',
              widget.taskId,
            )
            .order('ID', ascending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 10.0,
              height: 10.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFF7C8289),
                ),
              ),
            ),
          );
        }
        List<InspectionFieldsRow> listViewInspectionFieldsRowList =
            snapshot.data!;

        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: listViewInspectionFieldsRowList.length,
          itemBuilder: (context, listViewIndex) {
            final listViewInspectionFieldsRow =
                listViewInspectionFieldsRowList[listViewIndex];
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.updateIsVisibleListAtIndex(
                        listViewIndex,
                        (_) => _model.isVisibleList
                                    .elementAtOrNull(listViewIndex) ==
                                false
                            ? true
                            : false,
                      );
                      safeSetState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (listViewInspectionFieldsRow.isRequired ?? true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                '*',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Geist Font Family',
                                      color: Color(0xFFE10606),
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                listViewInspectionFieldsRow.fieldName,
                                'null',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Geist Font Family',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 100.0,
                                  height: 65.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await InspectionFieldsTable().delete(
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'field_id',
                                          listViewInspectionFieldsRow.fieldId,
                                        ),
                                      );
                                      await ChoiceOptionsTable().delete(
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'field_id',
                                          listViewInspectionFieldsRow.fieldId,
                                        ),
                                      );
                                      _model.pageRefreshed =
                                          !(_model.pageRefreshed ?? true);
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.delete_sweep_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.compInspFieldUpdateModels.getModel(
                      listViewIndex.toString(),
                      listViewIndex,
                    ),
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: CompInspFieldUpdateWidget(
                      key: Key(
                        'Keymy4_${listViewIndex.toString()}',
                      ),
                      textFieldNameParam: listViewInspectionFieldsRow.fieldName,
                      dropdownFieldTypeParam:
                          listViewInspectionFieldsRow.fieldType!,
                      switchIsRequiredParam:
                          listViewInspectionFieldsRow.isRequired,
                      fieldIdParam: listViewInspectionFieldsRow.fieldId,
                      isVisiParam:
                          _model.isVisibleList.elementAtOrNull(listViewIndex)!,
                      fieldTypeList: widget.fieldTypeList!,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
