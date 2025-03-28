import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/comp_vacancy_closure_widget.dart';
import '/components/loading_comp_widget.dart';
import '/components/picture_details_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'report_summary_copy_model.dart';
export 'report_summary_copy_model.dart';

class ReportSummaryCopyWidget extends StatefulWidget {
  const ReportSummaryCopyWidget({super.key});

  static String routeName = 'ReportSummaryCopy';
  static String routePath = '/reportSummaryCopy';

  @override
  State<ReportSummaryCopyWidget> createState() =>
      _ReportSummaryCopyWidgetState();
}

class _ReportSummaryCopyWidgetState extends State<ReportSummaryCopyWidget>
    with TickerProviderStateMixin {
  late ReportSummaryCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportSummaryCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().appIsLoadingData = true;
      FFAppState().appPageFullScreenToggle = true;
      FFAppState().appDateFrom = getCurrentTimestamp;
      FFAppState().appDateTo = getCurrentTimestamp;
      safeSetState(() {});
      _model.pageExecutedReportFiltered = [];
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
      safeSetState(() {});
      _model.outputFieldValue = await FieldValuesTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_name',
          FFAppState().appAuthUserCompanyName,
        ),
      );
      _model.outputFieldVacancy = await InspectionFieldsTable().queryRows(
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
    });

    _model.summaryController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 1,
    )..addListener(() => safeSetState(() {}));
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
        title: 'ReportSummaryCopy',
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (FFAppState().appPageFullScreenToggle)
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.fullscreen_exit_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Geist Font Family',
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                    if (!FFAppState().appPageFullScreenToggle)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.fullscreen_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Geist Font Family',
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
                              if (!FFAppState().appPageFullScreenToggle)
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(16.0),
                                              bottomRight:
                                                  Radius.circular(16.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF09245E),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(16.0),
                                                bottomRight:
                                                    Radius.circular(16.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Report Summary',
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
                                                                  fontSize:
                                                                      15.0,
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
                                                                  fontSize:
                                                                      10.0,
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
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                color: Color(
                                                                    0xFF09245E),
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
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
                                    ),
                                  ],
                                ),
                              if (!FFAppState().appPageFullScreenToggle)
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.06, -0.59),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 10.0),
                                        child: Container(
                                          width: 700.0,
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
                                                      child: Container(
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
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Date From',
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
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  FFAppState()
                                                                          .appDateFromSelectorVisi =
                                                                      !(FFAppState()
                                                                              .appDateFromSelectorVisi ??
                                                                          true);
                                                                  FFAppState()
                                                                          .appDateToSelectorVisi =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                },
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
                                                                          .calendar_today_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    Text(
                                                                      dateTimeFormat(
                                                                          "d/M/y",
                                                                          FFAppState()
                                                                              .appDateFrom),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
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
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Date To',
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
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  FFAppState()
                                                                          .appDateFromSelectorVisi =
                                                                      false;
                                                                  FFAppState()
                                                                          .appDateToSelectorVisi =
                                                                      !(FFAppState()
                                                                              .appDateToSelectorVisi ??
                                                                          true);
                                                                  safeSetState(
                                                                      () {});
                                                                },
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
                                                                          .calendar_today_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    Text(
                                                                      dateTimeFormat(
                                                                          "d/M/y",
                                                                          FFAppState()
                                                                              .appDateTo),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 8.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          Color(0xFF09245E),
                                                      icon: Icon(
                                                        Icons.search,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        _model.pageExecutedReportFiltered =
                                                            [];
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
                                                      },
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 8.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          Color(0xFFFB1014),
                                                      icon: Icon(
                                                        Icons.search_off,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        FFAppState().appDateTo =
                                                            null;
                                                        FFAppState()
                                                            .appDateFrom = null;
                                                        safeSetState(() {});
                                                        _model.pageExecutedReportFiltered =
                                                            [];
                                                        _model.refresh = 0;
                                                        safeSetState(() {});
                                                      },
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
                                  ],
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
                                              fontSize: 15.0,
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
                                          Opacity(
                                            opacity: 0.0,
                                            child: Tab(
                                              text: 'Vacancy Summary',
                                            ),
                                          ),
                                          Tab(
                                            text: 'Infracstruture Summary',
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
                                            builder: (context) => Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
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
                                                              5.0),
                                                    ),
                                                    child: Visibility(
                                                      visible: false,
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
                                                            final executedReportSummaryVacancy = _model
                                                                        .pageExecutedReportFiltered
                                                                        .length >
                                                                    0
                                                                ? _model
                                                                    .pageExecutedReportFiltered
                                                                    .where((e) =>
                                                                        e.taskName ==
                                                                        'Vacancy Report')
                                                                    .toList()
                                                                : _model
                                                                    .pageExecutedReportUnfiltered
                                                                    .where((e) =>
                                                                        e.taskName ==
                                                                        'Vacancy Report')
                                                                    .toList()
                                                                    .where((e) =>
                                                                        e.taskName ==
                                                                        'Vacancy Report')
                                                                    .toList()
                                                                    .sortedList(
                                                                        keyOf: (e) => e
                                                                            .id,
                                                                        desc:
                                                                            true)
                                                                    .toList();

                                                            return FlutterFlowDataTable<
                                                                ExecutedTaskNameRow>(
                                                              controller: _model
                                                                  .paginatedDataTableController1,
                                                              data:
                                                                  executedReportSummaryVacancy,
                                                              columnsBuilder:
                                                                  (onSortChanged) =>
                                                                      [
                                                                DataColumn2(
                                                                  label:
                                                                      DefaultTextStyle
                                                                          .merge(
                                                                    softWrap:
                                                                        true,
                                                                    child: Text(
                                                                      'LOCATION',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                DataColumn2(
                                                                  label:
                                                                      DefaultTextStyle
                                                                          .merge(
                                                                    softWrap:
                                                                        true,
                                                                    child: Text(
                                                                      'NAME OF GUARD',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                DataColumn2(
                                                                  label:
                                                                      DefaultTextStyle
                                                                          .merge(
                                                                    softWrap:
                                                                        true,
                                                                    child: Text(
                                                                      'PHONE NUMBER',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                DataColumn2(
                                                                  label:
                                                                      DefaultTextStyle
                                                                          .merge(
                                                                    softWrap:
                                                                        true,
                                                                    child: Text(
                                                                      'SUPO IN CHARGE',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                DataColumn2(
                                                                  label:
                                                                      DefaultTextStyle
                                                                          .merge(
                                                                    softWrap:
                                                                        true,
                                                                    child: Text(
                                                                      'VACANCY PERIOD(IN DAYS)',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                DataColumn2(
                                                                  label:
                                                                      DefaultTextStyle
                                                                          .merge(
                                                                    softWrap:
                                                                        true,
                                                                    child: Text(
                                                                      'MEANS OF EXIT',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                DataColumn2(
                                                                  label:
                                                                      DefaultTextStyle
                                                                          .merge(
                                                                    softWrap:
                                                                        true,
                                                                    child: Text(
                                                                      'REMARK',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                DataColumn2(
                                                                  label:
                                                                      DefaultTextStyle
                                                                          .merge(
                                                                    softWrap:
                                                                        true,
                                                                    child: Text(
                                                                      'STATUS',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                DataColumn2(
                                                                  label:
                                                                      DefaultTextStyle
                                                                          .merge(
                                                                    softWrap:
                                                                        true,
                                                                    child: Text(
                                                                      'NUMBER OF OPEN VACANCIES',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                DataColumn2(
                                                                  label:
                                                                      DefaultTextStyle
                                                                          .merge(
                                                                    softWrap:
                                                                        true,
                                                                    child: Text(
                                                                      'DATE',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                DataColumn2(
                                                                  label:
                                                                      DefaultTextStyle
                                                                          .merge(
                                                                    softWrap:
                                                                        true,
                                                                    child:
                                                                        Container(),
                                                                  ),
                                                                ),
                                                              ],
                                                              dataRowBuilder:
                                                                  (executedReportSummaryVacancyItem,
                                                                          executedReportSummaryVacancyIndex,
                                                                          selected,
                                                                          onSelectChanged) =>
                                                                      DataRow(
                                                                color:
                                                                    WidgetStateProperty
                                                                        .all(
                                                                  executedReportSummaryVacancyIndex %
                                                                              2 ==
                                                                          0
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                ),
                                                                cells: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      executedReportSummaryVacancyItem
                                                                          .clientName,
                                                                      'client_name',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  FutureBuilder<
                                                                      List<
                                                                          InspectionFieldsRow>>(
                                                                    future: InspectionFieldsTable()
                                                                        .querySingleRow(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'field_name',
                                                                        'NAME OF GUARD',
                                                                      ),
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
                                                                      List<InspectionFieldsRow>
                                                                          textInspectionFieldsRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      // Return an empty Container when the item does not exist.
                                                                      if (snapshot
                                                                          .data!
                                                                          .isEmpty) {
                                                                        return Container();
                                                                      }
                                                                      final textInspectionFieldsRow = textInspectionFieldsRowList
                                                                              .isNotEmpty
                                                                          ? textInspectionFieldsRowList
                                                                              .first
                                                                          : null;

                                                                      return AutoSizeText(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .outputFieldValue
                                                                              ?.where((e) => (e.fieldId == textInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryVacancyItem.recordId))
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.value,
                                                                          'value',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              1000,
                                                                        ),
                                                                        minFontSize:
                                                                            10.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      );
                                                                    },
                                                                  ),
                                                                  FutureBuilder<
                                                                      List<
                                                                          InspectionFieldsRow>>(
                                                                    future: InspectionFieldsTable()
                                                                        .querySingleRow(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'field_name',
                                                                        'PHONE NUMBER',
                                                                      ),
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
                                                                      List<InspectionFieldsRow>
                                                                          textInspectionFieldsRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      // Return an empty Container when the item does not exist.
                                                                      if (snapshot
                                                                          .data!
                                                                          .isEmpty) {
                                                                        return Container();
                                                                      }
                                                                      final textInspectionFieldsRow = textInspectionFieldsRowList
                                                                              .isNotEmpty
                                                                          ? textInspectionFieldsRowList
                                                                              .first
                                                                          : null;

                                                                      return AutoSizeText(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .outputFieldValue
                                                                              ?.where((e) => (e.fieldId == textInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryVacancyItem.recordId))
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.value,
                                                                          'value',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              1000,
                                                                        ),
                                                                        minFontSize:
                                                                            10.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      );
                                                                    },
                                                                  ),
                                                                  AutoSizeText(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      executedReportSummaryVacancyItem
                                                                          .supervisor,
                                                                      'value',
                                                                    ).maybeHandleOverflow(
                                                                      maxChars:
                                                                          1000,
                                                                    ),
                                                                    minFontSize:
                                                                        10.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  FutureBuilder<
                                                                      List<
                                                                          InspectionFieldsRow>>(
                                                                    future: InspectionFieldsTable()
                                                                        .querySingleRow(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'field_name',
                                                                        'VACANCY PERIOD(IN DAYS)',
                                                                      ),
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
                                                                      List<InspectionFieldsRow>
                                                                          textInspectionFieldsRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      // Return an empty Container when the item does not exist.
                                                                      if (snapshot
                                                                          .data!
                                                                          .isEmpty) {
                                                                        return Container();
                                                                      }
                                                                      final textInspectionFieldsRow = textInspectionFieldsRowList
                                                                              .isNotEmpty
                                                                          ? textInspectionFieldsRowList
                                                                              .first
                                                                          : null;

                                                                      return AutoSizeText(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .outputFieldValue
                                                                              ?.where((e) => (e.fieldId == textInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryVacancyItem.recordId))
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.value,
                                                                          'value',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              1000,
                                                                        ),
                                                                        minFontSize:
                                                                            10.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      );
                                                                    },
                                                                  ),
                                                                  FutureBuilder<
                                                                      List<
                                                                          InspectionFieldsRow>>(
                                                                    future: InspectionFieldsTable()
                                                                        .querySingleRow(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'field_name',
                                                                        'MEANS OF EXIT',
                                                                      ),
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
                                                                      List<InspectionFieldsRow>
                                                                          textInspectionFieldsRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      // Return an empty Container when the item does not exist.
                                                                      if (snapshot
                                                                          .data!
                                                                          .isEmpty) {
                                                                        return Container();
                                                                      }
                                                                      final textInspectionFieldsRow = textInspectionFieldsRowList
                                                                              .isNotEmpty
                                                                          ? textInspectionFieldsRowList
                                                                              .first
                                                                          : null;

                                                                      return AutoSizeText(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .outputFieldValue
                                                                              ?.where((e) => (e.fieldId == textInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryVacancyItem.recordId))
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.value,
                                                                          'value',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              1000,
                                                                        ),
                                                                        minFontSize:
                                                                            10.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      );
                                                                    },
                                                                  ),
                                                                  FutureBuilder<
                                                                      List<
                                                                          InspectionFieldsRow>>(
                                                                    future: InspectionFieldsTable()
                                                                        .querySingleRow(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'field_name',
                                                                        'REMARK',
                                                                      ),
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
                                                                      List<InspectionFieldsRow>
                                                                          textInspectionFieldsRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      // Return an empty Container when the item does not exist.
                                                                      if (snapshot
                                                                          .data!
                                                                          .isEmpty) {
                                                                        return Container();
                                                                      }
                                                                      final textInspectionFieldsRow = textInspectionFieldsRowList
                                                                              .isNotEmpty
                                                                          ? textInspectionFieldsRowList
                                                                              .first
                                                                          : null;

                                                                      return AutoSizeText(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .outputFieldValue
                                                                              ?.where((e) => (e.fieldId == textInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryVacancyItem.recordId))
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.value,
                                                                          'value',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              1000,
                                                                        ),
                                                                        minFontSize:
                                                                            10.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      );
                                                                    },
                                                                  ),
                                                                  FutureBuilder<
                                                                      List<
                                                                          VacancyClosureRow>>(
                                                                    future: VacancyClosureTable()
                                                                        .querySingleRow(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'record_id',
                                                                        executedReportSummaryVacancyItem
                                                                            .recordId,
                                                                      ),
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
                                                                      List<VacancyClosureRow>
                                                                          containerVacancyClosureRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      final containerVacancyClosureRow = containerVacancyClosureRowList
                                                                              .isNotEmpty
                                                                          ? containerVacancyClosureRowList
                                                                              .first
                                                                          : null;

                                                                      return Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: containerVacancyClosureRow?.status == 'Open'
                                                                              ? Color(0xFFD90E0E)
                                                                              : Color(0xFF47C113),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(5.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            valueOrDefault<String>(
                                                                              containerVacancyClosureRow?.status,
                                                                              'value',
                                                                            ).maybeHandleOverflow(
                                                                              maxChars: 1000,
                                                                            ),
                                                                            minFontSize:
                                                                                10.0,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Geist Font Family',
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                  FutureBuilder<
                                                                      List<
                                                                          VacancyClosureRow>>(
                                                                    future: VacancyClosureTable()
                                                                        .querySingleRow(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'record_id',
                                                                        executedReportSummaryVacancyItem
                                                                            .recordId,
                                                                      ),
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
                                                                      List<VacancyClosureRow>
                                                                          rowVacancyClosureRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      final rowVacancyClosureRow = rowVacancyClosureRowList
                                                                              .isNotEmpty
                                                                          ? rowVacancyClosureRowList
                                                                              .first
                                                                          : null;

                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(5.0),
                                                                            child:
                                                                                FutureBuilder<List<InspectionFieldsRow>>(
                                                                              future: InspectionFieldsTable().querySingleRow(
                                                                                queryFn: (q) => q.eqOrNull(
                                                                                  'field_name',
                                                                                  'NUMBER OF VACANCIES',
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
                                                                                List<InspectionFieldsRow> textInspectionFieldsRowList = snapshot.data!;

                                                                                // Return an empty Container when the item does not exist.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textInspectionFieldsRow = textInspectionFieldsRowList.isNotEmpty ? textInspectionFieldsRowList.first : null;

                                                                                return AutoSizeText(
                                                                                  valueOrDefault<String>(
                                                                                    (int.parse(valueOrDefault<String>(
                                                                                              _model.outputFieldValue?.where((e) => (e.fieldId == textInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryVacancyItem.recordId)).toList().firstOrNull?.value,
                                                                                              'value',
                                                                                            )) -
                                                                                            (rowVacancyClosureRow!.numberOfReplacedVacancy!))
                                                                                        .toString(),
                                                                                    '0',
                                                                                  ).maybeHandleOverflow(
                                                                                    maxChars: 1000,
                                                                                  ),
                                                                                  minFontSize: 10.0,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Geist Font Family',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(5.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          dateTimeFormat("d/M/y", executedReportSummaryVacancyItem.executedDate!)
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                1000,
                                                                          ),
                                                                          minFontSize:
                                                                              10.0,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Geist Font Family',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  FutureBuilder<
                                                                      List<
                                                                          VacancyClosureRow>>(
                                                                    future: VacancyClosureTable()
                                                                        .querySingleRow(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'record_id',
                                                                        executedReportSummaryVacancyItem
                                                                            .recordId,
                                                                      ),
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
                                                                      List<VacancyClosureRow>
                                                                          rowVacancyClosureRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      final rowVacancyClosureRow = rowVacancyClosureRowList
                                                                              .isNotEmpty
                                                                          ? rowVacancyClosureRowList
                                                                              .first
                                                                          : null;

                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (_model.outputAuthUserInfo?.firstOrNull?.userRole ==
                                                                              'HOS')
                                                                            FutureBuilder<List<InspectionFieldsRow>>(
                                                                              future: InspectionFieldsTable().querySingleRow(
                                                                                queryFn: (q) => q.eqOrNull(
                                                                                  'field_name',
                                                                                  'NUMBER OF VACANCIES',
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
                                                                                List<InspectionFieldsRow> buttonInspectionFieldsRowList = snapshot.data!;

                                                                                // Return an empty Container when the item does not exist.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final buttonInspectionFieldsRow = buttonInspectionFieldsRowList.isNotEmpty ? buttonInspectionFieldsRowList.first : null;

                                                                                return FFButtonWidget(
                                                                                  onPressed: () async {
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
                                                                                            child: Container(
                                                                                              height: double.infinity,
                                                                                              child: CompVacancyClosureWidget(
                                                                                                currentOpenVacancy: int.parse(valueOrDefault<String>(
                                                                                                      _model.outputFieldValue?.where((e) => (e.fieldId == buttonInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryVacancyItem.recordId)).toList().firstOrNull?.value,
                                                                                                      'value',
                                                                                                    )) -
                                                                                                    (rowVacancyClosureRow!.numberOfReplacedVacancy!),
                                                                                                recordId: executedReportSummaryVacancyItem.recordId!,
                                                                                                currentSubmittedVacancy: int.parse(valueOrDefault<String>(
                                                                                                  _model.outputFieldValue?.where((e) => (e.fieldId == buttonInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryVacancyItem.recordId)).toList().firstOrNull?.value,
                                                                                                  'value',
                                                                                                )),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  },
                                                                                  text: 'Fill Vacancy',
                                                                                  options: FFButtonOptions(
                                                                                    height: 25.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: Color(0xFF09245E),
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Geist Font Family',
                                                                                          color: Colors.white,
                                                                                          fontSize: 7.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                ]
                                                                    .map((c) =>
                                                                        DataCell(
                                                                            c))
                                                                    .toList(),
                                                              ),
                                                              paginated: true,
                                                              selectable: false,
                                                              hidePaginator:
                                                                  false,
                                                              showFirstLastButtons:
                                                                  false,
                                                              headingRowHeight:
                                                                  40.0,
                                                              dataRowHeight:
                                                                  48.0,
                                                              columnSpacing:
                                                                  20.0,
                                                              headingRowColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
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
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
                                                              horizontalDividerThickness:
                                                                  1.0,
                                                              addVerticalDivider:
                                                                  true,
                                                              verticalDividerColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              verticalDividerThickness:
                                                                  1.0,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final executedReportSummaryInfracstructure = _model
                                                                .pageExecutedReportFiltered
                                                                .length >
                                                            0
                                                        ? _model
                                                            .pageExecutedReportFiltered
                                                            .where((e) =>
                                                                e.taskName ==
                                                                'Infrastructure Report')
                                                            .toList()
                                                        : _model
                                                            .pageExecutedReportUnfiltered
                                                            .where((e) =>
                                                                e.taskName ==
                                                                'Infrastructure Report')
                                                            .toList()
                                                            .where((e) =>
                                                                e.taskName ==
                                                                'Infrastructure Report')
                                                            .toList()
                                                            .sortedList(
                                                                keyOf: (e) =>
                                                                    e.id,
                                                                desc: true)
                                                            .toList();

                                                    return FlutterFlowDataTable<
                                                        ExecutedTaskNameRow>(
                                                      controller: _model
                                                          .paginatedDataTableController2,
                                                      data:
                                                          executedReportSummaryInfracstructure,
                                                      columnsBuilder:
                                                          (onSortChanged) => [
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'LOCATION',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'IS THE GENERATOR BATTERY IN-PLACE ?',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'IS THE GENERATOR & IT\'S AMOURED CABLE IN PLACE ?',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'IS THE AVR AVAILABLE AND IN PLACE ?',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'ARE THE AC UNIT IN PLACE ?',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'WHAT IS THE DIESEL LEVEL ?',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'IS THE TRANSFORMER IN PLACE?',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'IS THE THUNDER ARRESTOR IN PLACE?',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'PICTURE OF THE GENERATOR BATTERY.',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'PICTURE OF TRANSFORMER.',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'PICTURE OF AMOURED CABLE.',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'PICTURE OF THE AC UNIT.',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'PICTURE OF DIESEL GUAGE.',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'PICTURE OF THUNDER ARRESTOR.',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'PICTURE OF THE AVR.',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'DATE',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'REMARK',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                      dataRowBuilder:
                                                          (executedReportSummaryInfracstructureItem,
                                                                  executedReportSummaryInfracstructureIndex,
                                                                  selected,
                                                                  onSelectChanged) =>
                                                              DataRow(
                                                        color:
                                                            WidgetStateProperty
                                                                .all(
                                                          executedReportSummaryInfracstructureIndex %
                                                                      2 ==
                                                                  0
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryBackground
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                        ),
                                                        cells: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              executedReportSummaryInfracstructureItem
                                                                  .clientName,
                                                              'client_name',
                                                            ),
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
                                                          FutureBuilder<
                                                              List<
                                                                  InspectionFieldsRow>>(
                                                            future: InspectionFieldsTable()
                                                                .querySingleRow(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                'field_name',
                                                                'IS THE GENERATOR BATTERY IN-PLACE ?',
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
                                                                  textInspectionFieldsRowList =
                                                                  snapshot
                                                                      .data!;

                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final textInspectionFieldsRow =
                                                                  textInspectionFieldsRowList
                                                                          .isNotEmpty
                                                                      ? textInspectionFieldsRowList
                                                                          .first
                                                                      : null;

                                                              return AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model
                                                                      .outputFieldValue
                                                                      ?.where((e) =>
                                                                          (e.fieldId ==
                                                                              textInspectionFieldsRow
                                                                                  ?.fieldId) &&
                                                                          (e.recordId ==
                                                                              executedReportSummaryInfracstructureItem.recordId))
                                                                      .toList()
                                                                      .firstOrNull
                                                                      ?.value,
                                                                  'value',
                                                                ).maybeHandleOverflow(
                                                                  maxChars:
                                                                      1000,
                                                                ),
                                                                minFontSize:
                                                                    10.0,
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
                                                              );
                                                            },
                                                          ),
                                                          FutureBuilder<
                                                              List<
                                                                  InspectionFieldsRow>>(
                                                            future: InspectionFieldsTable()
                                                                .querySingleRow(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                'field_name',
                                                                'IS THE GENERATOR & IT\'S AMOURED CABLE IN PLACE ?',
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
                                                                  textInspectionFieldsRowList =
                                                                  snapshot
                                                                      .data!;

                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final textInspectionFieldsRow =
                                                                  textInspectionFieldsRowList
                                                                          .isNotEmpty
                                                                      ? textInspectionFieldsRowList
                                                                          .first
                                                                      : null;

                                                              return AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model
                                                                      .outputFieldValue
                                                                      ?.where((e) =>
                                                                          (e.fieldId ==
                                                                              textInspectionFieldsRow
                                                                                  ?.fieldId) &&
                                                                          (e.recordId ==
                                                                              executedReportSummaryInfracstructureItem.recordId))
                                                                      .toList()
                                                                      .firstOrNull
                                                                      ?.value,
                                                                  'value',
                                                                ).maybeHandleOverflow(
                                                                  maxChars:
                                                                      1000,
                                                                ),
                                                                minFontSize:
                                                                    10.0,
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
                                                              );
                                                            },
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FutureBuilder<
                                                                  List<
                                                                      InspectionFieldsRow>>(
                                                                future: InspectionFieldsTable()
                                                                    .querySingleRow(
                                                                  queryFn: (q) =>
                                                                      q.eqOrNull(
                                                                    'field_name',
                                                                    'IS THE AVR AVAILABLE AND IN PLACE ?',
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
                                                                        width:
                                                                            10.0,
                                                                        height:
                                                                            10.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            Color(0xFF7C8289),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<InspectionFieldsRow>
                                                                      textInspectionFieldsRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final textInspectionFieldsRow = textInspectionFieldsRowList
                                                                          .isNotEmpty
                                                                      ? textInspectionFieldsRowList
                                                                          .first
                                                                      : null;

                                                                  return AutoSizeText(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      _model
                                                                          .outputFieldValue
                                                                          ?.where((e) =>
                                                                              (e.fieldId == textInspectionFieldsRow?.fieldId) &&
                                                                              (e.recordId == executedReportSummaryInfracstructureItem.recordId))
                                                                          .toList()
                                                                          .firstOrNull
                                                                          ?.value,
                                                                      'value',
                                                                    ).maybeHandleOverflow(
                                                                      maxChars:
                                                                          1000,
                                                                    ),
                                                                    minFontSize:
                                                                        10.0,
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
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          FutureBuilder<
                                                              List<
                                                                  InspectionFieldsRow>>(
                                                            future: InspectionFieldsTable()
                                                                .querySingleRow(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                'field_name',
                                                                'ARE THE AC UNIT IN PLACE ?',
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
                                                                  textInspectionFieldsRowList =
                                                                  snapshot
                                                                      .data!;

                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final textInspectionFieldsRow =
                                                                  textInspectionFieldsRowList
                                                                          .isNotEmpty
                                                                      ? textInspectionFieldsRowList
                                                                          .first
                                                                      : null;

                                                              return AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model
                                                                      .outputFieldValue
                                                                      ?.where((e) =>
                                                                          (e.fieldId ==
                                                                              textInspectionFieldsRow
                                                                                  ?.fieldId) &&
                                                                          (e.recordId ==
                                                                              executedReportSummaryInfracstructureItem.recordId))
                                                                      .toList()
                                                                      .firstOrNull
                                                                      ?.value,
                                                                  'value',
                                                                ).maybeHandleOverflow(
                                                                  maxChars:
                                                                      1000,
                                                                ),
                                                                minFontSize:
                                                                    10.0,
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
                                                              );
                                                            },
                                                          ),
                                                          FutureBuilder<
                                                              List<
                                                                  InspectionFieldsRow>>(
                                                            future: InspectionFieldsTable()
                                                                .querySingleRow(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                'field_name',
                                                                'WHAT IS THE DIESEL LEVEL ?',
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
                                                                  textInspectionFieldsRowList =
                                                                  snapshot
                                                                      .data!;

                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final textInspectionFieldsRow =
                                                                  textInspectionFieldsRowList
                                                                          .isNotEmpty
                                                                      ? textInspectionFieldsRowList
                                                                          .first
                                                                      : null;

                                                              return AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model
                                                                      .outputFieldValue
                                                                      ?.where((e) =>
                                                                          (e.fieldId ==
                                                                              textInspectionFieldsRow
                                                                                  ?.fieldId) &&
                                                                          (e.recordId ==
                                                                              executedReportSummaryInfracstructureItem.recordId))
                                                                      .toList()
                                                                      .firstOrNull
                                                                      ?.value,
                                                                  'value',
                                                                ).maybeHandleOverflow(
                                                                  maxChars:
                                                                      1000,
                                                                ),
                                                                minFontSize:
                                                                    10.0,
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
                                                              );
                                                            },
                                                          ),
                                                          FutureBuilder<
                                                              List<
                                                                  InspectionFieldsRow>>(
                                                            future: InspectionFieldsTable()
                                                                .querySingleRow(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                'field_name',
                                                                'IS THE TRANSFORMER IN PLACE?',
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
                                                                  textInspectionFieldsRowList =
                                                                  snapshot
                                                                      .data!;

                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final textInspectionFieldsRow =
                                                                  textInspectionFieldsRowList
                                                                          .isNotEmpty
                                                                      ? textInspectionFieldsRowList
                                                                          .first
                                                                      : null;

                                                              return AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model
                                                                      .outputFieldValue
                                                                      ?.where((e) =>
                                                                          (e.fieldId ==
                                                                              textInspectionFieldsRow
                                                                                  ?.fieldId) &&
                                                                          (e.recordId ==
                                                                              executedReportSummaryInfracstructureItem.recordId))
                                                                      .toList()
                                                                      .firstOrNull
                                                                      ?.value,
                                                                  'value',
                                                                ).maybeHandleOverflow(
                                                                  maxChars:
                                                                      1000,
                                                                ),
                                                                minFontSize:
                                                                    10.0,
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
                                                              );
                                                            },
                                                          ),
                                                          FutureBuilder<
                                                              List<
                                                                  InspectionFieldsRow>>(
                                                            future: InspectionFieldsTable()
                                                                .querySingleRow(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                'field_name',
                                                                'IS THE THUNDER ARRESTOR IN PLACE?',
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
                                                                  textInspectionFieldsRowList =
                                                                  snapshot
                                                                      .data!;

                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final textInspectionFieldsRow =
                                                                  textInspectionFieldsRowList
                                                                          .isNotEmpty
                                                                      ? textInspectionFieldsRowList
                                                                          .first
                                                                      : null;

                                                              return AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model
                                                                      .outputFieldValue
                                                                      ?.where((e) =>
                                                                          (e.fieldId ==
                                                                              textInspectionFieldsRow
                                                                                  ?.fieldId) &&
                                                                          (e.recordId ==
                                                                              executedReportSummaryInfracstructureItem.recordId))
                                                                      .toList()
                                                                      .firstOrNull
                                                                      ?.value,
                                                                  'value',
                                                                ).maybeHandleOverflow(
                                                                  maxChars:
                                                                      1000,
                                                                ),
                                                                minFontSize:
                                                                    10.0,
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
                                                              );
                                                            },
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      InspectionFieldsRow>>(
                                                                future: InspectionFieldsTable()
                                                                    .querySingleRow(
                                                                  queryFn: (q) => q
                                                                      .eqOrNull(
                                                                        'field_name',
                                                                        'ATTACH PICTURE OF THE GENERATOR BATTERY.',
                                                                      )
                                                                      .eqOrNull(
                                                                        'company_name',
                                                                        FFAppState()
                                                                            .appAuthUserCompanyName,
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
                                                                        width:
                                                                            10.0,
                                                                        height:
                                                                            10.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            Color(0xFF7C8289),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<InspectionFieldsRow>
                                                                      imageInspectionFieldsRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final imageInspectionFieldsRow = imageInspectionFieldsRowList
                                                                          .isNotEmpty
                                                                      ? imageInspectionFieldsRowList
                                                                          .first
                                                                      : null;

                                                                  return InkWell(
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
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: PictureDetailsWidget(
                                                                                imgirl: valueOrDefault<String>(
                                                                                  _model.outputFieldValue?.where((e) => (e.fieldId == imageInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryInfracstructureItem.recordId)).toList().firstOrNull?.value,
                                                                                  'value',
                                                                                ),
                                                                                title: imageInspectionFieldsRow?.fieldName,
                                                                                capturedBy: '${_model.outputUsers?.where((e) => e.userId == executedReportSummaryInfracstructureItem.userId).toList().firstOrNull?.firstName} ${_model.outputUsers?.where((e) => e.userId == executedReportSummaryInfracstructureItem.userId).toList().firstOrNull?.lastName}',
                                                                                location: executedReportSummaryInfracstructureItem.clientName,
                                                                                capturedDate: executedReportSummaryInfracstructureItem.executedDate,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .outputFieldValue
                                                                              ?.where((e) => (e.fieldId == imageInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryInfracstructureItem.recordId))
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.value,
                                                                          'value',
                                                                        ),
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      InspectionFieldsRow>>(
                                                                future: InspectionFieldsTable()
                                                                    .querySingleRow(
                                                                  queryFn: (q) => q
                                                                      .eqOrNull(
                                                                        'field_name',
                                                                        'ATTACH PICTURE OF TRANSFORMER.',
                                                                      )
                                                                      .eqOrNull(
                                                                        'company_name',
                                                                        FFAppState()
                                                                            .appAuthUserCompanyName,
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
                                                                        width:
                                                                            10.0,
                                                                        height:
                                                                            10.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            Color(0xFF7C8289),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<InspectionFieldsRow>
                                                                      imageInspectionFieldsRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final imageInspectionFieldsRow = imageInspectionFieldsRowList
                                                                          .isNotEmpty
                                                                      ? imageInspectionFieldsRowList
                                                                          .first
                                                                      : null;

                                                                  return InkWell(
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
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: PictureDetailsWidget(
                                                                                imgirl: valueOrDefault<String>(
                                                                                  _model.outputFieldValue?.where((e) => (e.fieldId == imageInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryInfracstructureItem.recordId)).toList().firstOrNull?.value,
                                                                                  'value',
                                                                                ),
                                                                                title: imageInspectionFieldsRow?.fieldName,
                                                                                capturedBy: '${_model.outputUsers?.where((e) => e.userId == executedReportSummaryInfracstructureItem.userId).toList().firstOrNull?.firstName} ${_model.outputUsers?.where((e) => e.userId == executedReportSummaryInfracstructureItem.userId).toList().firstOrNull?.lastName}',
                                                                                location: executedReportSummaryInfracstructureItem.clientName,
                                                                                capturedDate: executedReportSummaryInfracstructureItem.executedDate,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .outputFieldValue
                                                                              ?.where((e) => (e.fieldId == imageInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryInfracstructureItem.recordId))
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.value,
                                                                          'value',
                                                                        ),
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      InspectionFieldsRow>>(
                                                                future: InspectionFieldsTable()
                                                                    .querySingleRow(
                                                                  queryFn: (q) => q
                                                                      .eqOrNull(
                                                                        'field_name',
                                                                        'ATTACH PICTURE OF AMOURED CABLE.',
                                                                      )
                                                                      .eqOrNull(
                                                                        'company_name',
                                                                        FFAppState()
                                                                            .appAuthUserCompanyName,
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
                                                                        width:
                                                                            10.0,
                                                                        height:
                                                                            10.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            Color(0xFF7C8289),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<InspectionFieldsRow>
                                                                      imageInspectionFieldsRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final imageInspectionFieldsRow = imageInspectionFieldsRowList
                                                                          .isNotEmpty
                                                                      ? imageInspectionFieldsRowList
                                                                          .first
                                                                      : null;

                                                                  return InkWell(
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
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: PictureDetailsWidget(
                                                                                imgirl: valueOrDefault<String>(
                                                                                  _model.outputFieldValue?.where((e) => (e.fieldId == imageInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryInfracstructureItem.recordId)).toList().firstOrNull?.value,
                                                                                  'value',
                                                                                ),
                                                                                title: imageInspectionFieldsRow?.fieldName,
                                                                                capturedBy: '${_model.outputUsers?.where((e) => e.userId == executedReportSummaryInfracstructureItem.userId).toList().firstOrNull?.firstName} ${_model.outputUsers?.where((e) => e.userId == executedReportSummaryInfracstructureItem.userId).toList().firstOrNull?.lastName}',
                                                                                location: executedReportSummaryInfracstructureItem.clientName,
                                                                                capturedDate: executedReportSummaryInfracstructureItem.executedDate,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .outputFieldValue
                                                                              ?.where((e) => (e.fieldId == imageInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryInfracstructureItem.recordId))
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.value,
                                                                          'value',
                                                                        ),
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      InspectionFieldsRow>>(
                                                                future: InspectionFieldsTable()
                                                                    .querySingleRow(
                                                                  queryFn: (q) => q
                                                                      .eqOrNull(
                                                                        'field_name',
                                                                        'ATTACH PICTURE OF THE AC UNIT.',
                                                                      )
                                                                      .eqOrNull(
                                                                        'company_name',
                                                                        FFAppState()
                                                                            .appAuthUserCompanyName,
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
                                                                        width:
                                                                            10.0,
                                                                        height:
                                                                            10.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            Color(0xFF7C8289),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<InspectionFieldsRow>
                                                                      imageInspectionFieldsRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final imageInspectionFieldsRow = imageInspectionFieldsRowList
                                                                          .isNotEmpty
                                                                      ? imageInspectionFieldsRowList
                                                                          .first
                                                                      : null;

                                                                  return InkWell(
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
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: PictureDetailsWidget(
                                                                                imgirl: valueOrDefault<String>(
                                                                                  _model.outputFieldValue?.where((e) => (e.fieldId == imageInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryInfracstructureItem.recordId)).toList().firstOrNull?.value,
                                                                                  'value',
                                                                                ),
                                                                                title: imageInspectionFieldsRow?.fieldName,
                                                                                capturedBy: '${_model.outputUsers?.where((e) => e.userId == executedReportSummaryInfracstructureItem.userId).toList().firstOrNull?.firstName} ${_model.outputUsers?.where((e) => e.userId == executedReportSummaryInfracstructureItem.userId).toList().firstOrNull?.lastName}',
                                                                                location: executedReportSummaryInfracstructureItem.clientName,
                                                                                capturedDate: executedReportSummaryInfracstructureItem.executedDate,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .outputFieldValue
                                                                              ?.where((e) => (e.fieldId == imageInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryInfracstructureItem.recordId))
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.value,
                                                                          'value',
                                                                        ),
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      InspectionFieldsRow>>(
                                                                future: InspectionFieldsTable()
                                                                    .querySingleRow(
                                                                  queryFn: (q) => q
                                                                      .eqOrNull(
                                                                        'field_name',
                                                                        'ATTACH PICTURE OF DIESEL GUAGE.',
                                                                      )
                                                                      .eqOrNull(
                                                                        'company_name',
                                                                        FFAppState()
                                                                            .appAuthUserCompanyName,
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
                                                                        width:
                                                                            10.0,
                                                                        height:
                                                                            10.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            Color(0xFF7C8289),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<InspectionFieldsRow>
                                                                      imageInspectionFieldsRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final imageInspectionFieldsRow = imageInspectionFieldsRowList
                                                                          .isNotEmpty
                                                                      ? imageInspectionFieldsRowList
                                                                          .first
                                                                      : null;

                                                                  return InkWell(
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
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: PictureDetailsWidget(
                                                                                imgirl: valueOrDefault<String>(
                                                                                  _model.outputFieldValue?.where((e) => (e.fieldId == imageInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryInfracstructureItem.recordId)).toList().firstOrNull?.value,
                                                                                  'value',
                                                                                ),
                                                                                title: imageInspectionFieldsRow?.fieldName,
                                                                                capturedBy: '${_model.outputUsers?.where((e) => e.userId == executedReportSummaryInfracstructureItem.userId).toList().firstOrNull?.firstName} ${_model.outputUsers?.where((e) => e.userId == executedReportSummaryInfracstructureItem.userId).toList().firstOrNull?.lastName}',
                                                                                location: executedReportSummaryInfracstructureItem.clientName,
                                                                                capturedDate: executedReportSummaryInfracstructureItem.executedDate,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .outputFieldValue
                                                                              ?.where((e) => (e.fieldId == imageInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryInfracstructureItem.recordId))
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.value,
                                                                          'value',
                                                                        ),
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      InspectionFieldsRow>>(
                                                                future: InspectionFieldsTable()
                                                                    .querySingleRow(
                                                                  queryFn: (q) => q
                                                                      .eqOrNull(
                                                                        'field_name',
                                                                        'ATTACH PICTURE OF THUNDER ARRESTOR.',
                                                                      )
                                                                      .eqOrNull(
                                                                        'company_name',
                                                                        FFAppState()
                                                                            .appAuthUserCompanyName,
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
                                                                        width:
                                                                            10.0,
                                                                        height:
                                                                            10.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            Color(0xFF7C8289),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<InspectionFieldsRow>
                                                                      imageInspectionFieldsRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final imageInspectionFieldsRow = imageInspectionFieldsRowList
                                                                          .isNotEmpty
                                                                      ? imageInspectionFieldsRowList
                                                                          .first
                                                                      : null;

                                                                  return InkWell(
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
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: PictureDetailsWidget(
                                                                                imgirl: valueOrDefault<String>(
                                                                                  _model.outputFieldValue?.where((e) => (e.fieldId == imageInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryInfracstructureItem.recordId)).toList().firstOrNull?.value,
                                                                                  'value',
                                                                                ),
                                                                                title: imageInspectionFieldsRow?.fieldName,
                                                                                capturedBy: '${_model.outputUsers?.where((e) => e.userId == executedReportSummaryInfracstructureItem.userId).toList().firstOrNull?.firstName} ${_model.outputUsers?.where((e) => e.userId == executedReportSummaryInfracstructureItem.userId).toList().firstOrNull?.lastName}',
                                                                                location: executedReportSummaryInfracstructureItem.clientName,
                                                                                capturedDate: executedReportSummaryInfracstructureItem.executedDate,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .outputFieldValue
                                                                              ?.where((e) => (e.fieldId == imageInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryInfracstructureItem.recordId))
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.value,
                                                                          'value',
                                                                        ),
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      InspectionFieldsRow>>(
                                                                future: InspectionFieldsTable()
                                                                    .querySingleRow(
                                                                  queryFn: (q) => q
                                                                      .eqOrNull(
                                                                        'field_name',
                                                                        'ATTACH PICTURE OF THE AVR.',
                                                                      )
                                                                      .eqOrNull(
                                                                        'company_name',
                                                                        FFAppState()
                                                                            .appAuthUserCompanyName,
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
                                                                        width:
                                                                            10.0,
                                                                        height:
                                                                            10.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            Color(0xFF7C8289),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<InspectionFieldsRow>
                                                                      imageInspectionFieldsRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final imageInspectionFieldsRow = imageInspectionFieldsRowList
                                                                          .isNotEmpty
                                                                      ? imageInspectionFieldsRowList
                                                                          .first
                                                                      : null;

                                                                  return InkWell(
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
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        useSafeArea:
                                                                            true,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: PictureDetailsWidget(
                                                                                imgirl: valueOrDefault<String>(
                                                                                  _model.outputFieldValue?.where((e) => (e.fieldId == imageInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryInfracstructureItem.recordId)).toList().firstOrNull?.value,
                                                                                  'value',
                                                                                ),
                                                                                title: imageInspectionFieldsRow?.fieldName,
                                                                                capturedBy: '${_model.outputUsers?.where((e) => e.userId == executedReportSummaryInfracstructureItem.userId).toList().firstOrNull?.firstName} ${_model.outputUsers?.where((e) => e.userId == executedReportSummaryInfracstructureItem.userId).toList().firstOrNull?.lastName}',
                                                                                location: executedReportSummaryInfracstructureItem.clientName,
                                                                                capturedDate: executedReportSummaryInfracstructureItem.executedDate,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .outputFieldValue
                                                                              ?.where((e) => (e.fieldId == imageInspectionFieldsRow?.fieldId) && (e.recordId == executedReportSummaryInfracstructureItem.recordId))
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.value,
                                                                          'value',
                                                                        ),
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    dateTimeFormat(
                                                                            "d/M/y",
                                                                            executedReportSummaryInfracstructureItem.executedDate!)
                                                                        .maybeHandleOverflow(
                                                                      maxChars:
                                                                          1000,
                                                                    ),
                                                                    minFontSize:
                                                                        10.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: FutureBuilder<
                                                                    List<
                                                                        InspectionFieldsRow>>(
                                                                  future: InspectionFieldsTable()
                                                                      .querySingleRow(
                                                                    queryFn: (q) =>
                                                                        q.eqOrNull(
                                                                      'field_name',
                                                                      'REMARK',
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
                                                                          width:
                                                                              10.0,
                                                                          height:
                                                                              10.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              Color(0xFF7C8289),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<InspectionFieldsRow>
                                                                        textInspectionFieldsRowList =
                                                                        snapshot
                                                                            .data!;

                                                                    // Return an empty Container when the item does not exist.
                                                                    if (snapshot
                                                                        .data!
                                                                        .isEmpty) {
                                                                      return Container();
                                                                    }
                                                                    final textInspectionFieldsRow = textInspectionFieldsRowList
                                                                            .isNotEmpty
                                                                        ? textInspectionFieldsRowList
                                                                            .first
                                                                        : null;

                                                                    return AutoSizeText(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        _model
                                                                            .outputFieldValue
                                                                            ?.where((e) =>
                                                                                (e.fieldId == textInspectionFieldsRow?.fieldId) &&
                                                                                (e.recordId == executedReportSummaryInfracstructureItem.recordId))
                                                                            .toList()
                                                                            .firstOrNull
                                                                            ?.value,
                                                                        'value',
                                                                      ).maybeHandleOverflow(
                                                                        maxChars:
                                                                            1000,
                                                                      ),
                                                                      minFontSize:
                                                                          10.0,
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
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ]
                                                            .map((c) =>
                                                                DataCell(c))
                                                            .toList(),
                                                      ),
                                                      paginated: true,
                                                      selectable: false,
                                                      hidePaginator: false,
                                                      showFirstLastButtons:
                                                          true,
                                                      headingRowHeight: 100.0,
                                                      dataRowHeight: 150.0,
                                                      columnSpacing: 20.0,
                                                      headingRowColor:
                                                          Color(0xFF09245E),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      addHorizontalDivider:
                                                          true,
                                                      addTopAndBottomDivider:
                                                          true,
                                                      hideDefaultHorizontalDivider:
                                                          true,
                                                      horizontalDividerColor:
                                                          Color(0xFF091635),
                                                      horizontalDividerThickness:
                                                          0.5,
                                                      addVerticalDivider: true,
                                                      verticalDividerColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      verticalDividerThickness:
                                                          1.0,
                                                    );
                                                  },
                                                ),
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
                      ),
                    ],
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
}
