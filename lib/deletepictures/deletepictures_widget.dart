import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'deletepictures_model.dart';
export 'deletepictures_model.dart';

class DeletepicturesWidget extends StatefulWidget {
  const DeletepicturesWidget({super.key});

  static String routeName = 'Deletepictures';
  static String routePath = '/deletepictures';

  @override
  State<DeletepicturesWidget> createState() => _DeletepicturesWidgetState();
}

class _DeletepicturesWidgetState extends State<DeletepicturesWidget> {
  late DeletepicturesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeletepicturesModel());

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
        title: 'Deletepictures',
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              60.0, 80.0, 60.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Future.wait([
                                Future(() async {
                                  _model.output2weeksOldReports =
                                      await Reportpictures2weeksoldTable()
                                          .queryRows(
                                    queryFn: (q) => q,
                                  );
                                  _model.pageIterator1 = 0;
                                  safeSetState(() {});
                                  while (_model.pageIterator1 !=
                                      _model.output2weeksOldReports?.length) {
                                    await actions.deleteImageFromBucket(
                                      _model.output2weeksOldReports
                                          ?.elementAtOrNull(
                                              _model.pageIterator1!)
                                          ?.url,
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          _model.pageIterator1!.toString(),
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 10),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    _model.pageIterator1 =
                                        _model.pageIterator1! + 1;
                                    safeSetState(() {});
                                  }
                                  _model.pageIterator1 = 0;
                                  safeSetState(() {});
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Success',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 650),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  _model.outputUnMatchedImages =
                                      await ReportpicturesUnmatchedTable()
                                          .queryRows(
                                    queryFn: (q) => q,
                                  );
                                  _model.pageiterator2 = null;
                                  safeSetState(() {});
                                  while (_model.pageiterator2 !=
                                      _model.outputUnMatchedImages?.length) {
                                    await actions.deleteImageFromBucket(
                                      _model.outputUnMatchedImages
                                          ?.elementAtOrNull(
                                              _model.pageiterator2!)
                                          ?.url,
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          _model.pageiterator2!.toString(),
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 10),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    _model.pageiterator2 =
                                        _model.pageiterator2! + 1;
                                    safeSetState(() {});
                                  }
                                  _model.pageiterator2 = null;
                                  safeSetState(() {});
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Success',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 650),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }),
                              ]);

                              safeSetState(() {});
                            },
                            text: 'delete',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
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
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
