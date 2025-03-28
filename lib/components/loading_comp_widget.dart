import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'loading_comp_model.dart';
export 'loading_comp_model.dart';

class LoadingCompWidget extends StatefulWidget {
  const LoadingCompWidget({super.key});

  @override
  State<LoadingCompWidget> createState() => _LoadingCompWidgetState();
}

class _LoadingCompWidgetState extends State<LoadingCompWidget>
    with TickerProviderStateMixin {
  late LoadingCompModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingCompModel());

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.bounceOut,
            delay: 150.0.ms,
            duration: 660.0.ms,
            begin: 0.0,
            end: 1.5,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sync,
                      color: FlutterFlowTheme.of(context).info,
                      size: 32.0,
                    ).animateOnPageLoad(
                        animationsMap['iconOnPageLoadAnimation']!),
                  ],
                ),
              ),
            ),
            Text(
              'Loading Data...',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Geist Font Family',
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
            Text(
              'Please wait while we fetch your information',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Geist Font Family',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
