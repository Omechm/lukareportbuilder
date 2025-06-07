import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'courselessons_model.dart';
export 'courselessons_model.dart';

class CourselessonsWidget extends StatefulWidget {
  const CourselessonsWidget({
    super.key,
    required this.courseid,
  });

  final String? courseid;

  static String routeName = 'courselessons';
  static String routePath = '/courselessons';

  @override
  State<CourselessonsWidget> createState() => _CourselessonsWidgetState();
}

class _CourselessonsWidgetState extends State<CourselessonsWidget> {
  late CourselessonsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourselessonsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.outputUncompleteLessons = await UserProgressTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'course_id',
              widget.courseid,
            )
            .eqOrNull(
              'user_id',
              currentUserUid,
            )
            .eqOrNull(
              'is_completed',
              false,
            )
            .order('lesson_order_id', ascending: true)
            .order('updated_at'),
      );
      _model.outputFirstUncompleteLesson = await LessonsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'course_id',
              widget.courseid,
            )
            .eqOrNull(
              'id',
              _model.outputUncompleteLessons?.firstOrNull?.lessonId,
            ),
      );
      _model.videourl =
          _model.outputFirstUncompleteLesson?.firstOrNull?.contentUrl;
      safeSetState(() {});
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
    return Title(
        title: 'courselessons',
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
              title: FutureBuilder<List<CoursesRow>>(
                future: CoursesTable().querySingleRow(
                  queryFn: (q) => q.eqOrNull(
                    'id',
                    widget.courseid,
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
                  List<CoursesRow> textCoursesRowList = snapshot.data!;

                  final textCoursesRow = textCoursesRowList.isNotEmpty
                      ? textCoursesRowList.first
                      : null;

                  return Text(
                    valueOrDefault<String>(
                      textCoursesRow?.title,
                      'title',
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Geist Font Family',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  );
                },
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(AcademyWidget.routeName);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            context.goNamed(AcademyWidget.routeName);
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
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Geist Font Family',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 1.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FutureBuilder<List<UserProgressRow>>(
                        future: UserProgressTable().queryRows(
                          queryFn: (q) => q
                              .eqOrNull(
                                'user_id',
                                currentUserUid,
                              )
                              .eqOrNull(
                                'course_id',
                                widget.courseid,
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
                          List<UserProgressRow> containerUserProgressRowList =
                              snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.468,
                                              decoration: BoxDecoration(
                                                color: Color(0x2012151C),
                                              ),
                                              child: FlutterFlowWebView(
                                                content: functions
                                                    .convertYouTubeShortUrl(
                                                        _model.videourl!)!,
                                                height: 500.0,
                                                verticalScroll: false,
                                                horizontalScroll: false,
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.89,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
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
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: FutureBuilder<List<CoursesRow>>(
                                          future: CoursesTable().querySingleRow(
                                            queryFn: (q) => q.eqOrNull(
                                              'id',
                                              widget.courseid,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
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
                                                      Color(0xFF7C8289),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<CoursesRow>
                                                listViewCoursesRowList =
                                                snapshot.data!;

                                            final listViewCoursesRow =
                                                listViewCoursesRowList
                                                        .isNotEmpty
                                                    ? listViewCoursesRowList
                                                        .first
                                                    : null;

                                            return ListView(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              children: [
                                                FutureBuilder<List<LessonsRow>>(
                                                  future: LessonsTable()
                                                      .querySingleRow(
                                                    queryFn: (q) => q.eqOrNull(
                                                      'content_url',
                                                      _model.videourl,
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
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
                                                              Color(0xFF7C8289),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<LessonsRow>
                                                        textLessonsRowList =
                                                        snapshot.data!;

                                                    final textLessonsRow =
                                                        textLessonsRowList
                                                                .isNotEmpty
                                                            ? textLessonsRowList
                                                                .first
                                                            : null;

                                                    return Text(
                                                      valueOrDefault<String>(
                                                        textLessonsRow?.title,
                                                        'lesson',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineMedium
                                                          .override(
                                                            fontFamily:
                                                                'Geist Font Family',
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    );
                                                  },
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x52105DFB),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      4.0,
                                                                      8.0,
                                                                      4.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              listViewCoursesRow
                                                                  ?.category,
                                                              'Category',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Geist Font Family',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    listViewCoursesRow
                                                        ?.description,
                                                    'Description',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Geist Font Family',
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final userlessonprogress =
                                                        containerUserProgressRowList
                                                            .sortedList(
                                                                keyOf: (e) => e
                                                                    .lessonOrderId!,
                                                                desc: false)
                                                            .toList();

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          userlessonprogress
                                                              .length,
                                                      itemBuilder: (context,
                                                          userlessonprogressIndex) {
                                                        final userlessonprogressItem =
                                                            userlessonprogress[
                                                                userlessonprogressIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          12.0),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      LessonsRow>>(
                                                                future: LessonsTable()
                                                                    .querySingleRow(
                                                                  queryFn: (q) =>
                                                                      q.eqOrNull(
                                                                    'id',
                                                                    userlessonprogressItem
                                                                        .lessonId,
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
                                                                  List<LessonsRow>
                                                                      rowLessonsRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  final rowLessonsRow = rowLessonsRowList
                                                                          .isNotEmpty
                                                                      ? rowLessonsRowList
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
                                                                      _model.outputSelectedLesson =
                                                                          await LessonsTable()
                                                                              .queryRows(
                                                                        queryFn:
                                                                            (q) =>
                                                                                q.eqOrNull(
                                                                          'id',
                                                                          userlessonprogressItem
                                                                              .lessonId,
                                                                        ),
                                                                      );
                                                                      _model.videourl =
                                                                          null;
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.videourl =
                                                                          rowLessonsRow
                                                                              .contentUrl;
                                                                      safeSetState(
                                                                          () {});
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              20000));
                                                                      await UserProgressTable()
                                                                          .update(
                                                                        data: {
                                                                          'updated_at':
                                                                              supaSerialize<DateTime>(getCurrentTimestamp),
                                                                          'is_completed':
                                                                              true,
                                                                        },
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eqOrNull(
                                                                          'lesson_id',
                                                                          rowLessonsRow
                                                                              .id,
                                                                        ),
                                                                      );

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Container(
                                                                              width: 60.0,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.cover,
                                                                                  image: Image.network(
                                                                                    '\"500x500?programming\"',
                                                                                  ).image,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                height: double.infinity,
                                                                                child: Stack(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  children: [
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.network(
                                                                                        rowLessonsRow!.thumbnail!,
                                                                                        width: 200.0,
                                                                                        height: 200.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.play_circle_fill,
                                                                                      color: Colors.white,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  rowLessonsRow.title,
                                                                                  'Course',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Geist Font Family',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 10.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  'Lesson No. ${valueOrDefault<String>(
                                                                                    rowLessonsRow.order?.toString(),
                                                                                    'Course',
                                                                                  )}',
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Geist Font Family',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 10.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        if (userlessonprogressItem.isCompleted ??
                                                                            true)
                                                                          Container(
                                                                            width:
                                                                                24.0,
                                                                            height:
                                                                                24.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).success,
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.check,
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                size: 16.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ].divide(SizedBox(
                                                                              width: 12.0)),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
        ));
  }
}
