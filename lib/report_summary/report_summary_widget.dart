import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/loading_comp_widget.dart';
import '/components/non_compliance_more_info_component_widget.dart';
import '/components/picture_details_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/walkthroughs/date_selection.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'report_summary_model.dart';
export 'report_summary_model.dart';

class ReportSummaryWidget extends StatefulWidget {
  const ReportSummaryWidget({super.key});

  static String routeName = 'ReportSummary';
  static String routePath = '/reportSummary';

  @override
  State<ReportSummaryWidget> createState() => _ReportSummaryWidgetState();
}

class _ReportSummaryWidgetState extends State<ReportSummaryWidget>
    with TickerProviderStateMixin {
  late ReportSummaryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportSummaryModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().appIsLoadingData = true;
      FFAppState().appPageFullScreenToggle = true;
      FFAppState().appDateFrom = functions.currentDateTime();
      FFAppState().appDateTo = functions.currentDateTime();
      safeSetState(() {});
      _model.pageExecutedReportFiltered = [];
      _model.pageCompliantLocationId = [];
      _model.pageExecutedReportUnfiltered = [];
      safeSetState(() {});
      _model.outputFieldTaskVacancy = await InspectionTasksTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
          'company_name',
          FFAppState().appAuthUserCompanyName,
        )
            .inFilterOrNull(
          'task_name',
          ['Vacancy'],
        ),
      );
      _model.outputExecutedReport = await ExecutedTaskNameTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_name',
          FFAppState().appAuthUserCompanyName,
        ),
      );
      _model.pageExecutedReportUnfiltered =
          _model.outputExecutedReport!.toList().cast<ExecutedTaskNameRow>();
      _model.pageCompliantLocationId = _model.outputExecutedReport!
          .map((e) => e.clientId)
          .withoutNulls
          .toList()
          .toList()
          .cast<String>();
      safeSetState(() {});
      _model.outputFieldVacancy = await InspectionFieldsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_name',
          FFAppState().appAuthUserCompanyName,
        ),
      );
      _model.outputFieldValue = await FieldValuesTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_name',
          FFAppState().appAuthUserCompanyName,
        ),
      );
      _model.outputAuthUserInfo = await UserTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      _model.outputUsers = await UserTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_name',
          FFAppState().appAuthUserCompanyName,
        ),
      );
      _model.pageExecutedReportFiltered = _model.outputExecutedReport!
          .where((e) =>
              (e.executedDate! >= FFAppState().appDateFrom!) &&
              (e.executedDate! <= FFAppState().appDateTo!))
          .toList()
          .toList()
          .cast<ExecutedTaskNameRow>();
      safeSetState(() {});
      FFAppState().appIsLoadingData = false;
      safeSetState(() {});
      _model.iterator = 0;
      _model.pageNonCompAgr = [];
      safeSetState(() {});
      _model.outputNonCompAgr =
          await NonCompliantTaskExecutionGroupTable().queryRows(
        queryFn: (q) => q.order('count'),
      );
      while (_model.outputNonCompAgr!.length > _model.iterator!) {
        _model.addToPageNonCompAgr(NonCompliantLocationCountStruct(
          location: _model.outputNonCompAgr
              ?.sortedList(keyOf: (e) => e.count, desc: true)
              .elementAtOrNull(_model.iterator!)
              ?.plannedTaskClientName,
          count: _model.outputNonCompAgr
              ?.sortedList(keyOf: (e) => e.count, desc: true)
              .elementAtOrNull(_model.iterator!)
              ?.count,
        ));
        safeSetState(() {});
        _model.iterator = _model.iterator! + 1;
        safeSetState(() {});
      }
      safeSetState(() => _model.requestCompleter1 = null);
      await _model.waitForRequestCompleted1();
    });

    _model.summaryController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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
        title: 'ReportSummary',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.15,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF09245E),
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
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      if (_model.summaryCurrentIndex == 1)
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0x3F5A5C60),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      17.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .filter_list,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                size: 15.0,
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Filter Task Summary by location',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      safeSetState(() => _model
                                                                          .checkboxGroupValueController
                                                                          ?.value = []);
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .clear,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 2.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10.0),
                                                                  child: FutureBuilder<
                                                                      List<
                                                                          ExecutedTaskWithFieldsJsonRow>>(
                                                                    future: ExecutedTaskWithFieldsJsonTable()
                                                                        .queryRows(
                                                                      queryFn: (q) => q
                                                                          .eqOrNull(
                                                                            'company_name',
                                                                            FFAppState().appAuthUserCompanyName,
                                                                          )
                                                                          .gteOrNull(
                                                                            'executed_date',
                                                                            supaSerialize<DateTime>(FFAppState().appDateFrom),
                                                                          )
                                                                          .lteOrNull(
                                                                            'executed_date',
                                                                            supaSerialize<DateTime>(FFAppState().appDateTo),
                                                                          )
                                                                          .order('created_at', ascending: true),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                10.0,
                                                                            height:
                                                                                10.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                Color(0xFF7C8289),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<ExecutedTaskWithFieldsJsonRow>
                                                                          checkboxGroupExecutedTaskWithFieldsJsonRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      return FlutterFlowCheckboxGroup(
                                                                        options: checkboxGroupExecutedTaskWithFieldsJsonRowList
                                                                            .unique((e) =>
                                                                                e.clientName!)
                                                                            .sortedList(keyOf: (e) => e.clientName!, desc: false)
                                                                            .map((e) => e.clientName)
                                                                            .withoutNulls
                                                                            .toList(),
                                                                        onChanged:
                                                                            (val) async {
                                                                          safeSetState(() =>
                                                                              _model.checkboxGroupValues = val);
                                                                          safeSetState(
                                                                              () {
                                                                            FFAppState().clearImagesQCache();
                                                                            _model.requestCompleted3 =
                                                                                false;
                                                                          });
                                                                          await _model
                                                                              .waitForRequestCompleted3();
                                                                        },
                                                                        controller:
                                                                            _model.checkboxGroupValueController ??=
                                                                                FormFieldController<List<String>>(
                                                                          [],
                                                                        ),
                                                                        activeColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        checkColor:
                                                                            FlutterFlowTheme.of(context).info,
                                                                        checkboxBorderColor:
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        labelPadding:
                                                                            EdgeInsets.all(5.0),
                                                                        checkboxBorderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                        initialized:
                                                                            _model.checkboxGroupValues !=
                                                                                null,
                                                                      );
                                                                    },
                                                                  ),
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
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: Color(0x1F5A5C60),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 300.0,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Date From',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Geist Font Family',
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  FFAppState().appDateFromSelectorVisi = !(FFAppState().appDateFromSelectorVisi ?? true);
                                                                                  FFAppState().appDateToSelectorVisi = false;
                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.calendar_today_outlined,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  dateTimeFormat("d/M/y", FFAppState().appDateFrom),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: 'Geist Font Family',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 10.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ).addWalkthrough(
                                                                        columnB0orrnel,
                                                                        _model
                                                                            .dateSelectionController,
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                _model.pageLoadingTabWidget = true;
                                                                                safeSetState(() {});
                                                                                FFAppState().appDateFrom = functions.subtractDay(FFAppState().appDateFrom);
                                                                                safeSetState(() {});
                                                                                safeSetState(() {
                                                                                  FFAppState().clearImagesQCache();
                                                                                  _model.requestCompleted3 = false;
                                                                                });
                                                                                safeSetState(() {
                                                                                  FFAppState().clearImagesPCache();
                                                                                  _model.requestCompleted2 = false;
                                                                                });
                                                                                safeSetState(() => _model.apiRequestCompleter = null);
                                                                                _model.pageLoadingTabWidget = false;
                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Icon(
                                                                                Icons.chevron_left_rounded,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
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
                                                                              _model.pageLoadingTabWidget = true;
                                                                              safeSetState(() {});
                                                                              FFAppState().appDateFrom = functions.addDay(FFAppState().appDateFrom);
                                                                              safeSetState(() {});
                                                                              safeSetState(() => _model.apiRequestCompleter = null);
                                                                              safeSetState(() {
                                                                                FFAppState().clearImagesQCache();
                                                                                _model.requestCompleted3 = false;
                                                                              });
                                                                              safeSetState(() {
                                                                                FFAppState().clearImagesPCache();
                                                                                _model.requestCompleted2 = false;
                                                                              });
                                                                              _model.pageLoadingTabWidget = false;
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.navigate_next_outlined,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ).addWalkthrough(
                                                                        rowDka0kd93,
                                                                        _model
                                                                            .dateSelectionController,
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 300.0,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Date To',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Geist Font Family',
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  FFAppState().appDateFromSelectorVisi = false;
                                                                                  FFAppState().appDateToSelectorVisi = !(FFAppState().appDateToSelectorVisi ?? true);
                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.calendar_today_outlined,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  dateTimeFormat("d/M/y", FFAppState().appDateTo),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: 'Geist Font Family',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 10.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ).addWalkthrough(
                                                                        columnW8yg2y3l,
                                                                        _model
                                                                            .dateSelectionController,
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                _model.pageLoadingTabWidget = true;
                                                                                safeSetState(() {});
                                                                                FFAppState().appDateTo = functions.subtractDay(FFAppState().appDateTo);
                                                                                safeSetState(() {});
                                                                                safeSetState(() => _model.apiRequestCompleter = null);
                                                                                safeSetState(() {
                                                                                  FFAppState().clearImagesQCache();
                                                                                  _model.requestCompleted3 = false;
                                                                                });
                                                                                safeSetState(() {
                                                                                  FFAppState().clearImagesPCache();
                                                                                  _model.requestCompleted2 = false;
                                                                                });
                                                                                _model.pageLoadingTabWidget = false;
                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Icon(
                                                                                Icons.chevron_left_rounded,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
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
                                                                              _model.pageLoadingTabWidget = true;
                                                                              safeSetState(() {});
                                                                              FFAppState().appDateTo = functions.addDay(FFAppState().appDateTo);
                                                                              safeSetState(() {});
                                                                              safeSetState(() {
                                                                                FFAppState().clearImagesQCache();
                                                                                _model.requestCompleted3 = false;
                                                                              });
                                                                              safeSetState(() => _model.apiRequestCompleter = null);
                                                                              safeSetState(() {
                                                                                FFAppState().clearImagesPCache();
                                                                                _model.requestCompleted2 = false;
                                                                              });
                                                                              _model.pageLoadingTabWidget = false;
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.navigate_next_outlined,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ).addWalkthrough(
                                                                        rowEhqb3umo,
                                                                        _model
                                                                            .dateSelectionController,
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 10.0)),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 8.0,
                                                          buttonSize: 30.0,
                                                          fillColor:
                                                              Color(0xFF09245E),
                                                          icon: Icon(
                                                            Icons.search,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 12.0,
                                                          ),
                                                          onPressed: () async {
                                                            safeSetState(() {
                                                              FFAppState()
                                                                  .clearImagesPCache();
                                                              _model.requestCompleted2 =
                                                                  false;
                                                            });
                                                            await _model
                                                                .waitForRequestCompleted2();
                                                            _model.pageExecutedReportFiltered =
                                                                [];
                                                            _model.pageDataisLoading =
                                                                true;
                                                            safeSetState(() {});
                                                            _model.pageExecutedReportFiltered = _model
                                                                .outputExecutedReport!
                                                                .where((e) =>
                                                                    (e.executedDate! >=
                                                                        FFAppState()
                                                                            .appDateFrom!) &&
                                                                    (e.executedDate! <=
                                                                        FFAppState()
                                                                            .appDateTo!))
                                                                .toList()
                                                                .cast<
                                                                    ExecutedTaskNameRow>();
                                                            safeSetState(() {});
                                                            safeSetState(() =>
                                                                _model.requestCompleter1 =
                                                                    null);
                                                            await _model
                                                                .waitForRequestCompleted1();
                                                            safeSetState(() {
                                                              FFAppState()
                                                                  .clearImagesQCache();
                                                              _model.requestCompleted3 =
                                                                  false;
                                                            });
                                                            await _model
                                                                .waitForRequestCompleted3();
                                                            _model.pageDataisLoading =
                                                                false;
                                                            safeSetState(() {});
                                                          },
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
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 8.0,
                                                            buttonSize: 30.0,
                                                            fillColor: Color(
                                                                0xFFFB1014),
                                                            icon: Icon(
                                                              Icons.search_off,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 12.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              FFAppState()
                                                                      .appDateTo =
                                                                  null;
                                                              FFAppState()
                                                                      .appDateFrom =
                                                                  null;
                                                              safeSetState(
                                                                  () {});
                                                              _model.pageExecutedReportFiltered =
                                                                  [];
                                                              _model.refresh =
                                                                  0;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ).addWalkthrough(
                                                      wrapAzmb9lit,
                                                      _model
                                                          .dateSelectionController,
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 10.0)),
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
                              Expanded(
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFF09245E),
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
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment(0.0, 0),
                                                    child: TabBar(
                                                      isScrollable: true,
                                                      tabAlignment:
                                                          TabAlignment.center,
                                                      labelColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      unselectedLabelColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      unselectedLabelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      indicatorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      padding:
                                                          EdgeInsets.all(6.0),
                                                      tabs: [
                                                        Tab(
                                                          text:
                                                              'Compliance Report',
                                                        ),
                                                        Tab(
                                                          text: 'Task Summary',
                                                        ),
                                                      ],
                                                      controller: _model
                                                          .summaryController,
                                                      onTap: (i) async {
                                                        [
                                                          () async {},
                                                          () async {}
                                                        ][i]();
                                                      },
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: TabBarView(
                                                      controller: _model
                                                          .summaryController,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      children: [
                                                        KeepAliveWidgetWrapper(
                                                          builder: (context) =>
                                                              Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        12.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                          child: Container(
                                                                                            height: 100.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xFFEA132B),
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
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(5.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsets.all(5.0),
                                                                                                        child: Text(
                                                                                                          'No. of non compliance',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Geist Font Family',
                                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                                fontSize: 10.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  FutureBuilder<List<NonCompliantTaskExecutionRow>>(
                                                                                                    future: NonCompliantTaskExecutionTable().queryRows(
                                                                                                      queryFn: (q) => q
                                                                                                          .gteOrNull(
                                                                                                            'planned_execution_date',
                                                                                                            supaSerialize<DateTime>(FFAppState().appDateFrom),
                                                                                                          )
                                                                                                          .lteOrNull(
                                                                                                            'planned_execution_date',
                                                                                                            supaSerialize<DateTime>(FFAppState().appDateTo),
                                                                                                          )
                                                                                                          .eqOrNull(
                                                                                                            'company_name',
                                                                                                            FFAppState().appAuthUserCompanyName,
                                                                                                          )
                                                                                                          .order('id'),
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
                                                                                                      List<NonCompliantTaskExecutionRow> textNonCompliantTaskExecutionRowList = snapshot.data!;

                                                                                                      return Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          textNonCompliantTaskExecutionRowList.length.toString(),
                                                                                                          '0',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Geist Font Family',
                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              fontSize: 35.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w800,
                                                                                                            ),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            context.pushNamed(ImageViewerWidget.routeName);
                                                                                          },
                                                                                          child: Container(
                                                                                            height: 100.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xFF0C844F),
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
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(5.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsets.all(5.0),
                                                                                                        child: Text(
                                                                                                          'No. of executed task',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Geist Font Family',
                                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                                fontSize: 10.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  FutureBuilder<List<ExecutedTaskNameRow>>(
                                                                                                    future: ExecutedTaskNameTable().queryRows(
                                                                                                      queryFn: (q) => q
                                                                                                          .gteOrNull(
                                                                                                            'executed_date',
                                                                                                            supaSerialize<DateTime>(FFAppState().appDateFrom),
                                                                                                          )
                                                                                                          .lteOrNull(
                                                                                                            'executed_date',
                                                                                                            supaSerialize<DateTime>(FFAppState().appDateTo),
                                                                                                          )
                                                                                                          .eqOrNull(
                                                                                                            'company_name',
                                                                                                            FFAppState().appAuthUserCompanyName,
                                                                                                          ),
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
                                                                                                      List<ExecutedTaskNameRow> textExecutedTaskNameRowList = snapshot.data!;

                                                                                                      return Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          textExecutedTaskNameRowList.length.toString(),
                                                                                                          '0',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Geist Font Family',
                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              fontSize: 35.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w800,
                                                                                                            ),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 1.0)).around(SizedBox(width: 1.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  if (false)
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(10.0),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsets.all(10.0),
                                                                                                  child: Stack(
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsets.all(20.0),
                                                                                                        child: FutureBuilder<ApiCallResponse>(
                                                                                                          future: GetAggregatedNoCompliantTasksCall.call(
                                                                                                            startDate: dateTimeFormat("yyyy-MM-dd", FFAppState().appDateFrom),
                                                                                                            endDate: dateTimeFormat("yyyy-MM-dd", FFAppState().appDateTo),
                                                                                                            companyName: FFAppState().appAuthUserCompanyName,
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
                                                                                                            final syncFussChartColumnGetAggregatedNoCompliantTasksResponse = snapshot.data!;

                                                                                                            return Container(
                                                                                                              width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                                              height: (syncFussChartColumnGetAggregatedNoCompliantTasksResponse.jsonBody.toList().map<NonCompliantLocationCountStruct?>(NonCompliantLocationCountStruct.maybeFromMap).toList() as Iterable<NonCompliantLocationCountStruct?>).withoutNulls.length * 30,
                                                                                                              child: custom_widgets.SyncFussChartColumn(
                                                                                                                width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                                                height: (syncFussChartColumnGetAggregatedNoCompliantTasksResponse.jsonBody.toList().map<NonCompliantLocationCountStruct?>(NonCompliantLocationCountStruct.maybeFromMap).toList() as Iterable<NonCompliantLocationCountStruct?>).withoutNulls.length * 30,
                                                                                                                yMaxValue: (syncFussChartColumnGetAggregatedNoCompliantTasksResponse.jsonBody.toList().map<NonCompliantLocationCountStruct?>(NonCompliantLocationCountStruct.maybeFromMap).toList() as Iterable<NonCompliantLocationCountStruct?>).withoutNulls.sortedList(keyOf: (e) => e.count, desc: true).firstOrNull!.count.toDouble() + 1,
                                                                                                                yMinValue: 0.0,
                                                                                                                yInterval: 2.0,
                                                                                                                chartData: (syncFussChartColumnGetAggregatedNoCompliantTasksResponse.jsonBody.toList().map<NonCompliantLocationCountStruct?>(NonCompliantLocationCountStruct.maybeFromMap).toList() as Iterable<NonCompliantLocationCountStruct?>).withoutNulls,
                                                                                                              ),
                                                                                                            );
                                                                                                          },
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
                                                                                    ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(10.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                        ),
                                                                                        child: SingleChildScrollView(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsets.all(10.0),
                                                                                                  child: Stack(
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsets.all(20.0),
                                                                                                        child: FutureBuilder<ApiCallResponse>(
                                                                                                          future: GetExecutionPercentageCall.call(
                                                                                                            supabaseKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2Zm96bmhhZXBnZ2J5eWtrb2VhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI1NzIyMDUsImV4cCI6MjAzODE0ODIwNX0.gTkzwmWjjrr3s5GxRBIiahlyaj2iqp3_Y0NOUsZceaA',
                                                                                                            companyName: FFAppState().appAuthUserCompanyName,
                                                                                                            startDate: dateTimeFormat("yyyy-MM-dd", FFAppState().appDateFrom),
                                                                                                            endDate: dateTimeFormat("yyyy-MM-dd", FFAppState().appDateTo),
                                                                                                            jwt: currentJwtToken,
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
                                                                                                            final executionPercentageChartGetExecutionPercentageResponse = snapshot.data!;

                                                                                                            return Container(
                                                                                                              width: double.infinity,
                                                                                                              height: (executionPercentageChartGetExecutionPercentageResponse.jsonBody.toList().map<GetPercentageOfExecutionStruct?>(GetPercentageOfExecutionStruct.maybeFromMap).toList() as Iterable<GetPercentageOfExecutionStruct?>).withoutNulls.length * 30,
                                                                                                              child: custom_widgets.ExecutionPercentageChart(
                                                                                                                width: double.infinity,
                                                                                                                height: (executionPercentageChartGetExecutionPercentageResponse.jsonBody.toList().map<GetPercentageOfExecutionStruct?>(GetPercentageOfExecutionStruct.maybeFromMap).toList() as Iterable<GetPercentageOfExecutionStruct?>).withoutNulls.length * 30,
                                                                                                                yMaxValue: 100.0,
                                                                                                                yMinValue: 0.0,
                                                                                                                yInterval: 10.0,
                                                                                                                chartData: (executionPercentageChartGetExecutionPercentageResponse.jsonBody.toList().map<GetPercentageOfExecutionStruct?>(GetPercentageOfExecutionStruct.maybeFromMap).toList() as Iterable<GetPercentageOfExecutionStruct?>).withoutNulls.sortedList(keyOf: (e) => e.executionpercentage, desc: true),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                      ),
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(1.0, -1.0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 20.0, 0.0),
                                                                                                          child: InkWell(
                                                                                                            splashColor: Colors.transparent,
                                                                                                            focusColor: Colors.transparent,
                                                                                                            hoverColor: Colors.transparent,
                                                                                                            highlightColor: Colors.transparent,
                                                                                                            onTap: () async {
                                                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                SnackBar(
                                                                                                                  content: Text(
                                                                                                                    'Download started',
                                                                                                                    style: TextStyle(
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).info,
                                                                                                                ),
                                                                                                              );
                                                                                                              _model.outputExecutionPercentage = await GetExecutionPercentageCall.call(
                                                                                                                supabaseKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2Zm96bmhhZXBnZ2J5eWtrb2VhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI1NzIyMDUsImV4cCI6MjAzODE0ODIwNX0.gTkzwmWjjrr3s5GxRBIiahlyaj2iqp3_Y0NOUsZceaA',
                                                                                                                startDate: dateTimeFormat("yyyy-MM-dd", FFAppState().appDateFrom),
                                                                                                                endDate: dateTimeFormat("yyyy-MM-dd", FFAppState().appDateTo),
                                                                                                                companyName: FFAppState().appAuthUserCompanyName,
                                                                                                                jwt: currentJwtToken,
                                                                                                              );

                                                                                                              await actions.downloadCSVFromAPIData(
                                                                                                                ((_model.outputExecutionPercentage?.jsonBody ?? '').toList().map<GetPercentageOfExecutionStruct?>(GetPercentageOfExecutionStruct.maybeFromMap).toList() as Iterable<GetPercentageOfExecutionStruct?>).withoutNulls.toList(),
                                                                                                                'Execution Percentage -${dateTimeFormat("d/M/y", FFAppState().appDateFrom)}     -      ${dateTimeFormat("d/M/y", FFAppState().appDateTo)}',
                                                                                                                'Summary of execution by location between ${dateTimeFormat("d/M/y", FFAppState().appDateFrom)}  and ${dateTimeFormat("d/M/y", FFAppState().appDateTo)}',
                                                                                                              );
                                                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                SnackBar(
                                                                                                                  content: Text(
                                                                                                                    'File has downloaded',
                                                                                                                    style: TextStyle(
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                ),
                                                                                                              );

                                                                                                              safeSetState(() {});
                                                                                                            },
                                                                                                            child: Icon(
                                                                                                              Icons.download_rounded,
                                                                                                              color: Color(0xFC105DFB),
                                                                                                              size: 24.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              if (false)
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsets.all(20.0),
                                                                                                    child: FutureBuilder<ApiCallResponse>(
                                                                                                      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                                                                                                            ..complete(GetExecutionPercentageCall.call(
                                                                                                              supabaseKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2Zm96bmhhZXBnZ2J5eWtrb2VhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI1NzIyMDUsImV4cCI6MjAzODE0ODIwNX0.gTkzwmWjjrr3s5GxRBIiahlyaj2iqp3_Y0NOUsZceaA',
                                                                                                              companyName: FFAppState().appAuthUserCompanyName,
                                                                                                              startDate: dateTimeFormat("yyyy-MM-dd", FFAppState().appDateFrom),
                                                                                                              endDate: dateTimeFormat("yyyy-MM-dd", FFAppState().appDateTo),
                                                                                                              jwt: currentJwtToken,
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
                                                                                                        final executionPercentageTreemapGetExecutionPercentageResponse = snapshot.data!;

                                                                                                        return Container(
                                                                                                          width: double.infinity,
                                                                                                          height: 900.0,
                                                                                                          child: custom_widgets.ExecutionPercentageTreemap(
                                                                                                            width: double.infinity,
                                                                                                            height: 900.0,
                                                                                                            chartData: (executionPercentageTreemapGetExecutionPercentageResponse.jsonBody.toList().map<GetPercentageOfExecutionStruct?>(GetPercentageOfExecutionStruct.maybeFromMap).toList() as Iterable<GetPercentageOfExecutionStruct?>).withoutNulls,
                                                                                                          ),
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
                                                                          ].divide(SizedBox(height: 19.0)).around(SizedBox(height: 19.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          10.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            350.0,
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              MediaQuery.sizeOf(context).width * 0.3,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(5.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        'Non compliant location',
                                                                                        style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                              fontFamily: 'Geist Font Family',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Stack(
                                                                                  children: [
                                                                                    FutureBuilder<List<NonCompliantTaskExecutionRow>>(
                                                                                      future: (_model.requestCompleter1 ??= Completer<List<NonCompliantTaskExecutionRow>>()
                                                                                            ..complete(NonCompliantTaskExecutionTable().queryRows(
                                                                                              queryFn: (q) => q
                                                                                                  .gteOrNull(
                                                                                                    'planned_execution_date',
                                                                                                    supaSerialize<DateTime>(FFAppState().appDateFrom),
                                                                                                  )
                                                                                                  .lteOrNull(
                                                                                                    'planned_execution_date',
                                                                                                    supaSerialize<DateTime>(FFAppState().appDateTo),
                                                                                                  )
                                                                                                  .eqOrNull(
                                                                                                    'company_name',
                                                                                                    FFAppState().appAuthUserCompanyName,
                                                                                                  )
                                                                                                  .order('id'),
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
                                                                                        List<NonCompliantTaskExecutionRow> listViewNonCompliantTaskExecutionRowList = snapshot.data!;

                                                                                        return ListView.separated(
                                                                                          padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                                          scrollDirection: Axis.vertical,
                                                                                          itemCount: listViewNonCompliantTaskExecutionRowList.length,
                                                                                          separatorBuilder: (_, __) => SizedBox(height: 5.0),
                                                                                          itemBuilder: (context, listViewIndex) {
                                                                                            final listViewNonCompliantTaskExecutionRow = listViewNonCompliantTaskExecutionRowList[listViewIndex];
                                                                                            return Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 20.0, 0.0),
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                                ),
                                                                                                child: FutureBuilder<List<ClientsRow>>(
                                                                                                  future: ClientsTable().querySingleRow(
                                                                                                    queryFn: (q) => q.eqOrNull(
                                                                                                      'client_id',
                                                                                                      listViewNonCompliantTaskExecutionRow.plannedTaskClientId,
                                                                                                    ),
                                                                                                  ),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Image.asset(
                                                                                                        '',
                                                                                                      );
                                                                                                    }
                                                                                                    List<ClientsRow> rowClientsRowList = snapshot.data!;

                                                                                                    final rowClientsRow = rowClientsRowList.isNotEmpty ? rowClientsRowList.first : null;

                                                                                                    return Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: FutureBuilder<List<UserClientAssignmentsRow>>(
                                                                                                            future: UserClientAssignmentsTable().querySingleRow(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eqOrNull(
                                                                                                                    'client_id',
                                                                                                                    listViewNonCompliantTaskExecutionRow.plannedTaskClientId,
                                                                                                                  )
                                                                                                                  .neqOrNull(
                                                                                                                    'user_id',
                                                                                                                    listViewNonCompliantTaskExecutionRow.supervisorUserId,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            builder: (context, snapshot) {
                                                                                                              // Customize what your widget looks like when it's loading.
                                                                                                              if (!snapshot.hasData) {
                                                                                                                return Image.asset(
                                                                                                                  '',
                                                                                                                );
                                                                                                              }
                                                                                                              List<UserClientAssignmentsRow> listViewUserClientAssignmentsRowList = snapshot.data!;

                                                                                                              final listViewUserClientAssignmentsRow = listViewUserClientAssignmentsRowList.isNotEmpty ? listViewUserClientAssignmentsRowList.first : null;

                                                                                                              return ListView(
                                                                                                                padding: EdgeInsets.zero,
                                                                                                                shrinkWrap: true,
                                                                                                                scrollDirection: Axis.vertical,
                                                                                                                children: [
                                                                                                                  Builder(
                                                                                                                    builder: (context) => FutureBuilder<List<UserRow>>(
                                                                                                                      future: UserTable().querySingleRow(
                                                                                                                        queryFn: (q) => q.eqOrNull(
                                                                                                                          'user_id',
                                                                                                                          listViewNonCompliantTaskExecutionRow.supervisorUserId,
                                                                                                                        ),
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
                                                                                                                        List<UserRow> listTileUserRowList = snapshot.data!;

                                                                                                                        final listTileUserRow = listTileUserRowList.isNotEmpty ? listTileUserRowList.first : null;

                                                                                                                        return InkWell(
                                                                                                                          splashColor: Colors.transparent,
                                                                                                                          focusColor: Colors.transparent,
                                                                                                                          hoverColor: Colors.transparent,
                                                                                                                          highlightColor: Colors.transparent,
                                                                                                                          onTap: () async {
                                                                                                                            await showDialog(
                                                                                                                              context: context,
                                                                                                                              builder: (dialogContext) {
                                                                                                                                return Dialog(
                                                                                                                                  elevation: 0,
                                                                                                                                  insetPadding: EdgeInsets.zero,
                                                                                                                                  backgroundColor: Colors.transparent,
                                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                                  child: WebViewAware(
                                                                                                                                    child: GestureDetector(
                                                                                                                                      onTap: () {
                                                                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                      },
                                                                                                                                      child: NonComplianceMoreInfoComponentWidget(
                                                                                                                                        name: '${listTileUserRow?.firstName} ${listTileUserRow?.lastName}',
                                                                                                                                        phone: listTileUserRow!.phone!,
                                                                                                                                        taskname: listViewNonCompliantTaskExecutionRow.plannedTaskName!,
                                                                                                                                        location: rowClientsRow!.clientName,
                                                                                                                                        date: listViewNonCompliantTaskExecutionRow.createdAt!,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            );
                                                                                                                          },
                                                                                                                          child: Material(
                                                                                                                            color: Colors.transparent,
                                                                                                                            child: ListTile(
                                                                                                                              title: Text(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  '${rowClientsRow?.clientName}',
                                                                                                                                  'Null',
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                                                      fontFamily: 'Geist Font Family',
                                                                                                                                      fontSize: 12.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                              subtitle: Text(
                                                                                                                                'Supervisor in-charge : ${valueOrDefault<String>(
                                                                                                                                  listTileUserRow?.firstName,
                                                                                                                                  'null',
                                                                                                                                )} ${valueOrDefault<String>(
                                                                                                                                  listTileUserRow?.lastName,
                                                                                                                                  'null',
                                                                                                                                )} Phone: ${listTileUserRow?.phone} Date : ${dateTimeFormat("yMMMd", listViewNonCompliantTaskExecutionRow.plannedExecutionDate)}  CSO : ${valueOrDefault<String>(
                                                                                                                                  listViewUserClientAssignmentsRow?.firstName,
                                                                                                                                  'null',
                                                                                                                                )} ${valueOrDefault<String>(
                                                                                                                                  listViewUserClientAssignmentsRow?.lastName,
                                                                                                                                  'null',
                                                                                                                                )}',
                                                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                      fontFamily: 'Geist Font Family',
                                                                                                                                      fontSize: 8.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                              trailing: Icon(
                                                                                                                                Icons.arrow_forward_ios_rounded,
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                size: 24.0,
                                                                                                                              ),
                                                                                                                              tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              dense: false,
                                                                                                                              contentPadding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                                              shape: RoundedRectangleBorder(
                                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                    if (_model.pageDataisLoading)
                                                                                      Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: FaIcon(
                                                                                            FontAwesomeIcons.circleNotch,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 24.0,
                                                                                          ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
                                                                                        ),
                                                                                      ),
                                                                                  ],
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
                                                            ),
                                                          ),
                                                        ),
                                                        KeepAliveWidgetWrapper(
                                                          builder: (context) =>
                                                              Stack(
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          10.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              if (!(_model.checkboxGroupValues != null && (_model.checkboxGroupValues)!.isNotEmpty))
                                                                                FutureBuilder<List<ExecutedTaskWithFieldsJsonRow>>(
                                                                                  future: FFAppState()
                                                                                      .imagesP(
                                                                                    requestFn: () => ExecutedTaskWithFieldsJsonTable().queryRows(
                                                                                      queryFn: (q) => q
                                                                                          .eqOrNull(
                                                                                            'company_name',
                                                                                            FFAppState().appAuthUserCompanyName,
                                                                                          )
                                                                                          .gteOrNull(
                                                                                            'executed_date',
                                                                                            supaSerialize<DateTime>(FFAppState().appDateFrom),
                                                                                          )
                                                                                          .lteOrNull(
                                                                                            'executed_date',
                                                                                            supaSerialize<DateTime>(FFAppState().appDateTo),
                                                                                          )
                                                                                          .order('created_at', ascending: true),
                                                                                    ),
                                                                                  )
                                                                                      .then((result) {
                                                                                    _model.requestCompleted2 = true;
                                                                                    return result;
                                                                                  }),
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
                                                                                    List<ExecutedTaskWithFieldsJsonRow> listViewPExecutedTaskWithFieldsJsonRowList = snapshot.data!;

                                                                                    return ListView.separated(
                                                                                      padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: listViewPExecutedTaskWithFieldsJsonRowList.length,
                                                                                      separatorBuilder: (_, __) => SizedBox(height: 10.0),
                                                                                      itemBuilder: (context, listViewPIndex) {
                                                                                        final listViewPExecutedTaskWithFieldsJsonRow = listViewPExecutedTaskWithFieldsJsonRowList[listViewPIndex];
                                                                                        return Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Divider(
                                                                                                thickness: 5.0,
                                                                                                indent: 10.0,
                                                                                                endIndent: 10.0,
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                              ),
                                                                                              Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0x00CAC6C6),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                        child: Text(
                                                                                                          'Task : ${listViewPExecutedTaskWithFieldsJsonRow.taskName}     Location : ${listViewPExecutedTaskWithFieldsJsonRow.clientName}  ${listViewPExecutedTaskWithFieldsJsonRow.clientAddress}     Supervisor : ${listViewPExecutedTaskWithFieldsJsonRow.supervisor}',
                                                                                                          style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                                fontFamily: 'Geist Font Family',
                                                                                                                color: Color(0xFF09245E),
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                        child: Text(
                                                                                                          'Date : ${dateTimeFormat("d/M/y", listViewPExecutedTaskWithFieldsJsonRow.createdAt)}     ',
                                                                                                          style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                                fontFamily: 'Geist Font Family',
                                                                                                                color: Color(0xFF09245E),
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                child: Builder(
                                                                                                  builder: (context) {
                                                                                                    final valueJsonChildren = (listViewPExecutedTaskWithFieldsJsonRow.fieldsJson?.toList().map<DTjsonFieldsStruct?>(DTjsonFieldsStruct.maybeFromMap).toList() as Iterable<DTjsonFieldsStruct?>).withoutNulls.sortedList(keyOf: (e) => e.orderId, desc: false).toList() ?? [];

                                                                                                    return SingleChildScrollView(
                                                                                                      scrollDirection: Axis.horizontal,
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: List.generate(valueJsonChildren.length, (valueJsonChildrenIndex) {
                                                                                                          final valueJsonChildrenItem = valueJsonChildren[valueJsonChildrenIndex];
                                                                                                          return Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Container(
                                                                                                                    width: 144.7,
                                                                                                                    height: 150.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: Color(0xFF09245E),
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
                                                                                                                      borderRadius: BorderRadius.circular(5.0),
                                                                                                                    ),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Container(
                                                                                                                          height: 40.0,
                                                                                                                          decoration: BoxDecoration(),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                              children: [
                                                                                                                                Expanded(
                                                                                                                                  child: Text(
                                                                                                                                    valueJsonChildrenItem.fieldName,
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Geist Font Family',
                                                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                          fontSize: 10.0,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Expanded(
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsets.all(10.0),
                                                                                                                            child: Container(
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                              ),
                                                                                                                              child: Column(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                children: [
                                                                                                                                  if (valueJsonChildrenItem.fieldType == 'picture')
                                                                                                                                    Align(
                                                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                                      child: InkWell(
                                                                                                                                        splashColor: Colors.transparent,
                                                                                                                                        focusColor: Colors.transparent,
                                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                                        onTap: () async {
                                                                                                                                          _model.outputCapturedDate = await actions.extractImageDateMetadata(
                                                                                                                                            valueJsonChildrenItem.value,
                                                                                                                                          );
                                                                                                                                          _model.outputCapturedData = await actions.extractExifMetadata(
                                                                                                                                            valueJsonChildrenItem.value,
                                                                                                                                          );
                                                                                                                                          _model.outputUser = await UserTable().queryRows(
                                                                                                                                            queryFn: (q) => q.eqOrNull(
                                                                                                                                              'user_id',
                                                                                                                                              listViewPExecutedTaskWithFieldsJsonRow.userId,
                                                                                                                                            ),
                                                                                                                                          );
                                                                                                                                          await showModalBottomSheet(
                                                                                                                                            isScrollControlled: true,
                                                                                                                                            backgroundColor: Colors.transparent,
                                                                                                                                            enableDrag: false,
                                                                                                                                            useSafeArea: true,
                                                                                                                                            context: context,
                                                                                                                                            builder: (context) {
                                                                                                                                              return WebViewAware(
                                                                                                                                                child: GestureDetector(
                                                                                                                                                  onTap: () {
                                                                                                                                                    FocusScope.of(context).unfocus();
                                                                                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                                  },
                                                                                                                                                  child: Padding(
                                                                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                                    child: PictureDetailsWidget(
                                                                                                                                                      imgirl: valueJsonChildrenItem.value,
                                                                                                                                                      title: valueJsonChildrenItem.fieldName,
                                                                                                                                                      capturedBy: '${_model.outputUser?.firstOrNull?.firstName} ${_model.outputUser?.firstOrNull?.lastName}',
                                                                                                                                                      location: '${listViewPExecutedTaskWithFieldsJsonRow.clientName} ${listViewPExecutedTaskWithFieldsJsonRow.clientAddress}',
                                                                                                                                                      capturedDate: _model.outputCapturedDate,
                                                                                                                                                      capturedData: _model.outputCapturedData,
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              );
                                                                                                                                            },
                                                                                                                                          ).then((value) => safeSetState(() {}));

                                                                                                                                          safeSetState(() {});
                                                                                                                                        },
                                                                                                                                        child: ClipRRect(
                                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                                          child: Image.network(
                                                                                                                                            functions.convertStringToImagePath(valueJsonChildrenItem.value)!,
                                                                                                                                            width: 101.3,
                                                                                                                                            height: 88.1,
                                                                                                                                            fit: BoxFit.cover,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  if (valueJsonChildrenItem.fieldType != 'picture')
                                                                                                                                    Expanded(
                                                                                                                                      child: SingleChildScrollView(
                                                                                                                                        child: Column(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          children: [
                                                                                                                                            Align(
                                                                                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                                                              child: AutoSizeText(
                                                                                                                                                valueJsonChildrenItem.value,
                                                                                                                                                minFontSize: 3.0,
                                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                      fontFamily: 'Geist Font Family',
                                                                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                                      fontSize: 9.0,
                                                                                                                                                      letterSpacing: 0.0,
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
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          );
                                                                                                        }).divide(SizedBox(width: 10.0)).around(SizedBox(width: 10.0)),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              if (_model.checkboxGroupValues != null && (_model.checkboxGroupValues)!.isNotEmpty)
                                                                                FutureBuilder<List<ExecutedTaskWithFieldsJsonRow>>(
                                                                                  future: FFAppState()
                                                                                      .imagesQ(
                                                                                    requestFn: () => ExecutedTaskWithFieldsJsonTable().queryRows(
                                                                                      queryFn: (q) => q
                                                                                          .eqOrNull(
                                                                                            'company_name',
                                                                                            FFAppState().appAuthUserCompanyName,
                                                                                          )
                                                                                          .gteOrNull(
                                                                                            'executed_date',
                                                                                            supaSerialize<DateTime>(FFAppState().appDateFrom),
                                                                                          )
                                                                                          .lteOrNull(
                                                                                            'executed_date',
                                                                                            supaSerialize<DateTime>(FFAppState().appDateTo),
                                                                                          )
                                                                                          .inFilterOrNull(
                                                                                            'client_name',
                                                                                            _model.checkboxGroupValues,
                                                                                          )
                                                                                          .order('created_at', ascending: true),
                                                                                    ),
                                                                                  )
                                                                                      .then((result) {
                                                                                    _model.requestCompleted3 = true;
                                                                                    return result;
                                                                                  }),
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
                                                                                    List<ExecutedTaskWithFieldsJsonRow> listViewQExecutedTaskWithFieldsJsonRowList = snapshot.data!;

                                                                                    return ListView.separated(
                                                                                      padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: listViewQExecutedTaskWithFieldsJsonRowList.length,
                                                                                      separatorBuilder: (_, __) => SizedBox(height: 10.0),
                                                                                      itemBuilder: (context, listViewQIndex) {
                                                                                        final listViewQExecutedTaskWithFieldsJsonRow = listViewQExecutedTaskWithFieldsJsonRowList[listViewQIndex];
                                                                                        return Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Divider(
                                                                                                thickness: 5.0,
                                                                                                indent: 10.0,
                                                                                                endIndent: 10.0,
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                          child: Text(
                                                                                                            'Task : ${listViewQExecutedTaskWithFieldsJsonRow.taskName}     Location : ${listViewQExecutedTaskWithFieldsJsonRow.clientName}  ${listViewQExecutedTaskWithFieldsJsonRow.clientAddress}     Supervisor : ${listViewQExecutedTaskWithFieldsJsonRow.supervisor}',
                                                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                                  fontFamily: 'Geist Font Family',
                                                                                                                  color: Color(0xFF09245E),
                                                                                                                  fontSize: 12.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                          child: Text(
                                                                                                            'Date : ${dateTimeFormat("d/M/y", listViewQExecutedTaskWithFieldsJsonRow.createdAt)}     ',
                                                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                                  fontFamily: 'Geist Font Family',
                                                                                                                  color: Color(0xFF09245E),
                                                                                                                  fontSize: 12.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                child: Builder(
                                                                                                  builder: (context) {
                                                                                                    final valueJsonChildrenSearched = (listViewQExecutedTaskWithFieldsJsonRow.fieldsJson?.toList().map<DTjsonFieldsStruct?>(DTjsonFieldsStruct.maybeFromMap).toList() as Iterable<DTjsonFieldsStruct?>).withoutNulls.sortedList(keyOf: (e) => e.orderId, desc: false).toList() ?? [];

                                                                                                    return SingleChildScrollView(
                                                                                                      scrollDirection: Axis.horizontal,
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: List.generate(valueJsonChildrenSearched.length, (valueJsonChildrenSearchedIndex) {
                                                                                                          final valueJsonChildrenSearchedItem = valueJsonChildrenSearched[valueJsonChildrenSearchedIndex];
                                                                                                          return Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 144.7,
                                                                                                                  height: 150.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: Color(0xFF09245E),
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
                                                                                                                    borderRadius: BorderRadius.circular(5.0),
                                                                                                                  ),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        height: 40.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                            children: [
                                                                                                                              Expanded(
                                                                                                                                child: Text(
                                                                                                                                  valueJsonChildrenSearchedItem.fieldName,
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Geist Font Family',
                                                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                        fontSize: 10.0,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Expanded(
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsets.all(10.0),
                                                                                                                          child: Container(
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                                            ),
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                              children: [
                                                                                                                                if (valueJsonChildrenSearchedItem.fieldType == 'picture')
                                                                                                                                  Align(
                                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                                    child: InkWell(
                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                      onTap: () async {
                                                                                                                                        _model.outputCapturedDateSearched = await actions.extractImageDateMetadata(
                                                                                                                                          valueJsonChildrenSearchedItem.value,
                                                                                                                                        );
                                                                                                                                        _model.outputCapturedDataDateSearched = await actions.extractExifMetadata(
                                                                                                                                          valueJsonChildrenSearchedItem.value,
                                                                                                                                        );
                                                                                                                                        _model.outputUserDateSearched = await UserTable().queryRows(
                                                                                                                                          queryFn: (q) => q.eqOrNull(
                                                                                                                                            'user_id',
                                                                                                                                            listViewQExecutedTaskWithFieldsJsonRow.userId,
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                        await showModalBottomSheet(
                                                                                                                                          isScrollControlled: true,
                                                                                                                                          backgroundColor: Colors.transparent,
                                                                                                                                          enableDrag: false,
                                                                                                                                          useSafeArea: true,
                                                                                                                                          context: context,
                                                                                                                                          builder: (context) {
                                                                                                                                            return WebViewAware(
                                                                                                                                              child: GestureDetector(
                                                                                                                                                onTap: () {
                                                                                                                                                  FocusScope.of(context).unfocus();
                                                                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                                },
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                                  child: PictureDetailsWidget(
                                                                                                                                                    imgirl: valueJsonChildrenSearchedItem.value,
                                                                                                                                                    title: valueJsonChildrenSearchedItem.fieldName,
                                                                                                                                                    capturedBy: '${_model.outputUserDateSearched?.firstOrNull?.firstName} ${_model.outputUserDateSearched?.firstOrNull?.lastName}',
                                                                                                                                                    location: '${listViewQExecutedTaskWithFieldsJsonRow.clientName} ${listViewQExecutedTaskWithFieldsJsonRow.clientAddress}',
                                                                                                                                                    capturedDate: _model.outputCapturedDateSearched,
                                                                                                                                                    capturedData: _model.outputCapturedDataDateSearched,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            );
                                                                                                                                          },
                                                                                                                                        ).then((value) => safeSetState(() {}));

                                                                                                                                        safeSetState(() {});
                                                                                                                                      },
                                                                                                                                      child: ClipRRect(
                                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                                        child: Image.network(
                                                                                                                                          functions.convertStringToImagePath(valueJsonChildrenSearchedItem.value)!,
                                                                                                                                          width: 101.3,
                                                                                                                                          height: 88.1,
                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                if (valueJsonChildrenSearchedItem.fieldType != 'picture')
                                                                                                                                  Expanded(
                                                                                                                                    child: SingleChildScrollView(
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        children: [
                                                                                                                                          Align(
                                                                                                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                                                            child: AutoSizeText(
                                                                                                                                              valueJsonChildrenSearchedItem.value,
                                                                                                                                              minFontSize: 3.0,
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                    fontFamily: 'Geist Font Family',
                                                                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                                    fontSize: 9.0,
                                                                                                                                                    letterSpacing: 0.0,
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
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          );
                                                                                                        }).divide(SizedBox(width: 10.0)).around(SizedBox(width: 10.0)),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (_model.pageLoadingTabWidget)
                                      Opacity(
                                        opacity: 0.9,
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: wrapWithModel(
                                            model: _model.loadingCompModel1,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: LoadingCompWidget(),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (FFAppState().appIsLoadingData)
                    wrapWithModel(
                      model: _model.loadingCompModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: LoadingCompWidget(),
                    ),
                  if (FFAppState().appDateFromSelectorVisi)
                    Align(
                      alignment: AlignmentDirectional(-0.96, -0.2),
                      child: Container(
                        width: 400.0,
                        height: 400.0,
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
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 30.0, 30.0, 0.0),
                                  child: FlutterFlowCalendar(
                                    color: FlutterFlowTheme.of(context).primary,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    weekFormat: false,
                                    weekStartsMonday: false,
                                    rowHeight: 48.0,
                                    onChange: (DateTimeRange? newSelectedDate) {
                                      safeSetState(() =>
                                          _model.calendarDateFromSelectedDay =
                                              newSelectedDate);
                                    },
                                    titleStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Geist Font Family',
                                          letterSpacing: 0.0,
                                        ),
                                    dayOfWeekStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Geist Font Family',
                                          letterSpacing: 0.0,
                                        ),
                                    dateStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Geist Font Family',
                                          letterSpacing: 0.0,
                                        ),
                                    selectedDateStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Geist Font Family',
                                              letterSpacing: 0.0,
                                            ),
                                    inactiveDateStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Geist Font Family',
                                              letterSpacing: 0.0,
                                            ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().appDateFrom = _model
                                          .calendarDateFromSelectedDay?.start;
                                      FFAppState().appDateFromSelectorVisi =
                                          false;
                                      FFAppState().appDateToSelectorVisi =
                                          false;
                                      safeSetState(() {});
                                    },
                                    text: 'Ok',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (FFAppState().appDateToSelectorVisi)
                    Align(
                      alignment: AlignmentDirectional(-0.58, -0.19),
                      child: Container(
                        width: 400.0,
                        height: 400.0,
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
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 30.0, 30.0, 0.0),
                                  child: FlutterFlowCalendar(
                                    color: FlutterFlowTheme.of(context).primary,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    weekFormat: false,
                                    weekStartsMonday: false,
                                    rowHeight: 48.0,
                                    onChange: (DateTimeRange? newSelectedDate) {
                                      safeSetState(() =>
                                          _model.calendarDateToSelectedDay =
                                              newSelectedDate);
                                    },
                                    titleStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Geist Font Family',
                                          letterSpacing: 0.0,
                                        ),
                                    dayOfWeekStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Geist Font Family',
                                          letterSpacing: 0.0,
                                        ),
                                    dateStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Geist Font Family',
                                          letterSpacing: 0.0,
                                        ),
                                    selectedDateStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Geist Font Family',
                                              letterSpacing: 0.0,
                                            ),
                                    inactiveDateStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Geist Font Family',
                                              letterSpacing: 0.0,
                                            ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().appDateFromSelectorVisi =
                                          false;
                                      FFAppState().appDateToSelectorVisi =
                                          false;
                                      FFAppState().appDateTo = _model
                                          .calendarDateToSelectedDay?.start;
                                      safeSetState(() {});
                                    },
                                    text: 'Ok',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: AlignmentDirectional(1.01, -0.95),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(HomepageWidget.routeName);
                        },
                        text: 'Dashboard',
                        icon: FaIcon(
                          FontAwesomeIcons.home,
                          size: 10.0,
                        ),
                        options: FFButtonOptions(
                          height: 32.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Geist Font Family',
                                    color: Color(0xFF09245E),
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.65, -0.94),
                    child: FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 30.0,
                      fillColor: Color(0xFF103379),
                      icon: Icon(
                        Icons.slideshow_outlined,
                        color: FlutterFlowTheme.of(context).info,
                        size: 14.0,
                      ),
                      onPressed: () async {
                        context.pushNamed(ImageViewerWidget.routeName);
                      },
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
          safeSetState(() => _model.dateSelectionController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
