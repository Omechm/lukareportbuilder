import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'picture_details_model.dart';
export 'picture_details_model.dart';

class PictureDetailsWidget extends StatefulWidget {
  const PictureDetailsWidget({
    super.key,
    required this.imgirl,
    this.title,
    this.capturedBy,
    this.location,
    this.capturedDate,
    String? capturedData,
  }) : this.capturedData = capturedData ?? 'null';

  final String? imgirl;
  final String? title;
  final String? capturedBy;
  final String? location;
  final DateTime? capturedDate;
  final String capturedData;

  @override
  State<PictureDetailsWidget> createState() => _PictureDetailsWidgetState();
}

class _PictureDetailsWidgetState extends State<PictureDetailsWidget> {
  late PictureDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PictureDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Close',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Geist Font Family',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      widget.imgirl!,
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.title,
                        'nill',
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Geist Font Family',
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                    ),
                    Text(
                      'Captured by ${widget.capturedBy}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Geist Font Family',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Geist Font Family',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.location,
                            'nill',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Geist Font Family',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Captured Date',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Geist Font Family',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                dateTimeFormat("yMMMd", widget.capturedDate),
                                'null',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Geist Font Family',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        await downloadFile(
                          filename:
                              '${widget.title}_${widget.capturedBy}_${dateTimeFormat("d/M/y", widget.capturedDate)}.jpeg',
                          url: valueOrDefault<String>(
                            widget.imgirl,
                            'nill',
                          ),
                        );
                      },
                      text: 'Download',
                      icon: Icon(
                        Icons.download_rounded,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: 500.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Geist Font Family',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Other data from the camera device',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Geist Font Family',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.capturedData,
                            'null',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Geist Font Family',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
