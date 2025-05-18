import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'image_viewer_model.dart';
export 'image_viewer_model.dart';

class ImageViewerWidget extends StatefulWidget {
  const ImageViewerWidget({super.key});

  static String routeName = 'ImageViewer';
  static String routePath = '/imageViewer';

  @override
  State<ImageViewerWidget> createState() => _ImageViewerWidgetState();
}

class _ImageViewerWidgetState extends State<ImageViewerWidget> {
  late ImageViewerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageViewerModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().appDateFrom = functions.formatDateTime(getCurrentTimestamp);
      FFAppState().appDateTo = functions.formatDateTime(getCurrentTimestamp);
      safeSetState(() {});
      _model.timerController.timer.setPresetTime(
        mSec: _model.dropDownRefreshIntervalsValue!,
        add: false,
      );
      _model.timerController.onResetTimer();

      _model.timerController.onStartTimer();
      safeSetState(() => _model.apiRequestCompleter = null);
      await _model.waitForApiRequestCompleted();
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
        title: 'ImageViewer',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FutureBuilder<ApiCallResponse>(
                  future: (_model.apiRequestCompleter ??=
                          Completer<ApiCallResponse>()
                            ..complete(GetFieldValuesCall.call(
                              startDate: functions
                                  .formatDateTime(FFAppState().appDateFrom)
                                  ?.toString(),
                              endDate: functions
                                  .formatDateTime(FFAppState().appDateTo)
                                  ?.toString(),
                              companyName: FFAppState().appAuthUserCompanyName,
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
                    final carouselGetFieldValuesResponse = snapshot.data!;

                    return Builder(
                      builder: (context) {
                        final apiResultChildren = (carouselGetFieldValuesResponse
                                        .jsonBody
                                        .toList()
                                        .map<GetFieldValuesDTStruct?>(
                                            GetFieldValuesDTStruct.maybeFromMap)
                                        .toList()
                                    as Iterable<GetFieldValuesDTStruct?>)
                                .withoutNulls
                                .toList() ??
                            [];

                        return Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.9,
                          child: CarouselSlider.builder(
                            itemCount: apiResultChildren.length,
                            itemBuilder: (context, apiResultChildrenIndex, _) {
                              final apiResultChildrenItem =
                                  apiResultChildren[apiResultChildrenIndex];
                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                      ),
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.72,
                                              decoration: BoxDecoration(
                                                color: Color(0x4C91A5CC),
                                              ),
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                200.0,
                                                                80.0,
                                                                200.0,
                                                                0.0),
                                                    child: Image.network(
                                                      functions
                                                          .convertStringToImagePath(
                                                              apiResultChildrenItem
                                                                  .value)!,
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  if (dateTimeFormat(
                                                          "d/M/y",
                                                          _model
                                                              .outputPictureDate) !=
                                                      dateTimeFormat(
                                                          "d/M/y",
                                                          functions.formatStrToDateTime(
                                                              apiResultChildrenItem
                                                                  .reportDate)))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  80.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFE5DDDD),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50.0),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .cancel_outlined,
                                                                color: Color(
                                                                    0xFFF03232),
                                                                size: 100.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFF03232),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Text(
                                                                'Uploaded picture is not valid.',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Geist Font Family',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
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
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF111111),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(32.0),
                                                  topRight:
                                                      Radius.circular(32.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        32.0, 24.0, 32.0, 24.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF222222),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Column(
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
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            apiResultChildrenItem.fieldName,
                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                  fontFamily: 'Geist Font Family',
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        '${_model.carouselCurrentIndex.toString()} / ${(carouselGetFieldValuesResponse.jsonBody.toList().map<GetFieldValuesDTStruct?>(GetFieldValuesDTStruct.maybeFromMap).toList() as Iterable<GetFieldValuesDTStruct?>).withoutNulls.length.toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Geist Font Family',
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                'Picture Captured Date : ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Geist Font Family',
                                                                                      color: Color(0xFFE0E0E0),
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                dateTimeFormat("d/M/y", _model.outputPictureDate),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Geist Font Family',
                                                                                      color: Color(0xFFE0E0E0),
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                'Report Date : ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Geist Font Family',
                                                                                      color: Color(0xFFE0E0E0),
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                dateTimeFormat("d/M/y", functions.formatStrToDateTime(apiResultChildrenItem.reportDate)),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Geist Font Family',
                                                                                      color: Color(0xFFE0E0E0),
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                'Submitted by : ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Geist Font Family',
                                                                                      color: Color(0xFFE0E0E0),
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                apiResultChildrenItem.fullName,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Geist Font Family',
                                                                                      color: Color(0xFFE0E0E0),
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 16.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 24.0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0x83000000),
                                            Colors.black
                                          ],
                                          stops: [0.0, 1.0],
                                          begin: AlignmentDirectional(0.0, 1.0),
                                          end: AlignmentDirectional(0, -1.0),
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 2.0,
                                            sigmaY: 2.0,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  apiResultChildrenItem
                                                      .clientName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            'Geist Font Family',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 20.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          Color(0x33FFFFFF),
                                                      icon: Icon(
                                                        Icons.download,
                                                        color: Colors.white,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        await downloadFile(
                                                          filename:
                                                              apiResultChildrenItem
                                                                  .fieldName,
                                                          url:
                                                              apiResultChildrenItem
                                                                  .value,
                                                        );
                                                      },
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 16.0)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            carouselController: _model.carouselController ??=
                                CarouselSliderController(),
                            options: CarouselOptions(
                              initialPage:
                                  max(0, min(1, apiResultChildren.length - 1)),
                              viewportFraction: 1.0,
                              disableCenter: false,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.1,
                              enableInfiniteScroll: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 3000),
                              autoPlayInterval:
                                  Duration(milliseconds: (3000 + 10000)),
                              autoPlayCurve: Curves.linear,
                              pauseAutoPlayInFiniteScroll: true,
                              onPageChanged: (index, _) async {
                                _model.carouselCurrentIndex = index;
                                _model.outputPictureDate =
                                    await actions.extractImageDateMetadata(
                                  apiResultChildren
                                      .elementAtOrNull(
                                          _model.carouselCurrentIndex)!
                                      .value,
                                );

                                safeSetState(() {});
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                Container(
                  height: 90.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: FlutterFlowTimer(
                                          initialTime:
                                              _model.timerInitialTimeMs,
                                          getDisplayTime: (value) =>
                                              StopWatchTimer.getDisplayTime(
                                            value,
                                            hours: false,
                                            milliSecond: false,
                                          ),
                                          controller: _model.timerController,
                                          updateStateInterval:
                                              Duration(milliseconds: 1000),
                                          onChanged: (value, displayTime,
                                              shouldUpdate) {
                                            _model.timerMilliseconds = value;
                                            _model.timerValue = displayTime;
                                            if (shouldUpdate)
                                              safeSetState(() {});
                                          },
                                          onEnded: () async {
                                            safeSetState(() => _model
                                                .apiRequestCompleter = null);
                                            await _model
                                                .waitForApiRequestCompleted();
                                            _model.timerController.timer
                                                .setPresetTime(
                                              mSec: _model
                                                  .dropDownRefreshIntervalsValue!,
                                              add: false,
                                            );
                                            _model.timerController
                                                .onResetTimer();

                                            _model.timerController
                                                .onStartTimer();
                                          },
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Geist Font Family',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowDropDown<int>(
                                controller: _model
                                        .dropDownRefreshIntervalsValueController ??=
                                    FormFieldController<int>(
                                  _model.dropDownRefreshIntervalsValue ??=
                                      30000,
                                ),
                                options: List<int>.from(
                                    [30000, 60000, 300000, 600000]),
                                optionLabels: [
                                  '30 seconds',
                                  '60 seconds',
                                  '5 minutes',
                                  '10 minutes'
                                ],
                                onChanged: (val) async {
                                  safeSetState(() => _model
                                      .dropDownRefreshIntervalsValue = val);
                                  _model.timerController.timer.setPresetTime(
                                    mSec: _model.dropDownRefreshIntervalsValue!,
                                    add: false,
                                  );
                                  _model.timerController.onResetTimer();

                                  _model.timerController.onStartTimer();
                                },
                                width: 200.0,
                                height: 40.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Geist Font Family',
                                      fontSize: 7.0,
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'select refresh intervals',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                50.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 0.0, 0.0),
                                          child: Text(
                                            'Date From',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Geist Font Family',
                                                  fontSize: 7.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
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
                                                      FFAppState()
                                                              .appDateFromSelectorVisi =
                                                          !(FFAppState()
                                                                  .appDateFromSelectorVisi ??
                                                              true);
                                                      FFAppState()
                                                              .appDateToSelectorVisi =
                                                          false;
                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .calendar_today_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          "d/M/y",
                                                          FFAppState()
                                                              .appDateFrom),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
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
                                                        FFAppState()
                                                                .appDateFrom =
                                                            functions.subtractDay(
                                                                FFAppState()
                                                                    .appDateFrom);
                                                        safeSetState(() {});
                                                        safeSetState(() => _model
                                                                .apiRequestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForApiRequestCompleted();
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .chevron_left_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
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
                                                    onTap: () async {
                                                      FFAppState().appDateFrom =
                                                          functions.addDay(
                                                              FFAppState()
                                                                  .appDateFrom);
                                                      safeSetState(() {});
                                                      safeSetState(() => _model
                                                              .apiRequestCompleter =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted();
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .navigate_next_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              'Date To',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Geist Font Family',
                                                        fontSize: 7.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
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
                                                        FFAppState()
                                                                .appDateFromSelectorVisi =
                                                            false;
                                                        FFAppState()
                                                                .appDateToSelectorVisi =
                                                            !(FFAppState()
                                                                    .appDateToSelectorVisi ??
                                                                true);
                                                        safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .calendar_today_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            "d/M/y",
                                                            FFAppState()
                                                                .appDateTo),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Geist Font Family',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
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
                                                                  10.0,
                                                                  0.0),
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
                                                          FFAppState()
                                                                  .appDateTo =
                                                              functions.subtractDay(
                                                                  FFAppState()
                                                                      .appDateTo);
                                                          safeSetState(() {});
                                                          safeSetState(() =>
                                                              _model.apiRequestCompleter =
                                                                  null);
                                                          await _model
                                                              .waitForApiRequestCompleted();
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .chevron_left_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
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
                                                      onTap: () async {
                                                        FFAppState().appDateTo =
                                                            functions.addDay(
                                                                FFAppState()
                                                                    .appDateTo);
                                                        safeSetState(() {});
                                                        safeSetState(() => _model
                                                                .apiRequestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForApiRequestCompleted();
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .navigate_next_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(ReportSummaryWidget.routeName);
                            },
                            text: 'Exit',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).error,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Geist Font Family',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
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
        ));
  }
}
