import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'report_details_field_model.dart';
export 'report_details_field_model.dart';

class ReportDetailsFieldWidget extends StatefulWidget {
  const ReportDetailsFieldWidget({
    super.key,
    required this.fieldName,
    required this.fieldValue,
  });

  final String? fieldName;
  final String? fieldValue;

  @override
  State<ReportDetailsFieldWidget> createState() =>
      _ReportDetailsFieldWidgetState();
}

class _ReportDetailsFieldWidgetState extends State<ReportDetailsFieldWidget> {
  late ReportDetailsFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportDetailsFieldModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            valueOrDefault<String>(
              widget.fieldName,
              'nill',
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Geist Font Family',
                  letterSpacing: 0.0,
                ),
          ),
          Text(
            valueOrDefault<String>(
              widget.fieldValue,
              'nill',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Geist Font Family',
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }
}
