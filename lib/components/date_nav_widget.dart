import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'date_nav_model.dart';
export 'date_nav_model.dart';

class DateNavWidget extends StatefulWidget {
  const DateNavWidget({super.key});

  @override
  State<DateNavWidget> createState() => _DateNavWidgetState();
}

class _DateNavWidgetState extends State<DateNavWidget> {
  late DateNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DateNavModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),
        ),
        Icon(
          Icons.navigate_next_outlined,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24.0,
        ),
      ],
    );
  }
}
