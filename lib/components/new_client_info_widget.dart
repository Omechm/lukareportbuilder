import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'new_client_info_model.dart';
export 'new_client_info_model.dart';

class NewClientInfoWidget extends StatefulWidget {
  const NewClientInfoWidget({
    super.key,
    this.compClient,
    bool? compEditingCheck,
    this.userCompany,
  }) : this.compEditingCheck = compEditingCheck ?? false;

  final ClientsRow? compClient;
  final bool compEditingCheck;
  final String? userCompany;

  @override
  State<NewClientInfoWidget> createState() => _NewClientInfoWidgetState();
}

class _NewClientInfoWidgetState extends State<NewClientInfoWidget> {
  late NewClientInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewClientInfoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!widget.compEditingCheck) {
        safeSetState(() {
          _model.textController1?.clear();
          _model.textController2?.clear();
          _model.textController3?.clear();
          _model.textController4?.clear();
          _model.textController5?.clear();
        });
      }
    });

    _model.textController1 ??= TextEditingController(
        text: widget.compEditingCheck == true
            ? widget.compClient?.clientName
            : '');
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(
        text: widget.compEditingCheck == true
            ? widget.compClient?.contactEmail
            : '');
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController(
        text: widget.compEditingCheck == true
            ? widget.compClient?.address
            : '');
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController(
        text: widget.compEditingCheck == true ? widget.compClient?.city : '');
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController(
        text:
            widget.compEditingCheck == true ? widget.compClient?.state : '');
    _model.textFieldFocusNode5 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(0.5, 0.0),
              child: Container(
                width: 60.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
            ),
            Text(
              'Add/Edit Client info',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Geist Font Family',
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
            Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextFormField(
                    controller: _model.textController1,
                    focusNode: _model.textFieldFocusNode1,
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Client Name',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: 'Geist Font Family',
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
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
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Geist Font Family',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    minLines: 1,
                    validator:
                        _model.textController1Validator.asValidator(context),
                  ),
                  TextFormField(
                    controller: _model.textController2,
                    focusNode: _model.textFieldFocusNode2,
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: 'Geist Font Family',
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
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
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Geist Font Family',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    minLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    validator:
                        _model.textController2Validator.asValidator(context),
                  ),
                  TextFormField(
                    controller: _model.textController3,
                    focusNode: _model.textFieldFocusNode3,
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: 'Geist Font Family',
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
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
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Geist Font Family',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    minLines: 1,
                    validator:
                        _model.textController3Validator.asValidator(context),
                  ),
                  TextFormField(
                    controller: _model.textController4,
                    focusNode: _model.textFieldFocusNode4,
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'City',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: 'Geist Font Family',
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
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
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Geist Font Family',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    minLines: 1,
                    validator:
                        _model.textController4Validator.asValidator(context),
                  ),
                  TextFormField(
                    controller: _model.textController5,
                    focusNode: _model.textFieldFocusNode5,
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'State',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: 'Geist Font Family',
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
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
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Geist Font Family',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    minLines: 1,
                    validator:
                        _model.textController5Validator.asValidator(context),
                  ),
                ].divide(SizedBox(height: 5.0)).around(SizedBox(height: 5.0)),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.formValidation = true;
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      _model.formValidation = false;
                    }
                    if (_model.formValidation == true) {
                      if (widget.compEditingCheck == true) {
                        _model.outputUpdateClient = await ClientsTable().update(
                          data: {
                            'client_name': _model.textController1.text,
                            'contact_email': _model.textController2.text,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'client_id',
                            valueOrDefault<String>(
                              widget.compClient?.clientId,
                              'null',
                            ),
                          ),
                          returnRows: true,
                        );
                        _model.outputUpdateClientAddress =
                            await ClientsTable().update(
                          data: {
                            'address': _model.textController3.text,
                            'city': _model.textController4.text,
                            'state': _model.textController5.text,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'client_id',
                            valueOrDefault<String>(
                              widget.compClient?.clientId,
                              'null',
                            ),
                          ),
                          returnRows: true,
                        );
                        Navigator.pop(context);
                      } else {
                        _model.outputCreateNewClient =
                            await ClientsTable().insert({
                          'client_name': _model.textController1.text,
                          'contact_email': _model.textController2.text,
                        });
                        _model.outputCreateNewClientAddress =
                            await ClientsTable().insert({
                          'address': _model.textController3.text,
                          'city': _model.textController4.text,
                          'state': _model.textController5.text,
                          'client_name': _model.textController1.text,
                          'contact_email': _model.textController2.text,
                          'company_name': '',
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Successfully added',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Missing fields',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: Color(0xFF0B0A0A),
                        ),
                      );
                    }

                    safeSetState(() {});
                  },
                  text: 'Add Client',
                  options: FFButtonOptions(
                    width: 300.0,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF033395),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Geist Font Family',
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 30.0)),
        ),
      ),
    );
  }
}
