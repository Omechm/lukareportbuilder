import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'non_compliance_more_info_model.dart';
export 'non_compliance_more_info_model.dart';

class NonComplianceMoreInfoWidget extends StatefulWidget {
  const NonComplianceMoreInfoWidget({super.key});

  static String routeName = 'nonComplianceMoreInfo';
  static String routePath = '/nonComplianceMoreInfo';

  @override
  State<NonComplianceMoreInfoWidget> createState() =>
      _NonComplianceMoreInfoWidgetState();
}

class _NonComplianceMoreInfoWidgetState
    extends State<NonComplianceMoreInfoWidget> {
  late NonComplianceMoreInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NonComplianceMoreInfoModel());

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
        title: 'nonComplianceMoreInfo',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          ),
        ));
  }
}
