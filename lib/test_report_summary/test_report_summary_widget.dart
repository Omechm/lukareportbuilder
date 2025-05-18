import '/backend/supabase/supabase.dart';
import '/components/picture_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'test_report_summary_model.dart';
export 'test_report_summary_model.dart';

class TestReportSummaryWidget extends StatefulWidget {
  const TestReportSummaryWidget({super.key});

  static String routeName = 'TestReportSummary';
  static String routePath = '/testReportSummary';

  @override
  State<TestReportSummaryWidget> createState() =>
      _TestReportSummaryWidgetState();
}

class _TestReportSummaryWidgetState extends State<TestReportSummaryWidget> {
  late TestReportSummaryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestReportSummaryModel());

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
        title: 'TestReportSummary',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Text(
                'Page Title',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Geist Font Family',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(50.0),
                        child:
                            FutureBuilder<List<ExecutedTaskWithFieldsJsonRow>>(
                          future: ExecutedTaskWithFieldsJsonTable().queryRows(
                            queryFn: (q) => q
                                .eqOrNull(
                                  'company_name',
                                  FFAppState().appAuthUserCompanyName,
                                )
                                .gteOrNull(
                                  'executed_date',
                                  supaSerialize<DateTime>(getCurrentTimestamp),
                                )
                                .order('created_at', ascending: true),
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
                            List<ExecutedTaskWithFieldsJsonRow>
                                listViewExecutedTaskWithFieldsJsonRowList =
                                snapshot.data!;

                            return ListView.separated(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  listViewExecutedTaskWithFieldsJsonRowList
                                      .length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 10.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewExecutedTaskWithFieldsJsonRow =
                                    listViewExecutedTaskWithFieldsJsonRowList[
                                        listViewIndex];
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Text(
                                                'Task : ${listViewExecutedTaskWithFieldsJsonRow.taskName}     Execution Date : ${dateTimeFormat("yMMMd", listViewExecutedTaskWithFieldsJsonRow.executedDate)}     Location : ${listViewExecutedTaskWithFieldsJsonRow.clientName}  ${listViewExecutedTaskWithFieldsJsonRow.clientAddress}     Supervisor : ${listViewExecutedTaskWithFieldsJsonRow.supervisor}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              'Geist Font Family',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Builder(
                                          builder: (context) {
                                            final valueJsonChildren =
                                                listViewExecutedTaskWithFieldsJsonRow
                                                        .fieldsJson
                                                        ?.toList() ??
                                                    [];

                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: List.generate(
                                                        valueJsonChildren
                                                            .length,
                                                        (valueJsonChildrenIndex) {
                                                  final valueJsonChildrenItem =
                                                      valueJsonChildren[
                                                          valueJsonChildrenIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 5.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 111.4,
                                                          height: 172.86,
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
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            valueJsonChildrenItem,
                                                                            r'''$.field_name''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Geist Font Family',
                                                                                fontSize: 10.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                                                      if (getJsonField(
                                                                            valueJsonChildrenItem,
                                                                            r'''$.field_type''',
                                                                          ) ==
                                                                          getJsonField(
                                                                            <String,
                                                                                String?>{
                                                                              'field_type': 'picture',
                                                                            },
                                                                            r'''$.field_type''',
                                                                          ))
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
                                                                            _model.outputCapturedDate =
                                                                                await actions.extractImageDateMetadata(
                                                                              getJsonField(
                                                                                valueJsonChildrenItem,
                                                                                r'''$.value''',
                                                                              ).toString(),
                                                                            );
                                                                            _model.outputCapturedData =
                                                                                await actions.extractExifMetadata(
                                                                              getJsonField(
                                                                                valueJsonChildrenItem,
                                                                                r'''$.value''',
                                                                              ).toString(),
                                                                            );
                                                                            _model.outputUser =
                                                                                await UserTable().queryRows(
                                                                              queryFn: (q) => q.eqOrNull(
                                                                                'user_id',
                                                                                listViewExecutedTaskWithFieldsJsonRow.userId,
                                                                              ),
                                                                            );
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
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
                                                                                        imgirl: getJsonField(
                                                                                          valueJsonChildrenItem,
                                                                                          r'''$.value''',
                                                                                        ).toString(),
                                                                                        title: getJsonField(
                                                                                          valueJsonChildrenItem,
                                                                                          r'''$.field_name''',
                                                                                        ).toString(),
                                                                                        capturedBy: '${_model.outputUser?.firstOrNull?.firstName} ${_model.outputUser?.firstOrNull?.lastName}',
                                                                                        location: '${listViewExecutedTaskWithFieldsJsonRow.clientName} ${listViewExecutedTaskWithFieldsJsonRow.clientAddress}',
                                                                                        capturedDate: _model.outputCapturedDate,
                                                                                        capturedData: _model.outputCapturedData,
                                                                                      ),
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
                                                                              functions.convertStringToImagePath(getJsonField(
                                                                                valueJsonChildrenItem,
                                                                                r'''$.value''',
                                                                              ).toString())!,
                                                                              width: 101.33,
                                                                              height: 88.1,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (getJsonField(
                                                                            valueJsonChildrenItem,
                                                                            r'''$.field_type''',
                                                                          ) !=
                                                                          getJsonField(
                                                                            <String,
                                                                                String?>{
                                                                              'field_type': 'picture',
                                                                            },
                                                                            r'''$.field_type''',
                                                                          ))
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      valueJsonChildrenItem,
                                                                                      r'''$.value''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Geist Font Family',
                                                                                          fontSize: 9.0,
                                                                                          letterSpacing: 0.0,
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
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                })
                                                    .divide(
                                                        SizedBox(width: 10.0))
                                                    .around(
                                                        SizedBox(width: 10.0)),
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
                      ),
                      if (false)
                        Padding(
                          padding: EdgeInsets.all(50.0),
                          child: FutureBuilder<List<ExecutedTaskNameRow>>(
                            future: ExecutedTaskNameTable().queryRows(
                              queryFn: (q) => q
                                  .eqOrNull(
                                    'company_name',
                                    FFAppState().appAuthUserCompanyName,
                                  )
                                  .gteOrNull(
                                    'executed_date',
                                    supaSerialize<DateTime>(
                                        FFAppState().appDateTo),
                                  )
                                  .order('created_at', ascending: true),
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
                              List<ExecutedTaskNameRow>
                                  listViewExecutedTaskNameRowList =
                                  snapshot.data!;

                              return ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewExecutedTaskNameRowList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 10.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewExecutedTaskNameRow =
                                      listViewExecutedTaskNameRowList[
                                          listViewIndex];
                                  return FutureBuilder<List<FieldValuesRow>>(
                                    future: FieldValuesTable().queryRows(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'record_id',
                                            listViewExecutedTaskNameRow
                                                .recordId,
                                          )
                                          .order('order_id', ascending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 10.0,
                                            height: 10.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Color(0xFF7C8289),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<FieldValuesRow>
                                          rowFieldValuesRowList =
                                          snapshot.data!;

                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: List.generate(
                                                  rowFieldValuesRowList.length,
                                                  (rowIndex) {
                                            final rowFieldValuesRow =
                                                rowFieldValuesRowList[rowIndex];
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 250.0,
                                                  height: 250.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: FutureBuilder<
                                                            List<
                                                                InspectionFieldsRow>>(
                                                          future:
                                                              InspectionFieldsTable()
                                                                  .querySingleRow(
                                                            queryFn: (q) =>
                                                                q.eqOrNull(
                                                              'field_id',
                                                              rowFieldValuesRow
                                                                  .fieldId,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            List<InspectionFieldsRow>
                                                                rowInspectionFieldsRowList =
                                                                snapshot.data!;

                                                            final rowInspectionFieldsRow =
                                                                rowInspectionFieldsRowList
                                                                        .isNotEmpty
                                                                    ? rowInspectionFieldsRowList
                                                                        .first
                                                                    : null;

                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        rowInspectionFieldsRow
                                                                            ?.fieldName,
                                                                        'Field_name',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
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
                                                                if (rowFieldValuesRow
                                                                        .fieldType ==
                                                                    'picture')
                                                                  Expanded(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        functions
                                                                            .convertStringToImagePath(rowFieldValuesRow.value)!,
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    if (rowFieldValuesRow
                                                                            .fieldType !=
                                                                        'picture')
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Text(
                                                                          rowFieldValuesRow
                                                                              .value,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Geist Font Family',
                                                                                fontSize: 10.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
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
                                              ],
                                            );
                                          })
                                              .divide(SizedBox(width: 10.0))
                                              .around(SizedBox(width: 10.0)),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
