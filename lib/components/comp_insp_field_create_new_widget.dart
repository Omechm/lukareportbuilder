import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'comp_insp_field_create_new_model.dart';
export 'comp_insp_field_create_new_model.dart';

class CompInspFieldCreateNewWidget extends StatefulWidget {
  const CompInspFieldCreateNewWidget({
    super.key,
    bool? isVisiParam,
    required this.taskID,
    required this.fieldTypeList,
  }) : this.isVisiParam = isVisiParam ?? false;

  final bool isVisiParam;
  final String? taskID;
  final List<String>? fieldTypeList;

  @override
  State<CompInspFieldCreateNewWidget> createState() =>
      _CompInspFieldCreateNewWidgetState();
}

class _CompInspFieldCreateNewWidgetState
    extends State<CompInspFieldCreateNewWidget> {
  late CompInspFieldCreateNewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompInspFieldCreateNewModel());

    _model.textFieldnameTextController ??= TextEditingController();
    _model.textFieldnameFocusNode ??= FocusNode();

    _model.switchValue = false;
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
    context.watch<FFAppState>();

    return Container(
      constraints: BoxConstraints(
        maxWidth: 500.0,
      ),
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(50.0, 10.0, 50.0, 10.0),
        child: SingleChildScrollView(
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
                          FormFieldController<String>(null),
                      options: widget.fieldTypeList!,
                      onChanged: (val) async {
                        safeSetState(() => _model.dropDownTypeValue = val);
                        safeSetState(() {});
                        FFAppState().appChoiceOptionsNew = [];
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        if (_model.dropDownTypeValue == 'single-choice') {
                          _model.outputInsertedOptions =
                              await InspectionFieldsTable().insert({
                            'field_name':
                                _model.textFieldnameTextController.text,
                            'field_type': _model.dropDownTypeValue,
                            'is_required': _model.switchValue,
                            'task_id': widget.taskID,
                            'is_published': true,
                            'company_name': FFAppState().appAuthUserCompanyName,
                          });
                          while (_model.compIterator !=
                              FFAppState().appChoiceOptionsNew.length) {
                            await ChoiceOptionsTable().insert({
                              'choice': FFAppState()
                                  .appChoiceOptionsNew
                                  .elementAtOrNull(_model.compIterator!),
                              'field_id': _model.outputInsertedOptions?.fieldId,
                              'company_name':
                                  FFAppState().appAuthUserCompanyName,
                            });
                            _model.compIterator = _model.compIterator! + 1;
                            safeSetState(() {});
                          }
                          FFAppState().appPageDataRefreshRequested = true;
                          FFAppState().appChoiceOptionsNew = [];
                          _model.updatePage(() {});
                          _model.compVisi = false;
                          safeSetState(() {});
                          safeSetState(() {
                            _model.dropDownTypeValueController?.reset();
                          });
                          safeSetState(() {
                            _model.textFieldnameTextController?.clear();
                          });
                          safeSetState(() {
                            _model.switchValue = false;
                          });
                        } else {
                          await InspectionFieldsTable().insert({
                            'field_name':
                                _model.textFieldnameTextController.text,
                            'field_type': _model.dropDownTypeValue,
                            'is_required': _model.switchValue,
                            'task_id': widget.taskID,
                            'is_published': true,
                            'company_name': FFAppState().appAuthUserCompanyName,
                          });
                          FFAppState().appPageDataRefreshRequested = true;
                          _model.updatePage(() {});
                          _model.compVisi = false;
                          safeSetState(() {});
                          safeSetState(() {
                            _model.dropDownTypeValueController?.reset();
                          });
                          safeSetState(() {
                            _model.textFieldnameTextController?.clear();
                          });
                          safeSetState(() {
                            _model.switchValue = false;
                          });
                        }

                        safeSetState(() {});
                      },
                      text: 'Save',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF033395),
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
              Expanded(
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  decoration: BoxDecoration(),
                  child: Visibility(
                    visible: _model.dropDownTypeValue == 'single-choice',
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text(
                              'Choice options',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0x505A5C60),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 0.0, 10.0),
                                  child: Container(
                                    width: 200.0,
                                    child: TextFormField(
                                      controller:
                                          _model.textFieldOptionsTextController,
                                      focusNode:
                                          _model.textFieldOptionsFocusNode,
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
                                        hintText: 'Type your options',
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .textFieldOptionsTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().addToAppChoiceOptionsNew(
                                          _model.textFieldOptionsTextController
                                              .text);
                                      safeSetState(() {});
                                    },
                                    text: 'add',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF033395),
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
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final choiceOptions =
                                      FFAppState().appChoiceOptionsNew.toList();

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: choiceOptions.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 3.0),
                                    itemBuilder: (context, choiceOptionsIndex) {
                                      final choiceOptionsItem =
                                          choiceOptions[choiceOptionsIndex];
                                      return Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x14105DFB),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                choiceOptionsItem,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Geist Font Family',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .removeAtIndexFromAppChoiceOptionsNew(
                                                          choiceOptionsIndex);
                                                  safeSetState(() {});
                                                },
                                                child: Icon(
                                                  Icons.delete_forever,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
