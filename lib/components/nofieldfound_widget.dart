import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nofieldfound_model.dart';
export 'nofieldfound_model.dart';

class NofieldfoundWidget extends StatefulWidget {
  const NofieldfoundWidget({super.key});

  @override
  State<NofieldfoundWidget> createState() => _NofieldfoundWidgetState();
}

class _NofieldfoundWidgetState extends State<NofieldfoundWidget> {
  late NofieldfoundModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NofieldfoundModel());

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
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Colors.transparent,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 48.0,
            ),
            Text(
              'No Field has been added yet',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Geist Font Family',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
