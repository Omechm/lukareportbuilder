import '/backend/supabase/supabase.dart';
import '/components/loading_comp_widget.dart';
import '/components/no_data_widget.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'reports_model.dart';
export 'reports_model.dart';

class ReportsWidget extends StatefulWidget {
  const ReportsWidget({
    super.key,
    int? pageNumber,
  }) : this.pageNumber = pageNumber ?? 3;

  final int pageNumber;

  static String routeName = 'reports';
  static String routePath = '/reports';

  @override
  State<ReportsWidget> createState() => _ReportsWidgetState();
}

class _ReportsWidgetState extends State<ReportsWidget> {
  late ReportsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().appIsLoadingData = true;
      safeSetState(() {});
      safeSetState(() {
        _model.textController?.clear();
      });
      _model.pageDataIterator = 0;
      _model.executedReportsUnfiltered = [];
      _model.executedReportsfiltered = [];
      safeSetState(() {});
      _model.outputExecutedReport = await ExecutedTaskNameTable().queryRows(
        queryFn: (q) => q,
      );
      _model.executedReportsUnfiltered = _model.outputExecutedReport!
          .sortedList(keyOf: (e) => e.id, desc: true)
          .unique((e) => e.composeKey!)
          .toList()
          .cast<ExecutedTaskNameRow>();
      safeSetState(() {});
      FFAppState().appIsLoadingData = false;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        title: 'reports',
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
              child: Stack(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      Flexible(
                        child: Stack(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Padding(
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
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Submitted Reports',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Geist Font Family',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                      Text(
                                                        'All submitted reports',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Geist Font Family',
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  50.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                              PlannedreporttaskWidget
                                                                  .routeName);
                                                        },
                                                        text:
                                                            'View all planned task',
                                                        icon: Icon(
                                                          Icons.remove_red_eye,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 24.0,
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
                                                          color:
                                                              Color(0xFFEFEEEE),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  50.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                              ReportplannerCopyWidget
                                                                  .routeName);
                                                        },
                                                        text: 'Plan new task',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 24.0,
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
                                                              .success,
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
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: 300.0,
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController',
                                                Duration(milliseconds: 5000),
                                                () => safeSetState(() {}),
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Geist Font Family',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                hintText:
                                                    'Search by report name',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Geist Font Family',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                suffixIcon: _model
                                                        .textController!
                                                        .text
                                                        .isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          _model.textController
                                                              ?.clear();
                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          size: 14.0,
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Geist Font Family',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Date :',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Geist Font Family',
                                                          color:
                                                              Color(0xFF033395),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        14.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 148.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                                "d/M/y",
                                                                _model
                                                                    .dateFrom),
                                                            'Pick a date',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
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
                                                        onTap: () async {
                                                          _model.dateFromVisi =
                                                              !_model
                                                                  .dateFromVisi;
                                                          _model.dateToVisi =
                                                              false;
                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.calendar_month,
                                                          color:
                                                              Color(0xFF033395),
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              safeSetState(() {
                                                _model.simpleSearchResults =
                                                    TextSearch(_model
                                                            .executedReportsUnfiltered
                                                            .map((e) =>
                                                                valueOrDefault<
                                                                    String>(
                                                                  e.taskName,
                                                                  'null',
                                                                ))
                                                            .toList()
                                                            .map((str) =>
                                                                TextSearchItem
                                                                    .fromTerms(
                                                                        str,
                                                                        [str]))
                                                            .toList())
                                                        .search(_model
                                                            .textController
                                                            .text)
                                                        .map((r) => r.object)
                                                        .toList();
                                                ;
                                              });
                                              _model.executedReportsfiltered =
                                                  [];
                                              safeSetState(() {});
                                              _model.executedReportsfiltered =
                                                  _model
                                                      .executedReportsUnfiltered
                                                      .where((e) =>
                                                          e.taskName ==
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .simpleSearchResults
                                                                .firstOrNull,
                                                            'null',
                                                          ))
                                                      .toList()
                                                      .cast<
                                                          ExecutedTaskNameRow>();
                                              safeSetState(() {});
                                              _model.pageRefresh = null;
                                              safeSetState(() {});
                                            },
                                            text: 'Search',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFF033395),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.executedReportsfiltered =
                                                  [];
                                              _model.dateFrom = null;
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model.textController?.clear();
                                              });
                                            },
                                            child: Text(
                                              'Clear all filter',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Geist Font Family',
                                                        color:
                                                            Color(0xFF033395),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 0.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 4.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.77,
                                          constraints: BoxConstraints(
                                            maxHeight:
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    1.0,
                                          ),
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
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 30.0, 16.0, 16.0),
                                            child: Builder(
                                              builder: (context) {
                                                final reports = _model
                                                        .executedReportsfiltered
                                                        .isNotEmpty
                                                    ? _model
                                                        .executedReportsfiltered
                                                    : _model
                                                        .executedReportsUnfiltered
                                                        .where((e) => dateTimeFormat(
                                                                        "d/M/y",
                                                                        _model
                                                                            .dateFrom) !=
                                                                    ''
                                                            ? (dateTimeFormat(
                                                                    "d/M/y",
                                                                    e
                                                                        .executedDate) ==
                                                                valueOrDefault<
                                                                    String>(
                                                                  dateTimeFormat(
                                                                      "d/M/y",
                                                                      _model
                                                                          .dateFrom),
                                                                  'null',
                                                                ))
                                                            : true)
                                                        .toList();
                                                if (reports.isEmpty) {
                                                  return NoDataWidget();
                                                }

                                                return FlutterFlowDataTable<
                                                    ExecutedTaskNameRow>(
                                                  controller: _model
                                                      .paginatedDataTableController,
                                                  data: reports,
                                                  columnsBuilder:
                                                      (onSortChanged) => [
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          'Report Name',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          'Supervisor Name',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          'Client',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          'Location',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          'Report Date',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          'Action',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  dataRowBuilder: (reportsItem,
                                                          reportsIndex,
                                                          selected,
                                                          onSelectChanged) =>
                                                      DataRow(
                                                    color: WidgetStateProperty
                                                        .all(
                                                      reportsIndex % 2 == 0
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground
                                                          : Color(0x0D105DFB),
                                                    ),
                                                    cells: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          reportsItem.taskName,
                                                          'null',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Geist Font Family',
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          reportsItem
                                                              .supervisor,
                                                          'null',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Geist Font Family',
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          reportsItem
                                                              .clientName,
                                                          'null',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Geist Font Family',
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          reportsItem
                                                              .clientAddress,
                                                          'null',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Geist Font Family',
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                              "d/M/y",
                                                              reportsItem
                                                                  .executedDate),
                                                          'null',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Geist Font Family',
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      20.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  fillColor: Color(
                                                                      0xFFE3F2FD),
                                                                  icon: Icon(
                                                                    Icons
                                                                        .remove_red_eye,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 15.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      DetailspageWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'reportId':
                                                                            serializeParam(
                                                                          reportsItem
                                                                              .recordId,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ]
                                                        .map((c) => DataCell(c))
                                                        .toList(),
                                                  ),
                                                  emptyBuilder: () =>
                                                      NoDataWidget(),
                                                  paginated: true,
                                                  selectable: false,
                                                  hidePaginator: false,
                                                  showFirstLastButtons: true,
                                                  headingRowHeight: 40.0,
                                                  dataRowHeight: 40.0,
                                                  columnSpacing: 20.0,
                                                  headingRowColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  addHorizontalDivider: true,
                                                  addTopAndBottomDivider: true,
                                                  hideDefaultHorizontalDivider:
                                                      false,
                                                  horizontalDividerColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  horizontalDividerThickness:
                                                      1.0,
                                                  addVerticalDivider: true,
                                                  verticalDividerColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  verticalDividerThickness: 1.0,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (_model.dateFromVisi)
                    Align(
                      alignment: AlignmentDirectional(0.17, -0.45),
                      child: Container(
                        width: 300.0,
                        height: 423.0,
                        decoration: BoxDecoration(
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
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 40.0),
                                child: FlutterFlowCalendar(
                                  color: FlutterFlowTheme.of(context).primary,
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  weekFormat: false,
                                  weekStartsMonday: false,
                                  rowHeight: 48.0,
                                  onChange: (DateTimeRange? newSelectedDate) {
                                    safeSetState(() =>
                                        _model.calendarSelectedDay1 =
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      _model.dateFrom =
                                          _model.calendarSelectedDay1?.start;
                                      _model.dateFromVisi = false;
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
                  if (_model.dateToVisi)
                    Align(
                      alignment: AlignmentDirectional(0.54, -0.44),
                      child: Container(
                        width: 300.0,
                        height: 423.0,
                        decoration: BoxDecoration(
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
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 40.0),
                                child: FlutterFlowCalendar(
                                  color: FlutterFlowTheme.of(context).primary,
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  weekFormat: false,
                                  weekStartsMonday: false,
                                  rowHeight: 48.0,
                                  onChange: (DateTimeRange? newSelectedDate) {
                                    safeSetState(() =>
                                        _model.calendarSelectedDay2 =
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      _model.dateTo =
                                          _model.calendarSelectedDay2?.end;
                                      _model.dateToVisi = false;
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
