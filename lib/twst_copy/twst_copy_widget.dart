import '/backend/supabase/supabase.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'twst_copy_model.dart';
export 'twst_copy_model.dart';

class TwstCopyWidget extends StatefulWidget {
  const TwstCopyWidget({
    super.key,
    int? pageNumber,
  }) : this.pageNumber = pageNumber ?? 1;

  final int pageNumber;

  static String routeName = 'twstCopy';
  static String routePath = '/twstCopy';

  @override
  State<TwstCopyWidget> createState() => _TwstCopyWidgetState();
}

class _TwstCopyWidgetState extends State<TwstCopyWidget>
    with TickerProviderStateMixin {
  late TwstCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TwstCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.outputPlan = await PlannedTaskTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_name',
          FFAppState().appAuthUserCompanyName,
        ),
      );
      _model.currentWeekNumber = await actions.getCurrentWeekNumber();
      _model.outputCurrentDate = await actions.getCurrentDate();
      _model.outputExecution = await ExecutedTaskNameTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'week_no',
              _model.currentWeekNumber,
            )
            .eqOrNull(
              'company_name',
              FFAppState().appAuthUserCompanyName,
            ),
      );
      _model.outputUserClientAssignmnet =
          await UserClientAssignmentsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_name',
          FFAppState().appAuthUserCompanyName,
        ),
      );
      _model.outputUsers = await UserTable().queryRows(
        queryFn: (q) => q
            .neqOrNull(
              'user_role',
              'Admin',
            )
            .eqOrNull(
              'company_name',
              FFAppState().appAuthUserCompanyName,
            ),
      );
      _model.pagePlan = _model.outputPlan!.toList().cast<PlannedTaskRow>();
      _model.pageExecution =
          _model.outputExecution!.toList().cast<ExecutedTaskNameRow>();
      _model.pageCompliantSupervisors = _model.outputExecution!
          .unique((e) => e.compKey2!)
          .unique((e) => e)
          .map((e) => e.userId)
          .withoutNulls
          .toList()
          .toList()
          .cast<String>();
      _model.pageCompliantTask = _model.outputExecution!
          .map((e) => e.compKey2)
          .withoutNulls
          .toList()
          .unique((e) => e)
          .toList()
          .cast<String>();
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
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
        title: 'twstCopy',
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
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
                      pageNumber: 1,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'User Report Execution',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Geist Font Family',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      '',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Geist Font Family',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 8.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(0.0, 0),
                                  child: FlutterFlowButtonTabBar(
                                    useToggleButtonStyle: false,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Geist Font Family',
                                          letterSpacing: 0.0,
                                        ),
                                    unselectedLabelStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Geist Font Family',
                                              letterSpacing: 0.0,
                                            ),
                                    labelColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    backgroundColor: Color(0xFF072C73),
                                    unselectedBackgroundColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    unselectedBorderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    elevation: 0.0,
                                    buttonMargin:
                                        EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                    tabs: [
                                      Tab(
                                        text: 'Daily Execution Progress',
                                      ),
                                      Tab(
                                        text: 'Week Execution Progress',
                                      ),
                                      Tab(
                                        text: 'Tab 3',
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [
                                        () async {},
                                        () async {},
                                        () async {}
                                      ][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.77,
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
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FutureBuilder<List<UserRow>>(
                                                    future:
                                                        UserTable().queryRows(
                                                      queryFn: (q) =>
                                                          q.eqOrNull(
                                                        'company_name',
                                                        FFAppState()
                                                            .appAuthUserCompanyName,
                                                      ),
                                                    ),
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
                                                      List<UserRow>
                                                          listViewUserRowList =
                                                          snapshot.data!;

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewUserRowList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewUserRow =
                                                              listViewUserRowList[
                                                                  listViewIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        1.0,
                                                                        12.0,
                                                                        1.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            12.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          300.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    (String var1, String var2) {
                                                                                      return "${var1.substring(0, 1)}${var2.substring(0, 1)}";
                                                                                    }(listViewUserRow.firstName!, listViewUserRow.lastName!),
                                                                                    'null',
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Geist Font Family',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      listViewUserRow.firstName,
                                                                                      'null',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                          fontFamily: 'Geist Font Family',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        listViewUserRow.lastName,
                                                                                        'null',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: 'Geist Font Family',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  listViewUserRow.phone,
                                                                                  'null',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Geist Font Family',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(width: 16.0)),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Daily Job Execution Progress :',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            LinearPercentIndicator(
                                                                              percent: valueOrDefault<double>(
                                                                                () {
                                                                                  if (valueOrDefault<double>(
                                                                                        valueOrDefault<double>(
                                                                                              _model.outputExecution?.where((e) => (e.userId == listViewUserRow.userId) && (e.executedDate == _model.outputCurrentDate)).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toDouble(),
                                                                                              0.0,
                                                                                            ) /
                                                                                            valueOrDefault<double>(
                                                                                              _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toDouble(),
                                                                                              0.0,
                                                                                            ),
                                                                                        0.0,
                                                                                      ) >
                                                                                      1.0) {
                                                                                    return 1.0;
                                                                                  } else if ((valueOrDefault<double>(
                                                                                            valueOrDefault<double>(
                                                                                                  _model.outputExecution?.where((e) => (e.userId == listViewUserRow.userId) && (e.executedDate == _model.outputCurrentDate)).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toDouble(),
                                                                                                  0.0,
                                                                                                ) /
                                                                                                valueOrDefault<double>(
                                                                                                  _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toDouble(),
                                                                                                  0.0,
                                                                                                ),
                                                                                            0.0,
                                                                                          ) ==
                                                                                          null) ||
                                                                                      (valueOrDefault<double>(
                                                                                            valueOrDefault<double>(
                                                                                                  _model.outputExecution?.where((e) => (e.userId == listViewUserRow.userId) && (e.executedDate == _model.outputCurrentDate)).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toDouble(),
                                                                                                  0.0,
                                                                                                ) /
                                                                                                valueOrDefault<double>(
                                                                                                  _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toDouble(),
                                                                                                  0.0,
                                                                                                ),
                                                                                            0.0,
                                                                                          ) ==
                                                                                          0.0)) {
                                                                                    return 0.0;
                                                                                  } else {
                                                                                    return valueOrDefault<double>(
                                                                                      valueOrDefault<double>(
                                                                                            _model.outputExecution?.where((e) => (e.userId == listViewUserRow.userId) && (e.executedDate == _model.outputCurrentDate)).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toDouble(),
                                                                                            0.0,
                                                                                          ) /
                                                                                          valueOrDefault<double>(
                                                                                            _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toDouble(),
                                                                                            0.0,
                                                                                          ),
                                                                                      0.0,
                                                                                    );
                                                                                  }
                                                                                }(),
                                                                                0.0,
                                                                              ),
                                                                              width: 400.0,
                                                                              lineHeight: 20.0,
                                                                              animation: true,
                                                                              animateFromLastPercent: true,
                                                                              progressColor: Color(0xFF269D0C),
                                                                              backgroundColor: Color(0xC8EF3131),
                                                                              center: Text(
                                                                                valueOrDefault<String>(
                                                                                  formatNumber(
                                                                                    () {
                                                                                      if (valueOrDefault<double>(
                                                                                            valueOrDefault<double>(
                                                                                                  _model.outputExecution?.where((e) => (e.userId == listViewUserRow.userId) && (e.executedDate == _model.outputCurrentDate)).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toDouble(),
                                                                                                  0.0,
                                                                                                ) /
                                                                                                valueOrDefault<double>(
                                                                                                  _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toDouble(),
                                                                                                  0.0,
                                                                                                ),
                                                                                            0.0,
                                                                                          ) >
                                                                                          1.0) {
                                                                                        return 1.0;
                                                                                      } else if ((valueOrDefault<double>(
                                                                                                valueOrDefault<double>(
                                                                                                      _model.outputExecution?.where((e) => (e.userId == listViewUserRow.userId) && (e.executedDate == _model.outputCurrentDate)).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toDouble(),
                                                                                                      0.0,
                                                                                                    ) /
                                                                                                    valueOrDefault<double>(
                                                                                                      _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toDouble(),
                                                                                                      0.0,
                                                                                                    ),
                                                                                                0.0,
                                                                                              ) ==
                                                                                              null) ||
                                                                                          (valueOrDefault<double>(
                                                                                                valueOrDefault<double>(
                                                                                                      _model.outputExecution?.where((e) => (e.userId == listViewUserRow.userId) && (e.executedDate == _model.outputCurrentDate)).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toDouble(),
                                                                                                      0.0,
                                                                                                    ) /
                                                                                                    valueOrDefault<double>(
                                                                                                      _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toDouble(),
                                                                                                      0.0,
                                                                                                    ),
                                                                                                0.0,
                                                                                              ) ==
                                                                                              0.0)) {
                                                                                        return 0.0;
                                                                                      } else {
                                                                                        return valueOrDefault<double>(
                                                                                          valueOrDefault<double>(
                                                                                                _model.outputExecution?.where((e) => (e.userId == listViewUserRow.userId) && (e.executedDate == _model.outputCurrentDate)).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toDouble(),
                                                                                                0.0,
                                                                                              ) /
                                                                                              valueOrDefault<double>(
                                                                                                _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toDouble(),
                                                                                                0.0,
                                                                                              ),
                                                                                          0.0,
                                                                                        );
                                                                                      }
                                                                                    }(),
                                                                                    formatType: FormatType.percent,
                                                                                  ),
                                                                                  '0',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                      fontFamily: 'Geist Font Family',
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              padding: EdgeInsets.zero,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      _model.outputExecution?.where((e) => (e.userId == listViewUserRow.userId) && (e.executedDate == _model.outputCurrentDate)).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Geist Font Family',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    ' / ',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Geist Font Family',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  FutureBuilder<List<UserClientAssignmentsRow>>(
                                                                                    future: UserClientAssignmentsTable().queryRows(
                                                                                      queryFn: (q) => q.eqOrNull(
                                                                                        'user_id',
                                                                                        listViewUserRow.userId,
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
                                                                                      List<UserClientAssignmentsRow> textUserClientAssignmentsRowList = snapshot.data!;

                                                                                      return Text(
                                                                                        valueOrDefault<String>(
                                                                                          _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toString(),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Geist Font Family',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      );
                                                                                    },
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
                                                              ),
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
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
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
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FutureBuilder<List<UserRow>>(
                                                    future:
                                                        UserTable().queryRows(
                                                      queryFn: (q) =>
                                                          q.eqOrNull(
                                                        'company_name',
                                                        FFAppState()
                                                            .appAuthUserCompanyName,
                                                      ),
                                                    ),
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
                                                      List<UserRow>
                                                          listViewUserRowList =
                                                          snapshot.data!;

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewUserRowList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewUserRow =
                                                              listViewUserRowList[
                                                                  listViewIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        1.0,
                                                                        12.0,
                                                                        1.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            12.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          300.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    (String var1, String var2) {
                                                                                      return "${var1.substring(0, 1)}${var2.substring(0, 1)}";
                                                                                    }(listViewUserRow.firstName!, listViewUserRow.lastName!),
                                                                                    'null',
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Geist Font Family',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      listViewUserRow.firstName,
                                                                                      'null',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                          fontFamily: 'Geist Font Family',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        listViewUserRow.lastName,
                                                                                        'null',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: 'Geist Font Family',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  listViewUserRow.phone,
                                                                                  'null',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Geist Font Family',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(width: 16.0)),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Weekly Job Execution Progress :',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            LinearPercentIndicator(
                                                                              percent: valueOrDefault<double>(
                                                                                () {
                                                                                  if (valueOrDefault<double>(
                                                                                        valueOrDefault<double>(
                                                                                              _model.outputExecution?.where((e) => e.userId == listViewUserRow.userId).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toDouble(),
                                                                                              0.0,
                                                                                            ) /
                                                                                            (valueOrDefault<double>(
                                                                                                  _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toDouble(),
                                                                                                  0.0,
                                                                                                ) *
                                                                                                7),
                                                                                        0.0,
                                                                                      ) >
                                                                                      1.0) {
                                                                                    return 1.0;
                                                                                  } else if ((valueOrDefault<double>(
                                                                                            valueOrDefault<double>(
                                                                                                  _model.outputExecution?.where((e) => e.userId == listViewUserRow.userId).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toDouble(),
                                                                                                  0.0,
                                                                                                ) /
                                                                                                (valueOrDefault<double>(
                                                                                                      _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toDouble(),
                                                                                                      0.0,
                                                                                                    ) *
                                                                                                    7),
                                                                                            0.0,
                                                                                          ) ==
                                                                                          null) ||
                                                                                      (valueOrDefault<double>(
                                                                                            valueOrDefault<double>(
                                                                                                  _model.outputExecution?.where((e) => e.userId == listViewUserRow.userId).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toDouble(),
                                                                                                  0.0,
                                                                                                ) /
                                                                                                (valueOrDefault<double>(
                                                                                                      _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toDouble(),
                                                                                                      0.0,
                                                                                                    ) *
                                                                                                    7),
                                                                                            0.0,
                                                                                          ) ==
                                                                                          0.0)) {
                                                                                    return 0.0;
                                                                                  } else {
                                                                                    return valueOrDefault<double>(
                                                                                      valueOrDefault<double>(
                                                                                            _model.outputExecution?.where((e) => e.userId == listViewUserRow.userId).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toDouble(),
                                                                                            0.0,
                                                                                          ) /
                                                                                          (valueOrDefault<double>(
                                                                                                _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toDouble(),
                                                                                                0.0,
                                                                                              ) *
                                                                                              7),
                                                                                      0.0,
                                                                                    );
                                                                                  }
                                                                                }(),
                                                                                0.0,
                                                                              ),
                                                                              width: 400.0,
                                                                              lineHeight: 20.0,
                                                                              animation: true,
                                                                              animateFromLastPercent: true,
                                                                              progressColor: Color(0xFF269D0C),
                                                                              backgroundColor: Color(0xFFEF3131),
                                                                              center: Text(
                                                                                valueOrDefault<String>(
                                                                                  formatNumber(
                                                                                    () {
                                                                                      if (valueOrDefault<double>(
                                                                                            valueOrDefault<double>(
                                                                                                  _model.outputExecution?.where((e) => e.userId == listViewUserRow.userId).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toDouble(),
                                                                                                  0.0,
                                                                                                ) /
                                                                                                (valueOrDefault<double>(
                                                                                                      _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toDouble(),
                                                                                                      0.0,
                                                                                                    ) *
                                                                                                    7),
                                                                                            0.0,
                                                                                          ) >
                                                                                          1.0) {
                                                                                        return 1.0;
                                                                                      } else if ((valueOrDefault<double>(
                                                                                                valueOrDefault<double>(
                                                                                                      _model.outputExecution?.where((e) => e.userId == listViewUserRow.userId).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toDouble(),
                                                                                                      0.0,
                                                                                                    ) /
                                                                                                    (valueOrDefault<double>(
                                                                                                          _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toDouble(),
                                                                                                          0.0,
                                                                                                        ) *
                                                                                                        7),
                                                                                                0.0,
                                                                                              ) ==
                                                                                              null) ||
                                                                                          (valueOrDefault<double>(
                                                                                                valueOrDefault<double>(
                                                                                                      _model.outputExecution?.where((e) => e.userId == listViewUserRow.userId).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toDouble(),
                                                                                                      0.0,
                                                                                                    ) /
                                                                                                    (valueOrDefault<double>(
                                                                                                          _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toDouble(),
                                                                                                          0.0,
                                                                                                        ) *
                                                                                                        7),
                                                                                                0.0,
                                                                                              ) ==
                                                                                              0.0)) {
                                                                                        return 0.0;
                                                                                      } else {
                                                                                        return valueOrDefault<double>(
                                                                                          valueOrDefault<double>(
                                                                                                _model.outputExecution?.where((e) => e.userId == listViewUserRow.userId).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toDouble(),
                                                                                                0.0,
                                                                                              ) /
                                                                                              (valueOrDefault<double>(
                                                                                                    _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length.toDouble(),
                                                                                                    0.0,
                                                                                                  ) *
                                                                                                  7),
                                                                                          0.0,
                                                                                        );
                                                                                      }
                                                                                    }(),
                                                                                    formatType: FormatType.percent,
                                                                                  ),
                                                                                  '0',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                      fontFamily: 'Geist Font Family',
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              padding: EdgeInsets.zero,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      _model.outputExecution?.where((e) => e.userId == listViewUserRow.userId).toList().sortedList(keyOf: (e) => e.id, desc: true).unique((e) => e.composeKey!).length.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Geist Font Family',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    ' / ',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Geist Font Family',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  FutureBuilder<List<UserClientAssignmentsRow>>(
                                                                                    future: UserClientAssignmentsTable().queryRows(
                                                                                      queryFn: (q) => q.eqOrNull(
                                                                                        'user_id',
                                                                                        listViewUserRow.userId,
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
                                                                                      List<UserClientAssignmentsRow> textUserClientAssignmentsRowList = snapshot.data!;

                                                                                      return Text(
                                                                                        valueOrDefault<String>(
                                                                                          (valueOrDefault<int>(
                                                                                                    _model.outputPlan?.where((e) => (e.plannedTaskInterval == 'Daily') && (e.supervisorUserId == listViewUserRow.userId)).toList().unique((e) => e.compKey!).length,
                                                                                                    0,
                                                                                                  ) *
                                                                                                  7)
                                                                                              .toString(),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Geist Font Family',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      );
                                                                                    },
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
                                                              ),
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
                                      Builder(
                                        builder: (context) {
                                          final listChildren = _model.pagePlan
                                              .unique((e) => e.compKey2!)
                                              .where((e) => !_model
                                                  .pageCompliantSupervisors
                                                  .contains(e.supervisorUserId))
                                              .toList();

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                listChildren.length,
                                                (listChildrenIndex) {
                                              final listChildrenItem =
                                                  listChildren[
                                                      listChildrenIndex];
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      10.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    2.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Supervisor : ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child: FutureBuilder<
                                                                      List<
                                                                          UserRow>>(
                                                                    future: UserTable()
                                                                        .querySingleRow(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'user_id',
                                                                        valueOrDefault<
                                                                            String>(
                                                                          listChildrenItem
                                                                              .supervisorUserId,
                                                                          'null',
                                                                        ),
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
                                                                      List<UserRow>
                                                                          textUserRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      final textUserRow = textUserRowList
                                                                              .isNotEmpty
                                                                          ? textUserRowList
                                                                              .first
                                                                          : null;

                                                                      return Text(
                                                                        '${valueOrDefault<String>(
                                                                          textUserRow
                                                                              ?.firstName,
                                                                          'first name',
                                                                        )} ${valueOrDefault<String>(
                                                                          textUserRow
                                                                              ?.lastName,
                                                                          'Lastname',
                                                                        )} Phone : ${valueOrDefault<String>(
                                                                          textUserRow
                                                                              ?.phone,
                                                                          'Phone number',
                                                                        )}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final listChildrenLocation = _model
                                                          .pagePlan
                                                          .unique((e) =>
                                                              e.compKey2!)
                                                          .where((e) =>
                                                              e.supervisorUserId ==
                                                              listChildrenItem
                                                                  .supervisorUserId)
                                                          .toList();

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            listChildrenLocation
                                                                .length,
                                                            (listChildrenLocationIndex) {
                                                          final listChildrenLocationItem =
                                                              listChildrenLocation[
                                                                  listChildrenLocationIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            10.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.6,
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
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
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                'Location : ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Geist Font Family',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                FutureBuilder<List<UserRow>>(
                                                                              future: UserTable().querySingleRow(
                                                                                queryFn: (q) => q.eqOrNull(
                                                                                  'user_id',
                                                                                  valueOrDefault<String>(
                                                                                    listChildrenItem.supervisorUserId,
                                                                                    'null',
                                                                                  ),
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
                                                                                List<UserRow> textUserRowList = snapshot.data!;

                                                                                final textUserRow = textUserRowList.isNotEmpty ? textUserRowList.first : null;

                                                                                return Text(
                                                                                  '${listChildrenLocationItem.plannedTaskClientName}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Geist Font Family',
                                                                                        letterSpacing: 0.0,
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
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  final listChildrenTask = _model
                                                                      .pagePlan
                                                                      .unique((e) => e
                                                                          .compKey2!)
                                                                      .where((e) => !_model
                                                                          .pageCompliantTask
                                                                          .contains(
                                                                              e.compKey2))
                                                                      .toList();

                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        listChildrenTask
                                                                            .length,
                                                                        (listChildrenTaskIndex) {
                                                                      final listChildrenTaskItem =
                                                                          listChildrenTask[
                                                                              listChildrenTaskIndex];
                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                10.0),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.4,
                                                                              height: 40.0,
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
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        'Task Name : ',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Geist Font Family',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: FutureBuilder<List<UserRow>>(
                                                                                      future: UserTable().querySingleRow(
                                                                                        queryFn: (q) => q.eqOrNull(
                                                                                          'user_id',
                                                                                          valueOrDefault<String>(
                                                                                            listChildrenItem.supervisorUserId,
                                                                                            'null',
                                                                                          ),
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
                                                                                        List<UserRow> textUserRowList = snapshot.data!;

                                                                                        final textUserRow = textUserRowList.isNotEmpty ? textUserRowList.first : null;

                                                                                        return Text(
                                                                                          valueOrDefault<String>(
                                                                                            listChildrenTaskItem.plannedTaskName,
                                                                                            'task name',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Geist Font Family',
                                                                                                letterSpacing: 0.0,
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
                                                                      );
                                                                    }),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              );
                                            }),
                                          );
                                        },
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
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
