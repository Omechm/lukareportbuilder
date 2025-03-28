import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'no_data_model.dart';
export 'no_data_model.dart';

class NoDataWidget extends StatefulWidget {
  const NoDataWidget({super.key});

  @override
  State<NoDataWidget> createState() => _NoDataWidgetState();
}

class _NoDataWidgetState extends State<NoDataWidget> {
  late NoDataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDataModel());

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
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0x00FFFFFF),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Text(
          'No Data',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Geist Font Family',
                letterSpacing: 0.0,
                useGoogleFonts: false,
              ),
        ),
      ),
    );
  }
}
