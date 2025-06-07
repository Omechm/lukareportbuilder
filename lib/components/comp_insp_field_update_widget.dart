import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'comp_insp_field_update_model.dart';
export 'comp_insp_field_update_model.dart';

class CompInspFieldUpdateWidget extends StatefulWidget {
  const CompInspFieldUpdateWidget({
    super.key,
    this.textFieldNameParam,
    String? dropdownFieldTypeParam,
    this.switchIsRequiredParam,
    String? fieldIdParam,
    bool? isVisiParam,
    required this.fieldTypeList,
  })  : this.dropdownFieldTypeParam = dropdownFieldTypeParam ?? 'null',
        this.fieldIdParam = fieldIdParam ?? 'null',
        this.isVisiParam = isVisiParam ?? false;

  final String? textFieldNameParam;
  final String dropdownFieldTypeParam;
  final bool? switchIsRequiredParam;
  final String fieldIdParam;
  final bool isVisiParam;
  final List<String>? fieldTypeList;

  @override
  State<CompInspFieldUpdateWidget> createState() =>
      _CompInspFieldUpdateWidgetState();
}

class _CompInspFieldUpdateWidgetState extends State<CompInspFieldUpdateWidget> {
  late CompInspFieldUpdateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompInspFieldUpdateModel());

    _model.textFieldnameTextController ??=
        TextEditingController(text: widget.textFieldNameParam);
    _model.textFieldnameFocusNode ??= FocusNode();

    _model.switchValue = widget.switchIsRequiredParam!;
    _model.textFieldOptionsTextController ??= TextEditingController();
    _model.textFieldOptionsFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisiParam,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 500.0,
          maxHeight: 1000.0,
        ),
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(50.0, 10.0, 50.0, 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      'Field Name',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Geist Font Family',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Container(
                    width: 450.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: TextFormField(
                        controller: _model.textFieldnameTextController,
                        focusNode: _model.textFieldnameFocusNode,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Geist Font Family',
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Geist Font Family',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.all(20.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Geist Font Family',
                              letterSpacing: 0.0,
                            ),
                        validator: _model.textFieldnameTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      'Field Type',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Geist Font Family',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Container(
                    width: 450.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: FlutterFlowDropDown<String>(
                      controller: _model.dropDownTypeValueController ??=
                          FormFieldController<String>(
                        _model.dropDownTypeValue ??=
                            widget.dropdownFieldTypeParam,
                      ),
                      options: widget.fieldTypeList!,
                      onChanged: (val) async {
                        safeSetState(() => _model.dropDownTypeValue = val);
                        safeSetState(() {});
                      },
                      width: 300.0,
                      height: 56.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Geist Font Family',
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                      hintText: 'Please select...',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isOverButton: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      'Mark Field as mandatory *',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Geist Font Family',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Switch.adaptive(
                    value: _model.switchValue!,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.switchValue = newValue);
                    },
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).accent1,
                    inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                    inactiveThumbColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                ],
              ),
              if (valueOrDefault<bool>(
                _model.dropDownTypeValue == 'single-choice' ? true : false,
                false,
              ))
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Text(
                          'Choice options',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Geist Font Family',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Container(
                        width: 450.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200.0,
                            child: TextFormField(
                              controller: _model.textFieldOptionsTextController,
                              focusNode: _model.textFieldOptionsFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Geist Font Family',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'TextField',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Geist Font Family',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Geist Font Family',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model
                                  .textFieldOptionsTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await ChoiceOptionsTable().insert({
                                  'choice': _model
                                      .textFieldOptionsTextController.text,
                                  'field_id': widget.fieldIdParam,
                                });
                                safeSetState(
                                    () => _model.requestCompleter = null);
                                await _model.waitForRequestCompleted();
                              },
                              text: 'add',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Geist Font Family',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: FutureBuilder<List<ChoiceOptionsRow>>(
                            future: (_model.requestCompleter ??=
                                    Completer<List<ChoiceOptionsRow>>()
                                      ..complete(ChoiceOptionsTable().queryRows(
                                        queryFn: (q) => q.eqOrNull(
                                          'field_id',
                                          widget.fieldIdParam,
                                        ),
                                      )))
                                .future,
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
                              List<ChoiceOptionsRow>
                                  listViewChoiceOptionsRowList = snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewChoiceOptionsRowList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewChoiceOptionsRow =
                                      listViewChoiceOptionsRowList[
                                          listViewIndex];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD4CDCD),
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
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              listViewChoiceOptionsRow.choice,
                                              'null',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Geist Font Family',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await ChoiceOptionsTable().delete(
                                                matchingRows: (rows) =>
                                                    rows.eqOrNull(
                                                  'id',
                                                  listViewChoiceOptionsRow.id,
                                                ),
                                              );
                                              safeSetState(() => _model
                                                  .requestCompleter = null);
                                              await _model
                                                  .waitForRequestCompleted();
                                            },
                                            child: Icon(
                                              Icons.delete_forever,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        await InspectionFieldsTable().update(
                          data: {
                            'field_name':
                                _model.textFieldnameTextController.text,
                            'field_type': _model.dropDownTypeValue,
                            'is_required': _model.switchValue,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'field_id',
                            widget.fieldIdParam,
                          ),
                        );
                        FFAppState().appPageDataRefreshRequested = true;
                        _model.updatePage(() {});
                        _model.compVisi = false;
                        safeSetState(() {});
                      },
                      text: 'Save',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Geist Font Family',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ].divide(SizedBox(width: 20.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
