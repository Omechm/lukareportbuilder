import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'academy_model.dart';
export 'academy_model.dart';

class AcademyWidget extends StatefulWidget {
  const AcademyWidget({super.key});

  static String routeName = 'Academy';
  static String routePath = '/academy';

  @override
  State<AcademyWidget> createState() => _AcademyWidgetState();
}

class _AcademyWidgetState extends State<AcademyWidget> {
  late AcademyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcademyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Academy',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Text(
                'Academy',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Geist Font Family',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.search_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          context.goNamed(HomepageWidget.routeName);
                        },
                        text: 'Back',
                        icon: Icon(
                          Icons.chevron_left_sharp,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Geist Font Family',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 1.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder<List<UserProgressRow>>(
                        future: UserProgressTable().queryRows(
                          queryFn: (q) => q
                              .eqOrNull(
                                'is_completed',
                                false,
                              )
                              .eqOrNull(
                                'user_id',
                                currentUserUid,
                              )
                              .order('lesson_order_id', ascending: true),
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
                          List<UserProgressRow> containerUserProgressRowList =
                              snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(),
                            child: Container(
                              width: double.infinity,
                              height: 120.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context).accent1,
                                    FlutterFlowTheme.of(context).primary
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(1.0, -1.0),
                                  end: AlignmentDirectional(-1.0, 1.0),
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: FutureBuilder<List<LessonsRow>>(
                                  future: LessonsTable().querySingleRow(
                                    queryFn: (q) => q.eqOrNull(
                                      'id',
                                      containerUserProgressRowList
                                          .firstOrNull?.lessonId,
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Color(0xFF7C8289),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<LessonsRow> rowLessonsRowList =
                                        snapshot.data!;

                                    final rowLessonsRow =
                                        rowLessonsRowList.isNotEmpty
                                            ? rowLessonsRowList.first
                                            : null;

                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  rowLessonsRow?.title,
                                                  'Course title',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Geist Font Family',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              Text(
                                                'Continue where you left off',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Geist Font Family',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  context.pushNamed(
                                                    CourselessonsWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'courseid':
                                                          serializeParam(
                                                        valueOrDefault<String>(
                                                          rowLessonsRow
                                                              ?.courseId,
                                                          'Course title',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                text: 'Resume Course',
                                                options: FFButtonOptions(
                                                  height: 36.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Geist Font Family',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                        ),
                                        Image.network(
                                          valueOrDefault<String>(
                                            rowLessonsRow?.thumbnail,
                                            'Course title',
                                          ),
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Text(
                        'My Courses',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Geist Font Family',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 278.44,
                        decoration: BoxDecoration(),
                        child: FutureBuilder<List<CoursesRow>>(
                          future: CoursesTable().queryRows(
                            queryFn: (q) => q,
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
                            List<CoursesRow> rowCoursesRowList = snapshot.data!;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(
                                    rowCoursesRowList.length, (rowIndex) {
                                  final rowCoursesRow =
                                      rowCoursesRowList[rowIndex];
                                  return FutureBuilder<List<UserProgressRow>>(
                                    future: UserProgressTable().queryRows(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'user_id',
                                            currentUserUid,
                                          )
                                          .eqOrNull(
                                            'course_id',
                                            rowCoursesRow.id,
                                          )
                                          .eqOrNull(
                                            'is_completed',
                                            false,
                                          )
                                          .order('lesson_order_id',
                                              ascending: true)
                                          .order('updated_at'),
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
                                      List<UserProgressRow>
                                          containerUserProgressRowList =
                                          snapshot.data!;

                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            CourselessonsWidget.routeName,
                                            queryParameters: {
                                              'courseid': serializeParam(
                                                rowCoursesRow.id,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: 280.0,
                                          height: 250.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x1A000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 120.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: Image.network(
                                                            '500x500?flutter',
                                                          ).image,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                            spreadRadius: 2.0,
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            rowCoursesRow
                                                                .thumbnail!,
                                                            width: 200.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          rowCoursesRow.title,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FutureBuilder<
                                                                List<
                                                                    LessonsRow>>(
                                                              future:
                                                                  LessonsTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q,
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
                                                                          Color(
                                                                              0xFF7C8289),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<LessonsRow>
                                                                    textLessonsRowList =
                                                                    snapshot
                                                                        .data!;

                                                                return Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    textLessonsRowList
                                                                        .where((e) =>
                                                                            (e.courseId == rowCoursesRow.id) &&
                                                                            (e.id ==
                                                                                containerUserProgressRowList.firstOrNull?.lessonId))
                                                                        .toList()
                                                                        .firstOrNull
                                                                        ?.title,
                                                                    'lesson',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Geist Font Family',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            9.0,
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
                                                                UserProgressRow>>(
                                                          future:
                                                              UserProgressTable()
                                                                  .queryRows(
                                                            queryFn: (q) =>
                                                                q.eqOrNull(
                                                              'course_id',
                                                              rowCoursesRow.id,
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
                                                            List<UserProgressRow>
                                                                containerUserProgressRowList =
                                                                snapshot.data!;

                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .play_circle_outline,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        size:
                                                                            13.0,
                                                                      ),
                                                                      Text(
                                                                        '${containerUserProgressRowList.where((e) => e.isCompleted == true).toList().length.toString()}/${containerUserProgressRowList.length.toString()} lessons',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            4.0)),
                                                                  ),
                                                                  LinearPercentIndicator(
                                                                    percent: containerUserProgressRowList
                                                                            .where((e) =>
                                                                                e.isCompleted ==
                                                                                true)
                                                                            .toList()
                                                                            .length /
                                                                        containerUserProgressRowList
                                                                            .length,
                                                                    width:
                                                                        100.0,
                                                                    lineHeight:
                                                                        12.0,
                                                                    animation:
                                                                        true,
                                                                    animateFromLastPercent:
                                                                        true,
                                                                    progressColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .success,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .accent4,
                                                                    center:
                                                                        Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        formatNumber(
                                                                          (containerUserProgressRowList.where((e) => e.isCompleted == true).toList().length /
                                                                              containerUserProgressRowList.length),
                                                                          formatType:
                                                                              FormatType.percent,
                                                                        ),
                                                                        '50',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                8.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                    barRadius: Radius
                                                                        .circular(
                                                                            5.0),
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 8.0)),
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
                                }).divide(SizedBox(width: 16.0)),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        'Documentation',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Geist Font Family',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x1A000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: FutureBuilder<List<DocumentationRow>>(
                            future: DocumentationTable().queryRows(
                              queryFn: (q) => q,
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
                              List<DocumentationRow>
                                  columnDocumentationRowList = snapshot.data!;

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    columnDocumentationRowList.length,
                                    (columnIndex) {
                                  final columnDocumentationRow =
                                      columnDocumentationRowList[columnIndex];
                                  return Material(
                                    color: Colors.transparent,
                                    child: ListTile(
                                      title: Text(
                                        columnDocumentationRow.title,
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Geist Font Family',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      subtitle: Text(
                                        columnDocumentationRow.description!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Geist Font Family',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      dense: false,
                                    ),
                                  );
                                }).divide(SizedBox(height: 0.0)),
                              );
                            },
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
