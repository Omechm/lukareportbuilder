import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/loading_comp_widget.dart';
import '/components/non_compliance_more_info_component_widget.dart';
import '/components/picture_details_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/date_selection.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
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
      safeSetState(() => _model.requestCompleter = null);
      await _model.waitForRequestCompleted();
      safeSetState(() =>
          _model.dateSelectionController = createPageWalkthrough(context));
      _model.dateSelectionController?.show(context: context);
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
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (!FFAppState().appPageFullScreenToggle)
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
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
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Task Summary',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                    Text(
                                                      'Summary',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 30.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                        HomepageWidget
                                                            .routeName);
                                                  },
                                                  text: 'Dashboard',
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.home,
                                                    size: 15.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Geist Font Family',
                                                          color:
                                                              Color(0xFF09245E),
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
                                    ),
                                  ],
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 10.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.06, -0.59),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: Container(
                                          width: 913.38,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 300.0,
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
                                                                                    fontSize: 7.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
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
                                                                                        useGoogleFonts: false,
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
                                                                                FFAppState().appDateFrom = functions.subtractDay(FFAppState().appDateFrom);
                                                                                safeSetState(() {});
                                                                                safeSetState(() => _model.requestCompleter = null);
                                                                                await _model.waitForRequestCompleted();
                                                                                safeSetState(() => _model.apiRequestCompleter = null);
                                                                                await _model.waitForApiRequestCompleted();
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
                                                                              FFAppState().appDateFrom = functions.addDay(FFAppState().appDateFrom);
                                                                              safeSetState(() {});
                                                                              safeSetState(() => _model.requestCompleter = null);
                                                                              await _model.waitForRequestCompleted();
                                                                              safeSetState(() => _model.apiRequestCompleter = null);
                                                                              await _model.waitForApiRequestCompleted();
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 300.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                      children:
                                                                          [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                'Date To',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Geist Font Family',
                                                                                      fontSize: 7.0,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                                          useGoogleFonts: false,
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
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  FFAppState().appDateTo = functions.subtractDay(FFAppState().appDateTo);
                                                                                  safeSetState(() {});
                                                                                  safeSetState(() => _model.requestCompleter = null);
                                                                                  await _model.waitForRequestCompleted();
                                                                                  safeSetState(() => _model.apiRequestCompleter = null);
                                                                                  await _model.waitForApiRequestCompleted();
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.chevron_left_rounded,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                FFAppState().appDateTo = functions.addDay(FFAppState().appDateTo);
                                                                                safeSetState(() {});
                                                                                safeSetState(() => _model.requestCompleter = null);
                                                                                await _model.waitForRequestCompleted();
                                                                                safeSetState(() => _model.apiRequestCompleter = null);
                                                                                await _model.waitForApiRequestCompleted();
                                                                              },
                                                                              child: Icon(
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
                                                                              width: 8.0)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                                _model.requestCompleter =
                                                                    null);
                                                            await _model
                                                                .waitForRequestCompleted();
                                                            safeSetState(() =>
                                                                _model.apiRequestCompleter =
                                                                    null);
                                                            await _model
                                                                .waitForApiRequestCompleted();
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
                                                      SizedBox(width: 12.0)),
                                                ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          fillColor: Color(0xFF103379),
                                          icon: Icon(
                                            Icons.slideshow_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            context.pushNamed(
                                                ImageViewerWidget.routeName);
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Text(
                                            'Slide Show',
                                            style: FlutterFlowTheme.of(context)
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 50.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (FFAppState()
                                              .appPageFullScreenToggle)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderRadius: 8.0,
                                                    buttonSize: 30.0,
                                                    icon: Icon(
                                                      Icons
                                                          .fullscreen_exit_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () async {
                                                      FFAppState()
                                                              .appPageFullScreenToggle =
                                                          false;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  Text(
                                                    'Exit Full mode',
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
                                                ],
                                              ),
                                            ),
                                          if (!FFAppState()
                                              .appPageFullScreenToggle)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderRadius: 8.0,
                                                    buttonSize: 30.0,
                                                    icon: Icon(
                                                      Icons.fullscreen_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () async {
                                                      FFAppState()
                                                              .appPageFullScreenToggle =
                                                          true;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  Text(
                                                    'Full mode',
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
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment(0.0, 0),
                                      child: TabBar(
                                        isScrollable: true,
                                        tabAlignment: TabAlignment.center,
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Geist Font Family',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        unselectedLabelStyle:
                                            FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily:
                                                      'Geist Font Family',
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        padding: EdgeInsets.all(6.0),
                                        tabs: [
                                          Tab(
                                            text: 'Compliance Report',
                                          ),
                                          Tab(
                                            text: 'Infrastructure Summary',
                                          ),
                                        ],
                                        controller: _model.summaryController,
                                        onTap: (i) async {
                                          [() async {}, () async {}][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.summaryController,
                                        children: [
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Container(
                                              decoration: BoxDecoration(
                                                color: Color(0x53FFFFFF),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 12.0, 16.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Flexible(
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
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
                                                                            child:
                                                                                Padding(
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
                                                                                                useGoogleFonts: false,
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
                                                                                              useGoogleFonts: false,
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
                                                                            context.pushNamed(ImageViewerWidget.routeName);
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
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
                                                                            child:
                                                                                Padding(
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
                                                                                                useGoogleFonts: false,
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
                                                                                              useGoogleFonts: false,
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
                                                                  ]
                                                                      .divide(SizedBox(
                                                                          width:
                                                                              1.0))
                                                                      .around(SizedBox(
                                                                          width:
                                                                              1.0)),
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Stack(
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
                                                                                    height: MediaQuery.sizeOf(context).height * 0.5,
                                                                                    child: custom_widgets.SyncFussChartColumn(
                                                                                      width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                      height: MediaQuery.sizeOf(context).height * 0.5,
                                                                                      yMaxValue: (syncFussChartColumnGetAggregatedNoCompliantTasksResponse.jsonBody.toList().map<NonCompliantLocationCountStruct?>(NonCompliantLocationCountStruct.maybeFromMap).toList() as Iterable<NonCompliantLocationCountStruct?>).withoutNulls.sortedList(keyOf: (e) => e.count, desc: true).firstOrNull?.count.toDouble(),
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
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Stack(
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
                                                                                    width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                    height: MediaQuery.sizeOf(context).height * 0.5,
                                                                                    child: custom_widgets.ExecutionPercentageChart(
                                                                                      width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                      height: MediaQuery.sizeOf(context).height * 0.5,
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
                                                                              alignment: AlignmentDirectional(1.0, 0.0),
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
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      width:
                                                                          10.0))
                                                                  .around(SizedBox(
                                                                      width:
                                                                          10.0)),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  height: 19.0))
                                                              .around(SizedBox(
                                                                  height:
                                                                      19.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  10.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.3,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.3,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                2.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          30.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Non compliant location',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Stack(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          20.0),
                                                                      child: FutureBuilder<
                                                                          List<
                                                                              NonCompliantTaskExecutionRow>>(
                                                                        future: (_model.requestCompleter ??= Completer<List<NonCompliantTaskExecutionRow>>()
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
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<NonCompliantTaskExecutionRow>
                                                                              listViewNonCompliantTaskExecutionRowList =
                                                                              snapshot.data!;

                                                                          return ListView
                                                                              .separated(
                                                                            padding:
                                                                                EdgeInsets.symmetric(vertical: 5.0),
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                listViewNonCompliantTaskExecutionRowList.length,
                                                                            separatorBuilder: (_, __) =>
                                                                                SizedBox(height: 5.0),
                                                                            itemBuilder:
                                                                                (context, listViewIndex) {
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
                                                                                                List<UserClientAssignmentsRow> columnUserClientAssignmentsRowList = snapshot.data!;

                                                                                                final columnUserClientAssignmentsRow = columnUserClientAssignmentsRowList.isNotEmpty ? columnUserClientAssignmentsRowList.first : null;

                                                                                                return Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                                                        useGoogleFonts: false,
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
                                                                                                                    columnUserClientAssignmentsRow?.firstName,
                                                                                                                    'null',
                                                                                                                  )} ${valueOrDefault<String>(
                                                                                                                    columnUserClientAssignmentsRow?.lastName,
                                                                                                                    'null',
                                                                                                                  )}',
                                                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                        fontFamily: 'Geist Font Family',
                                                                                                                        fontSize: 8.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: false,
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
                                                                    ),
                                                                    if (_model
                                                                        .pageDataisLoading)
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.circleNotch,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                24.0,
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
                                          KeepAliveWidgetWrapper(
                                            builder: (context) =>
                                                SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: (_model
                                                                .apiRequestCompleter ??=
                                                            Completer<
                                                                ApiCallResponse>()
                                                              ..complete(
                                                                  GetExecutedTasksDyDateRangeCall
                                                                      .call(
                                                                startDate: dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    FFAppState()
                                                                        .appDateFrom),
                                                                endDate: dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    FFAppState()
                                                                        .appDateTo),
                                                                companyName:
                                                                    FFAppState()
                                                                        .appAuthUserCompanyName,
                                                              )))
                                                        .future,
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 10.0,
                                                            height: 10.0,
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
                                                      final containerGetExecutedTasksDyDateRangeResponse =
                                                          snapshot.data!;

                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                2.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      10.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final executedReportSummary = (containerGetExecutedTasksDyDateRangeResponse
                                                                          .jsonBody
                                                                          .toList()
                                                                          .map<GetExecutedTasksByDateRangeDTStruct?>(
                                                                              GetExecutedTasksByDateRangeDTStruct.maybeFromMap)
                                                                          .toList() as Iterable<GetExecutedTasksByDateRangeDTStruct?>)
                                                                      .withoutNulls
                                                                      .toList() ??
                                                                  [];

                                                              return FlutterFlowDataTable<
                                                                  GetExecutedTasksByDateRangeDTStruct>(
                                                                controller: _model
                                                                    .paginatedDataTableController,
                                                                data:
                                                                    executedReportSummary,
                                                                columnsBuilder:
                                                                    (onSortChanged) =>
                                                                        [
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'LOCATION',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'IS THE GENERATOR BATTERY IN-PLACE ?',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'IS THE GENERATOR & IT\'S AMOURED CABLE IN PLACE ?',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'IS THE AVR AVAILABLE AND IN PLACE ?',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'ARE THE AC UNIT IN PLACE ?',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'WHAT IS THE DIESEL LEVEL ?',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'IS THE TRANSFORMER IN PLACE?',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'IS THE THUNDER ARRESTOR IN PLACE?',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'PICTURE OF THE GENERATOR BATTERY.',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'PICTURE OF TRANSFORMER.',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'PICTURE OF AMOURED CABLE.',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'PICTURE OF THE AC UNIT.',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'PICTURE OF DIESEL GUAGE.',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'PICTURE OF THUNDER ARRESTOR.',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'PICTURE OF THE AVR.',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'DATE',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn2(
                                                                    label: DefaultTextStyle
                                                                        .merge(
                                                                      softWrap:
                                                                          true,
                                                                      child:
                                                                          Text(
                                                                        'REMARK',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                                dataRowBuilder: (executedReportSummaryItem,
                                                                        executedReportSummaryIndex,
                                                                        selected,
                                                                        onSelectChanged) =>
                                                                    DataRow(
                                                                  color:
                                                                      WidgetStateProperty
                                                                          .all(
                                                                    executedReportSummaryIndex %
                                                                                2 ==
                                                                            0
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .secondaryBackground
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                  ),
                                                                  cells: [
                                                                    Text(
                                                                      executedReportSummaryItem
                                                                          .clientName,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        executedReportSummaryItem
                                                                            .generatorBatteryInPlace,
                                                                        'null',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        executedReportSummaryItem
                                                                            .generatorAmouredCableInPlace,
                                                                        'null',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        executedReportSummaryItem
                                                                            .avrAvailableInPlace,
                                                                        'null',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        executedReportSummaryItem
                                                                            .acUnitInPlace,
                                                                        'null',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        executedReportSummaryItem
                                                                            .dieselLevel,
                                                                        'null',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        executedReportSummaryItem
                                                                            .transformerInPlace,
                                                                        'null',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        executedReportSummaryItem
                                                                            .thunderArrestorInPlace,
                                                                        'null',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10.0),
                                                                        child:
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
                                                                            _model.outputCapturedDateCopy =
                                                                                await actions.extractImageDateMetadata(
                                                                              executedReportSummaryItem.pictureGeneratorBattery,
                                                                            );
                                                                            _model.outputCapturedDataCopy =
                                                                                await actions.extractExifMetadata(
                                                                              executedReportSummaryItem.pictureGeneratorBattery,
                                                                            );
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(context).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: PictureDetailsWidget(
                                                                                      imgirl: executedReportSummaryItem.pictureGeneratorBattery,
                                                                                      title: 'Generator Battery',
                                                                                      capturedBy: executedReportSummaryItem.userFullName,
                                                                                      location: executedReportSummaryItem.clientName,
                                                                                      capturedDate: _model.outputCapturedDateCopy,
                                                                                      capturedData: _model.outputCapturedDataCopy,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));

                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              functions.convertStringToImagePath(executedReportSummaryItem.pictureGeneratorBattery)!,
                                                                              width: 200.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.contain,
                                                                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                'assets/images/error_image.jpeg',
                                                                                width: 200.0,
                                                                                height: 200.0,
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            functions.convertStringToImagePath(executedReportSummaryItem.pictureTransformer)!,
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            errorBuilder: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.jpeg',
                                                                              width: 200.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            functions.convertStringToImagePath(executedReportSummaryItem.pictureAmouredCable)!,
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            errorBuilder: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.jpeg',
                                                                              width: 200.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            functions.convertStringToImagePath(executedReportSummaryItem.pictureAcUnit)!,
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            errorBuilder: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.jpeg',
                                                                              width: 200.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            functions.convertStringToImagePath(executedReportSummaryItem.pictureDieselGuage)!,
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            errorBuilder: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.jpeg',
                                                                              width: 200.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            functions.convertStringToImagePath(executedReportSummaryItem.pictureThunderArrestor)!,
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            errorBuilder: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.jpeg',
                                                                              width: 200.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            functions.convertStringToImagePath(executedReportSummaryItem.pictureAvr)!,
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            errorBuilder: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.jpeg',
                                                                              width: 200.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      executedReportSummaryItem
                                                                          .executedDate,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      executedReportSummaryItem
                                                                          .remark,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ]
                                                                      .map((c) =>
                                                                          DataCell(
                                                                              c))
                                                                      .toList(),
                                                                ),
                                                                paginated: true,
                                                                selectable:
                                                                    false,
                                                                hidePaginator:
                                                                    false,
                                                                showFirstLastButtons:
                                                                    false,
                                                                headingRowHeight:
                                                                    100.0,
                                                                dataRowHeight:
                                                                    150.0,
                                                                columnSpacing:
                                                                    20.0,
                                                                headingRowColor:
                                                                    Color(
                                                                        0xFF09245E),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                addHorizontalDivider:
                                                                    true,
                                                                addTopAndBottomDivider:
                                                                    true,
                                                                hideDefaultHorizontalDivider:
                                                                    true,
                                                                horizontalDividerColor:
                                                                    Color(
                                                                        0xFF091635),
                                                                horizontalDividerThickness:
                                                                    0.5,
                                                                addVerticalDivider:
                                                                    true,
                                                                verticalDividerColor:
                                                                    Color(
                                                                        0x705A5C60),
                                                                verticalDividerThickness:
                                                                    1.0,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
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
                      ],
                    ),
                  ),
                  if (FFAppState().appIsLoadingData)
                    wrapWithModel(
                      model: _model.loadingCompModel,
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
                                          useGoogleFonts: false,
                                        ),
                                    dayOfWeekStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Geist Font Family',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    dateStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Geist Font Family',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    selectedDateStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Geist Font Family',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                    inactiveDateStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Geist Font Family',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
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
                                            useGoogleFonts: false,
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
                                          useGoogleFonts: false,
                                        ),
                                    dayOfWeekStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Geist Font Family',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    dateStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Geist Font Family',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    selectedDateStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Geist Font Family',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                    inactiveDateStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Geist Font Family',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
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
                                            useGoogleFonts: false,
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
