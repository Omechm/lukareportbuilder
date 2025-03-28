import '/backend/supabase/supabase.dart';
import '/components/nofieldfound_widget.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/walkthroughs/design_report_template.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'reportbuilder_model.dart';
export 'reportbuilder_model.dart';

class ReportbuilderWidget extends StatefulWidget {
  const ReportbuilderWidget({
    super.key,
    int? pageNumber,
  }) : this.pageNumber = pageNumber ?? 2;

  final int pageNumber;

  static String routeName = 'reportbuilder';
  static String routePath = '/reportbuilder';

  @override
  State<ReportbuilderWidget> createState() => _ReportbuilderWidgetState();
}

class _ReportbuilderWidgetState extends State<ReportbuilderWidget> {
  late ReportbuilderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportbuilderModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() => _model.designReportTemplateController =
          createPageWalkthrough(context));
      _model.designReportTemplateController?.show(context: context);
      if (_model.pageRebuild != 'triggered') {
        FFAppState().appIsTitleSet = false;
        FFAppState().appIsANewReport = false;
        safeSetState(() {});
      }
    });

    _model.textFieldTitleTextController ??= TextEditingController();
    _model.textFieldTitleFocusNode ??= FocusNode();

    _model.textFieldnameTextController ??= TextEditingController();
    _model.textFieldnameFocusNode ??= FocusNode();

    _model.textFieldOptionsTextController ??= TextEditingController();
    _model.textFieldOptionsFocusNode ??= FocusNode();

    _model.switchValue = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'reportbuilder',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Visibility(
              visible: responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.sidebarnavCopyModel,
                    updateCallback: () => safeSetState(() {}),
                    child: SidebarnavCopyWidget(
                      authUserFIrstName: valueOrDefault<String>(
                        FFAppState().appAuthUserFirstName,
                        'null',
                      ),
                      pageNumber: widget.pageNumber,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Container(
                              width: double.infinity,
                              height: 65.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Report Builder',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Geist Font Family',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            Text(
                                              'Dynamically build your report, defining report type and business case',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Geist Font Family',
                                                        fontSize: 8.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 50.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              if (FFAppState()
                                                      .appIsANewReport ==
                                                  false)
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    FFAppState()
                                                        .appIsANewReport = true;
                                                    safeSetState(() {});
                                                  },
                                                  text:
                                                      'Create new report Template',
                                                  options: FFButtonOptions(
                                                    height: 30.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFF033395),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Geist Font Family',
                                                          color: Colors.white,
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ).addWalkthrough(
                                                  buttonM6yuaqyb,
                                                  _model
                                                      .designReportTemplateController,
                                                ),
                                              if ((FFAppState()
                                                          .appIsANewReport ==
                                                      true) &&
                                                  _model.isTemplatedSaved &&
                                                  (_model.publishTemplateButtonVisibility ==
                                                      true))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await InspectionFieldsTable()
                                                          .update(
                                                        data: {
                                                          'is_published': true,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'task_id',
                                                          _model.newTemplateId,
                                                        ),
                                                      );
                                                      await InspectionTasksTable()
                                                          .update(
                                                        data: {
                                                          'is_published': true,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'task_id',
                                                          _model.newTemplateId,
                                                        ),
                                                      );
                                                      FFAppState()
                                                              .appIsANewReport =
                                                          false;
                                                      FFAppState()
                                                              .appIsTitleSet =
                                                          false;
                                                      safeSetState(() {});
                                                      _model.newTemplateId = '';
                                                      _model.templateTitle = '';
                                                      _model.pageRebuild = null;
                                                      _model.isTemplatedSaved =
                                                          false;
                                                      _model.publishTemplateButtonVisibility =
                                                          false;
                                                      safeSetState(() {});
                                                      safeSetState(() {
                                                        _model
                                                            .textFieldTitleTextController
                                                            ?.clear();
                                                        _model
                                                            .textFieldnameTextController
                                                            ?.clear();
                                                      });
                                                    },
                                                    text: 'Click to Publish',
                                                    options: FFButtonOptions(
                                                      height: 30.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFF268F4D),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 8.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ).addWalkthrough(
                                                    buttonVsecnsfl,
                                                    _model
                                                        .designReportTemplateController,
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    context.safePop();
                                                  },
                                                  text: 'Back',
                                                  icon: Icon(
                                                    Icons
                                                        .arrow_back_ios_new_rounded,
                                                    size: 15.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 30.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFFFB6410),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Geist Font Family',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (FFAppState().appIsANewReport == true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0x0EFFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Visibility(
                                        visible:
                                            FFAppState().appIsTitleSet == true,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  _model.templateTitle,
                                                  'Template not set',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              'Geist Font Family',
                                                          fontSize: 25.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                            if (_model.newTemplateId != null &&
                                                _model.newTemplateId != '')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    FFAppState().appIsTitleSet =
                                                        false;
                                                    safeSetState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.edit_square,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            if (_model.newTemplateId != null &&
                                                _model.newTemplateId != '')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Edit Title',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Geist Font Family',
                                                        fontSize: 8.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  18.0, 0.0, 16.0, 16.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Visibility(
                                    visible:
                                        FFAppState().appIsANewReport == true,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          50.0, 0.0, 50.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (FFAppState()
                                                        .appIsTitleSet ==
                                                    false)
                                                  Container(
                                                    width: 541.0,
                                                    height: 191.0,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(6.0),
                                                              child: Text(
                                                                'Report Title',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Geist Font Family',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 450.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textFieldTitleTextController,
                                                                  focusNode: _model
                                                                      .textFieldTitleFocusNode,
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsets.all(
                                                                            20.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Geist Font Family',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                  validator: _model
                                                                      .textFieldTitleTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 450.0,
                                                            ),
                                                          ],
                                                        ).addWalkthrough(
                                                          column2p1u2gpn,
                                                          _model
                                                              .designReportTemplateController,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                            icon: Icon(
                                                              Icons.add,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            showLoadingIndicator:
                                                                true,
                                                            onPressed:
                                                                () async {
                                                              _model.clientListOutput =
                                                                  await ClientsTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q,
                                                              );
                                                              if (_model.newTemplateId !=
                                                                      null &&
                                                                  _model.newTemplateId !=
                                                                      '') {
                                                                _model.updatedTemplateTitleOutput =
                                                                    await InspectionTasksTable()
                                                                        .update(
                                                                  data: {
                                                                    'task_name':
                                                                        _model
                                                                            .textFieldTitleTextController
                                                                            .text,
                                                                  },
                                                                  matchingRows:
                                                                      (rows) =>
                                                                          rows.eqOrNull(
                                                                    'task_id',
                                                                    _model
                                                                        .newTemplateId,
                                                                  ),
                                                                  returnRows:
                                                                      true,
                                                                );
                                                                _model.templateTitle = _model
                                                                    .updatedTemplateTitleOutput
                                                                    ?.firstOrNull
                                                                    ?.taskName;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.taskTitleNewInsertOutput =
                                                                    await InspectionTasksTable()
                                                                        .insert({
                                                                  'task_name':
                                                                      _model
                                                                          .textFieldTitleTextController
                                                                          .text,
                                                                });
                                                                _model.newTemplateId =
                                                                    _model
                                                                        .taskTitleNewInsertOutput
                                                                        ?.taskId;
                                                                _model.templateTitle = _model
                                                                    .taskTitleNewInsertOutput
                                                                    ?.taskName;
                                                                safeSetState(
                                                                    () {});
                                                              }

                                                              FFAppState()
                                                                      .appIsTitleSet =
                                                                  true;
                                                              safeSetState(
                                                                  () {});

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ).addWalkthrough(
                                                            iconButtonX5sjgwxk,
                                                            _model
                                                                .designReportTemplateController,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .appIsTitleSet ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Define your fields below',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .appIsTitleSet ==
                                                    true)
                                                  Container(
                                                    width: 450.0,
                                                    height: 90.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  6.0),
                                                          child: Text(
                                                            'Field Name',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Geist Font Family',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 450.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textFieldnameTextController,
                                                              focusNode: _model
                                                                  .textFieldnameFocusNode,
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Geist Font Family',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Geist Font Family',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                                enabledBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            20.0),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                              validator: _model
                                                                  .textFieldnameTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ).addWalkthrough(
                                                      columnLu5xoo3c,
                                                      _model
                                                          .designReportTemplateController,
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .appIsTitleSet ==
                                                    true)
                                                  Container(
                                                    width: 450.0,
                                                    height: 90.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  6.0),
                                                          child: Text(
                                                            'Field Type',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Geist Font Family',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 450.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: FutureBuilder<
                                                              List<
                                                                  FieldTypesRow>>(
                                                            future:
                                                                FieldTypesTable()
                                                                    .queryRows(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                'is_active',
                                                                true,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 10.0,
                                                                    height:
                                                                        10.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        Color(
                                                                            0xFF7C8289),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<FieldTypesRow>
                                                                  dropDownTypeFieldTypesRowList =
                                                                  snapshot
                                                                      .data!;

                                                              return FlutterFlowDropDown<
                                                                  String>(
                                                                controller: _model
                                                                        .dropDownTypeValueController ??=
                                                                    FormFieldController<
                                                                            String>(
                                                                        null),
                                                                options: dropDownTypeFieldTypesRowList
                                                                    .map((e) =>
                                                                        e.fieldType)
                                                                    .withoutNulls
                                                                    .toList(),
                                                                onChanged: (val) =>
                                                                    safeSetState(() =>
                                                                        _model.dropDownTypeValue =
                                                                            val),
                                                                width: 300.0,
                                                                height: 56.0,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Geist Font Family',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                                hintText:
                                                                    'Please select...',
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                borderWidth:
                                                                    2.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isOverButton:
                                                                    true,
                                                                isSearchable:
                                                                    false,
                                                                isMultiSelect:
                                                                    false,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ).addWalkthrough(
                                                      columnX23r94c5,
                                                      _model
                                                          .designReportTemplateController,
                                                    ),
                                                  ),
                                                if ((FFAppState()
                                                            .appIsTitleSet ==
                                                        true) &&
                                                    (_model.dropDownTypeValue ==
                                                        'single-choice'))
                                                  Container(
                                                    width: 450.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  6.0),
                                                          child: Text(
                                                            'Choice options',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Geist Font Family',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 450.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x505A5C60),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                                child:
                                                                    Container(
                                                                  width: 200.0,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textFieldOptionsTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldOptionsFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                      hintText:
                                                                          'Type your options',
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                    cursorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    validator: _model
                                                                        .textFieldOptionsTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    FFAppState()
                                                                        .addToAppChoiceOptionsNew(_model
                                                                            .textFieldOptionsTextController
                                                                            .text);
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  text: 'add',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: Color(
                                                                        0xFF033395),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          color:
                                                                              Colors.white,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final choiceOptions =
                                                                  FFAppState()
                                                                      .appChoiceOptionsNew
                                                                      .toList();

                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    choiceOptions
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            3.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        choiceOptionsIndex) {
                                                                  final choiceOptionsItem =
                                                                      choiceOptions[
                                                                          choiceOptionsIndex];
                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFD4CDCD),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          5.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            choiceOptionsItem,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Geist Font Family',
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              FFAppState().removeAtIndexFromAppChoiceOptionsNew(choiceOptionsIndex);
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.delete_forever,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
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
                                                      ],
                                                    ).addWalkthrough(
                                                      column14x3wzgz,
                                                      _model
                                                          .designReportTemplateController,
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .appIsTitleSet ==
                                                    true)
                                                  Container(
                                                    width: 450.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  6.0),
                                                          child: Text(
                                                            'Mark Field as mandatory *',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Geist Font Family',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                        Switch.adaptive(
                                                          value: _model
                                                              .switchValue!,
                                                          onChanged:
                                                              (newValue) async {
                                                            safeSetState(() =>
                                                                _model.switchValue =
                                                                    newValue);
                                                          },
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          activeTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent1,
                                                          inactiveTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          inactiveThumbColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                        ),
                                                      ],
                                                    ).addWalkthrough(
                                                      column8u3n7yy6,
                                                      _model
                                                          .designReportTemplateController,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if ((_model.textFieldnameTextController
                                                                    .text !=
                                                                '') &&
                                                        ((_model.dropDownTypeValue !=
                                                                    null &&
                                                                _model.dropDownTypeValue !=
                                                                    '') &&
                                                            (_model.switchValue !=
                                                                null)))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    200.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            _model.checkIfFieldNameExistQueryOutput =
                                                                await InspectionFieldsTable()
                                                                    .queryRows(
                                                              queryFn: (q) => q
                                                                  .eqOrNull(
                                                                    'field_name',
                                                                    _model
                                                                        .textFieldnameTextController
                                                                        .text,
                                                                  )
                                                                  .eqOrNull(
                                                                    'task_id',
                                                                    _model
                                                                        .newTemplateId,
                                                                  ),
                                                            );
                                                            if ((_model.textFieldnameTextController
                                                                            .text !=
                                                                        '') &&
                                                                ((_model.dropDownTypeValue !=
                                                                            null &&
                                                                        _model.dropDownTypeValue !=
                                                                            '') &&
                                                                    (_model.switchValue !=
                                                                        null))) {
                                                              _model.rowsReturned =
                                                                  _model
                                                                      .checkIfFieldNameExistQueryOutput
                                                                      ?.length;
                                                              _model.fieldOptionsIterator =
                                                                  0;
                                                              safeSetState(
                                                                  () {});
                                                              FFAppState()
                                                                  .appChoiceFieldOptions = [];
                                                              safeSetState(
                                                                  () {});
                                                              if (_model
                                                                      .rowsReturned! >
                                                                  0) {
                                                                if (FFAppState()
                                                                        .appChoiceFieldOptions
                                                                        .length >
                                                                    0) {
                                                                  _model.updatedInspectionFieldWithSinglChoice =
                                                                      await InspectionFieldsTable()
                                                                          .update(
                                                                    data: {
                                                                      'field_name': _model
                                                                          .textFieldnameTextController
                                                                          .text,
                                                                      'field_type':
                                                                          _model
                                                                              .dropDownTypeValue,
                                                                      'is_required':
                                                                          _model
                                                                              .switchValue,
                                                                    },
                                                                    matchingRows:
                                                                        (rows) => rows
                                                                            .eqOrNull(
                                                                              'task_id',
                                                                              _model.newTemplateId,
                                                                            )
                                                                            .eqOrNull(
                                                                              'field_name',
                                                                              _model.textFieldnameTextController.text,
                                                                            ),
                                                                    returnRows:
                                                                        true,
                                                                  );
                                                                  _model.fieldOptionsOutput =
                                                                      await ChoiceOptionsTable()
                                                                          .queryRows(
                                                                    queryFn: (q) =>
                                                                        q.eqOrNull(
                                                                      'field_id',
                                                                      valueOrDefault<
                                                                          String>(
                                                                        _model
                                                                            .updatedInspectionFieldWithSinglChoice
                                                                            ?.firstOrNull
                                                                            ?.fieldId,
                                                                        'null',
                                                                      ),
                                                                    ),
                                                                  );
                                                                  while (_model
                                                                          .fieldOptionsIterator <
                                                                      _model
                                                                          .fieldOptionsOutput!
                                                                          .length) {
                                                                    await ChoiceOptionsTable()
                                                                        .update(
                                                                      data: {
                                                                        'choice':
                                                                            valueOrDefault<String>(
                                                                          FFAppState()
                                                                              .appChoiceFieldOptions
                                                                              .elementAtOrNull(_model.fieldOptionsIterator)
                                                                              ?.value,
                                                                          'null',
                                                                        ),
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'field_id',
                                                                        valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .checkIfFieldNameExistQueryOutput
                                                                              ?.firstOrNull
                                                                              ?.fieldId,
                                                                          'nill',
                                                                        ),
                                                                      ),
                                                                    );
                                                                    _model.fieldOptionsIterator =
                                                                        _model.fieldOptionsIterator +
                                                                            1;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                  FFAppState()
                                                                      .appChoiceOptionsNew = [];
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model.updatedInspectionField =
                                                                      await InspectionFieldsTable()
                                                                          .update(
                                                                    data: {
                                                                      'field_name': _model
                                                                          .textFieldnameTextController
                                                                          .text,
                                                                      'field_type':
                                                                          _model
                                                                              .dropDownTypeValue,
                                                                      'is_required':
                                                                          _model
                                                                              .switchValue,
                                                                    },
                                                                    matchingRows:
                                                                        (rows) => rows
                                                                            .eqOrNull(
                                                                              'task_id',
                                                                              _model.newTemplateId,
                                                                            )
                                                                            .eqOrNull(
                                                                              'field_name',
                                                                              _model.textFieldnameTextController.text,
                                                                            ),
                                                                    returnRows:
                                                                        true,
                                                                  );
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        '-${_model.updatedInspectionField?.firstOrNull?.fieldName} - has been been updated successfully',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                }
                                                              } else {
                                                                _model.fieldOptionsIterator =
                                                                    0;
                                                                _model.inspectionFieldInsertOutput =
                                                                    await InspectionFieldsTable()
                                                                        .insert({
                                                                  'task_id': _model
                                                                      .newTemplateId,
                                                                  'field_name':
                                                                      _model
                                                                          .textFieldnameTextController
                                                                          .text,
                                                                  'field_type':
                                                                      _model
                                                                          .dropDownTypeValue,
                                                                  'is_required':
                                                                      _model
                                                                          .switchValue,
                                                                });
                                                                while (_model
                                                                        .fieldOptionsIterator <
                                                                    FFAppState()
                                                                        .appChoiceOptionsNew
                                                                        .length) {
                                                                  _model.newOP =
                                                                      await ChoiceOptionsTable()
                                                                          .insert({
                                                                    'choice':
                                                                        valueOrDefault<
                                                                            String>(
                                                                      FFAppState()
                                                                          .appChoiceOptionsNew
                                                                          .elementAtOrNull(
                                                                              _model.fieldOptionsIterator),
                                                                      'null',
                                                                    ),
                                                                    'field_id': _model
                                                                        .inspectionFieldInsertOutput
                                                                        ?.fieldId,
                                                                  });
                                                                  _model.fieldOptionsIterator =
                                                                      _model.fieldOptionsIterator +
                                                                          1;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      '${_model.inspectionFieldInsertOutput?.fieldName} has been been added successfully',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              }

                                                              safeSetState(() {
                                                                _model
                                                                    .textFieldnameTextController
                                                                    ?.clear();
                                                              });
                                                              safeSetState(() {
                                                                _model.switchValue =
                                                                    false;
                                                              });
                                                              safeSetState(() {
                                                                _model
                                                                    .dropDownTypeValueController
                                                                    ?.reset();
                                                              });
                                                              _model.saveTemplateButtonVisibility =
                                                                  true;
                                                              _model.isTemplatedSaved =
                                                                  false;
                                                              _model.publishTemplateButtonVisibility =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Missing mandatory fields',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xFFC91010),
                                                                ),
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                          text: 'Add field',
                                                          icon: Icon(
                                                            Icons
                                                                .navigate_next_outlined,
                                                            size: 15.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0xFF033395),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Geist Font Family',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ).addWalkthrough(
                                                          buttonWafcq2i4,
                                                          _model
                                                              .designReportTemplateController,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (FFAppState().appIsTitleSet ==
                                              true)
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        50.0, 16.0, 0.0, 0.0),
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                    minWidth: 1000.0,
                                                    minHeight: 100.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Report fields for ${_model.templateTitle} template',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if (FFAppState()
                                                              .appIsTitleSet ==
                                                          true)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      22.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FutureBuilder<
                                                              List<
                                                                  InspectionFieldsRow>>(
                                                            future:
                                                                InspectionFieldsTable()
                                                                    .queryRows(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                'task_id',
                                                                _model
                                                                    .newTemplateId,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 10.0,
                                                                    height:
                                                                        10.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        Color(
                                                                            0xFF7C8289),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<InspectionFieldsRow>
                                                                  listViewInspectionFieldsRowList =
                                                                  snapshot
                                                                      .data!;

                                                              if (listViewInspectionFieldsRowList
                                                                  .isEmpty) {
                                                                return NofieldfoundWidget();
                                                              }

                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listViewInspectionFieldsRowList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        listViewIndex) {
                                                                  final listViewInspectionFieldsRow =
                                                                      listViewInspectionFieldsRowList[
                                                                          listViewIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if (listViewInspectionFieldsRow.isRequired ?? true)
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 6.0),
                                                                                      child: Text(
                                                                                        '* ',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Geist Font Family',
                                                                                              color: Color(0xFFF63236),
                                                                                              fontSize: 10.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 6.0),
                                                                                    child: Text(
                                                                                      '${listViewInspectionFieldsRow.fieldName} (${listViewInspectionFieldsRow.fieldType})',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Geist Font Family',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 10.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                    child: Text(
                                                                                      (listViewIndex + 1).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Geist Font Family',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                    child: Container(
                                                                                      width: 321.0,
                                                                                      height: 36.0,
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
                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 6.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await InspectionFieldsTable().delete(
                                                                                          matchingRows: (rows) => rows
                                                                                              .eqOrNull(
                                                                                                'task_id',
                                                                                                listViewInspectionFieldsRow.fieldId,
                                                                                              )
                                                                                              .eqOrNull(
                                                                                                'field_id',
                                                                                                listViewInspectionFieldsRow.fieldId,
                                                                                              ),
                                                                                        );
                                                                                        _model.pageRebuild = 'triggered';
                                                                                        safeSetState(() {});
                                                                                        _model.pageRebuild = '';
                                                                                        safeSetState(() {});
                                                                                        _model.newTemplateFieldOutputs = await InspectionFieldsTable().queryRows(
                                                                                          queryFn: (q) => q.eqOrNull(
                                                                                            'field_id',
                                                                                            _model.newTemplateId,
                                                                                          ),
                                                                                        );
                                                                                        if (_model.newTemplateFieldOutputs?.length == 0) {
                                                                                          _model.saveTemplateButtonVisibility = false;
                                                                                          safeSetState(() {});
                                                                                        }

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.delete_sweep_outlined,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          if (_model
                                                              .saveTemplateButtonVisibility)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          50.0,
                                                                          0.0,
                                                                          20.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  _model.isTemplatedSaved =
                                                                      true;
                                                                  _model.saveTemplateButtonVisibility =
                                                                      false;
                                                                  _model.publishTemplateButtonVisibility =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                text:
                                                                    'Save Template',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFF033395),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Geist Font Family',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ).addWalkthrough(
                                                                buttonE8eulk0w,
                                                                _model
                                                                    .designReportTemplateController,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.designReportTemplateController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
