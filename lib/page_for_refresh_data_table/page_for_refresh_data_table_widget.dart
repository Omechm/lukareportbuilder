import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'page_for_refresh_data_table_model.dart';
export 'page_for_refresh_data_table_model.dart';

class PageForRefreshDataTableWidget extends StatefulWidget {
  const PageForRefreshDataTableWidget({super.key});

  static String routeName = 'pageForRefreshDataTable';
  static String routePath = '/pageForRefreshDataTable';

  @override
  State<PageForRefreshDataTableWidget> createState() =>
      _PageForRefreshDataTableWidgetState();
}

class _PageForRefreshDataTableWidgetState
    extends State<PageForRefreshDataTableWidget> {
  late PageForRefreshDataTableModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageForRefreshDataTableModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      context.pushNamed(PlannedreporttaskWidget.routeName);
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
        title: 'pageForRefreshDataTable',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Please wait..',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Geist Font Family',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
