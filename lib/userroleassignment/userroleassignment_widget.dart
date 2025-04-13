import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/loading_comp_widget.dart';
import '/components/no_data_widget.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'userroleassignment_model.dart';
export 'userroleassignment_model.dart';

class UserroleassignmentWidget extends StatefulWidget {
  const UserroleassignmentWidget({
    super.key,
    required this.user,
    int? pageNumber,
  }) : this.pageNumber = pageNumber ?? 5;

  final UserRow? user;
  final int pageNumber;

  static String routeName = 'userroleassignment';
  static String routePath = '/userRoleAssignment';

  @override
  State<UserroleassignmentWidget> createState() =>
      _UserroleassignmentWidgetState();
}

class _UserroleassignmentWidgetState extends State<UserroleassignmentWidget> {
  late UserroleassignmentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserroleassignmentModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().appIsLoadingData = true;
      safeSetState(() {});
      _model.outputUsers = await UserTable().queryRows(
        queryFn: (q) => q,
      );
      _model.outputClientForUserAssignmentView =
          await UserClientAssignmentsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          widget.user?.userId,
        ),
      );
      _model.outputRoles = await RolesTable().queryRows(
        queryFn: (q) => q,
      );
      _model.outputPlannedTaskLocation = await PlannedTaskTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_name',
          FFAppState().appAuthUserCompanyName,
        ),
      );
      _model.pageRoles = [];
      _model.pageLocation = [];
      _model.pageAddress = [];
      _model.pageClientForUserAssignmentView = [];
      _model.pageClientForUserAssignmentEdit = [];
      _model.pageIterator = 0;
      safeSetState(() {});
      _model.pageRoles = _model.outputRoles!
          .map((e) => valueOrDefault<String>(
                e.roleName,
                'null',
              ))
          .toList()
          .toList()
          .cast<String>();
      _model.pageLocation = _model.outputPlannedTaskLocation!
          .unique((e) => e.plannedTaskClientId!)
          .map((e) => e.plannedTaskClientName)
          .withoutNulls
          .toList()
          .toList()
          .cast<String>();
      safeSetState(() {});
      FFAppState().appIsLoadingData = false;
      safeSetState(() {});
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
        title: 'userroleassignment',
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
              child: Visibility(
                visible: responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.sidebarnavCopyModel,
                      updateCallback: () => safeSetState(() {}),
                      child: SidebarnavCopyWidget(
                        authUserFIrstName: valueOrDefault<String>(
                          FFAppState().appAuthUserFirstName,
                          'null',
                        ),
                        pageNumber: 5,
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 2.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16.0),
                                        bottomRight: Radius.circular(16.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(16.0),
                                          bottomRight: Radius.circular(16.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'User Role Assignment',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            'Geist Font Family',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            Text(
                                              'Manage users and their roles',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Geist Font Family',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 8.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 50.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                    UsermanagementWidget
                                                        .routeName);
                                              },
                                              child: Text(
                                                'Back',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Geist Font Family',
                                                          color:
                                                              Color(0xFF033395),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 16.0),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 2.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'User',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            FutureBuilder<
                                                                List<UserRow>>(
                                                              future: (_model.requestCompleter2 ??= Completer<
                                                                      List<
                                                                          UserRow>>()
                                                                    ..complete(
                                                                        UserTable()
                                                                            .querySingleRow(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'id',
                                                                        widget
                                                                            .user
                                                                            ?.id,
                                                                      ),
                                                                    )))
                                                                  .future,
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          10.0,
                                                                      height:
                                                                          10.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          Color(
                                                                              0xFF7C8289),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<UserRow>
                                                                    listViewUserRowList =
                                                                    snapshot
                                                                        .data!;

                                                                final listViewUserRow =
                                                                    listViewUserRowList
                                                                            .isNotEmpty
                                                                        ? listViewUserRowList
                                                                            .first
                                                                        : null;

                                                                return ListView(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          1.0,
                                                                          12.0,
                                                                          1.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFF5F5F5),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(12.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 40.0,
                                                                                    height: 40.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).accent1,
                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            (String var1, String var2) {
                                                                                              return "${var1.substring(0, 1)}${var2.substring(0, 1)}";
                                                                                            }(listViewUserRow!.firstName!, listViewUserRow.lastName!),
                                                                                            'null',
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Geist Font Family',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              listViewUserRow.firstName,
                                                                                              'null',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                  fontFamily: 'Geist Font Family',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                listViewUserRow.lastName,
                                                                                                'null',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: 'Geist Font Family',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          listViewUserRow.email,
                                                                                          'null',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: 'Geist Font Family',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ].divide(SizedBox(width: 16.0)),
                                                                              ),
                                                                              Expanded(
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 250.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                            child: Text(
                                                                                              'Role :',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Geist Font Family',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 122.0,
                                                                                            height: 33.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: () {
                                                                                                if (listViewUserRow.userRole == 'Admin') {
                                                                                                  return Color(0x37105DFB);
                                                                                                } else if (listViewUserRow.userRole == 'CSO') {
                                                                                                  return Color(0x31FBA310);
                                                                                                } else if (listViewUserRow.userRole == 'Supervisor') {
                                                                                                  return Color(0x3173FB10);
                                                                                                } else if (listViewUserRow.userRole == 'HOS') {
                                                                                                  return Color(0x31FB10E0);
                                                                                                } else if (listViewUserRow.userRole == 'Visualizer') {
                                                                                                  return Color(0x3110F8FB);
                                                                                                } else {
                                                                                                  return Color(0xFFFB102A);
                                                                                                }
                                                                                              }(),
                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                            ),
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  listViewUserRow.userRole,
                                                                                                  'null',
                                                                                                ),
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
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 16.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 16.0),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 2.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.7,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                2.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Form(
                                                          key: _model.formKey,
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .always,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            25.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                    child: Text(
                                                                      'Edit user information below',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            fontSize:
                                                                                15.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Expanded(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 4.0,
                                                                                color: Color(0x33000000),
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  2.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(16.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                'Assign Roles',
                                                                                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                      fontFamily: 'Geist Font Family',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 1.0, 12.0, 1.0),
                                                                                          child: Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xFFF5F5F5),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(12.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                FlutterFlowDropDown<String>(
                                                                                                                  controller: _model.dropDownValueController ??= FormFieldController<String>(null),
                                                                                                                  options: _model.pageRoles,
                                                                                                                  onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
                                                                                                                  width: 369.0,
                                                                                                                  height: 40.0,
                                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Geist Font Family',
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: false,
                                                                                                                      ),
                                                                                                                  hintText: 'Select role',
                                                                                                                  icon: Icon(
                                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    size: 24.0,
                                                                                                                  ),
                                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  elevation: 2.0,
                                                                                                                  borderColor: Colors.transparent,
                                                                                                                  borderWidth: 0.0,
                                                                                                                  borderRadius: 8.0,
                                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                                  hidesUnderline: true,
                                                                                                                  isOverButton: false,
                                                                                                                  isSearchable: false,
                                                                                                                  isMultiSelect: false,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          if (_model.dropDownValue != null && _model.dropDownValue != '')
                                                                                                            FFButtonWidget(
                                                                                                              onPressed: () async {
                                                                                                                if (_model.formKey.currentState == null || !_model.formKey.currentState!.validate()) {
                                                                                                                  return;
                                                                                                                }
                                                                                                                await UserTable().update(
                                                                                                                  data: {
                                                                                                                    'user_role': _model.dropDownValue,
                                                                                                                    'role_id': _model.outputRoles?.where((e) => e.roleName == _model.dropDownValue).toList().firstOrNull?.id,
                                                                                                                  },
                                                                                                                  matchingRows: (rows) => rows.eqOrNull(
                                                                                                                    'user_id',
                                                                                                                    valueOrDefault<String>(
                                                                                                                      widget.user?.userId,
                                                                                                                      'null',
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                                _model.outputUserRole = await UserRolesTable().queryRows(
                                                                                                                  queryFn: (q) => q.eqOrNull(
                                                                                                                    'user_id',
                                                                                                                    widget.user?.userId,
                                                                                                                  ),
                                                                                                                );
                                                                                                                if (_model.outputUserRole?.firstOrNull?.userId == widget.user?.userId) {
                                                                                                                  await UserRolesTable().update(
                                                                                                                    data: {
                                                                                                                      'role_id': _model.outputRoles?.where((e) => e.roleName == _model.dropDownValue).toList().firstOrNull?.id,
                                                                                                                    },
                                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                                      'user_id',
                                                                                                                      valueOrDefault<String>(
                                                                                                                        widget.user?.userId,
                                                                                                                        'null',
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                } else {
                                                                                                                  await UserRolesTable().insert({
                                                                                                                    'user_id': widget.user?.userId,
                                                                                                                    'role_id': _model.outputRoles?.where((e) => e.roleName == _model.dropDownValue).toList().firstOrNull?.id,
                                                                                                                    'company_name': FFAppState().appAuthUserCompanyName,
                                                                                                                  });
                                                                                                                }

                                                                                                                safeSetState(() => _model.requestCompleter2 = null);
                                                                                                                await _model.waitForRequestCompleted2();
                                                                                                                safeSetState(() {
                                                                                                                  _model.dropDownValueController?.reset();
                                                                                                                });

                                                                                                                safeSetState(() {});
                                                                                                              },
                                                                                                              text: 'Add',
                                                                                                              options: FFButtonOptions(
                                                                                                                height: 40.0,
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                color: Color(0xFF033395),
                                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                      fontFamily: 'Geist Font Family',
                                                                                                                      color: Colors.white,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                                elevation: 0.0,
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 16.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              'Assign Client Location',
                                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                    fontFamily: 'Geist Font Family',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 1.0, 12.0, 1.0),
                                                                                        child: Container(
                                                                                          width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0xFFF5F5F5),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsets.all(12.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            children: [
                                                                                                              FlutterFlowDropDown<String>(
                                                                                                                controller: _model.dropDownClientNameValueController ??= FormFieldController<String>(null),
                                                                                                                options: _model.pageLocation.sortedList(keyOf: (e) => e, desc: false),
                                                                                                                onChanged: (val) => safeSetState(() => _model.dropDownClientNameValue = val),
                                                                                                                width: 369.0,
                                                                                                                height: 40.0,
                                                                                                                searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                      fontFamily: 'Geist Font Family',
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                                searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Geist Font Family',
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Geist Font Family',
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                                hintText: 'Select client name',
                                                                                                                searchHintText: 'Search...',
                                                                                                                icon: Icon(
                                                                                                                  Icons.keyboard_arrow_down_rounded,
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  size: 24.0,
                                                                                                                ),
                                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                elevation: 2.0,
                                                                                                                borderColor: Colors.transparent,
                                                                                                                borderWidth: 0.0,
                                                                                                                borderRadius: 8.0,
                                                                                                                margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                                hidesUnderline: true,
                                                                                                                isOverButton: false,
                                                                                                                isSearchable: true,
                                                                                                                isMultiSelect: false,
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  if (_model.dropDownClientNameValue != null && _model.dropDownClientNameValue != '')
                                                                                                    FFButtonWidget(
                                                                                                      onPressed: () async {
                                                                                                        if ((_model.dropDownClientNameValue != null && _model.dropDownClientNameValue != '') && !(_model.pageClientForUserAssignmentEdit.where((e) => e.clientName == _model.dropDownClientNameValue).toList().isNotEmpty)) {
                                                                                                          _model.outputPlannedTaskClientAddress = await ClientsTable().queryRows(
                                                                                                            queryFn: (q) => q.eqOrNull(
                                                                                                              'client_name',
                                                                                                              _model.dropDownClientNameValue,
                                                                                                            ),
                                                                                                          );
                                                                                                          unawaited(
                                                                                                            () async {
                                                                                                              await UserClientAssignmentsTable().insert({
                                                                                                                'user_id': widget.user?.userId,
                                                                                                                'first_name': widget.user?.firstName,
                                                                                                                'client_name': _model.dropDownClientNameValue,
                                                                                                                'client_address': valueOrDefault<String>(
                                                                                                                  _model.outputPlannedTaskClientAddress?.firstOrNull?.address,
                                                                                                                  'null',
                                                                                                                ),
                                                                                                                'company_name': _model.outputUsers?.where((e) => e.userId == currentUserUid).toList().firstOrNull?.companyName,
                                                                                                                'last_name': widget.user?.lastName,
                                                                                                                'client_id': valueOrDefault<String>(
                                                                                                                  _model.outputPlannedTaskClientAddress?.firstOrNull?.clientId,
                                                                                                                  'null',
                                                                                                                ),
                                                                                                              });
                                                                                                            }(),
                                                                                                          );
                                                                                                          safeSetState(() => _model.requestCompleter1 = null);
                                                                                                          await _model.waitForRequestCompleted1(minWait: 3000);
                                                                                                          safeSetState(() {
                                                                                                            _model.dropDownClientNameValueController?.reset();
                                                                                                          });
                                                                                                          await actions.plannedtasksupervisoruserid();
                                                                                                        }

                                                                                                        safeSetState(() {});
                                                                                                      },
                                                                                                      text: 'Add',
                                                                                                      options: FFButtonOptions(
                                                                                                        height: 40.0,
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        color: Color(0xFF033395),
                                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                              fontFamily: 'Geist Font Family',
                                                                                                              color: Colors.white,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                        elevation: 0.0,
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 16.0)),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.5,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 4.0,
                                                                                color: Color(0x33000000),
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  2.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Flexible(
                                                                                    child: Container(
                                                                                      width: 600.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              'Chosen Client Location(s)',
                                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                    fontFamily: 'Geist Font Family',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                safeSetState(() => _model.requestCompleter1 = null);
                                                                                                await _model.waitForRequestCompleted1(minWait: 3000);
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.refresh_sharp,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 30.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                                  child: FutureBuilder<List<UserClientAssignmentsRow>>(
                                                                                    future: (_model.requestCompleter1 ??= Completer<List<UserClientAssignmentsRow>>()
                                                                                          ..complete(UserClientAssignmentsTable().queryRows(
                                                                                            queryFn: (q) => q.eqOrNull(
                                                                                              'user_id',
                                                                                              widget.user?.userId,
                                                                                            ),
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
                                                                                      List<UserClientAssignmentsRow> listViewUserClientUserClientAssignmentsRowList = snapshot.data!;

                                                                                      if (listViewUserClientUserClientAssignmentsRowList.isEmpty) {
                                                                                        return Center(
                                                                                          child: Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                            height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                            child: NoDataWidget(),
                                                                                          ),
                                                                                        );
                                                                                      }

                                                                                      return ListView.builder(
                                                                                        padding: EdgeInsets.zero,
                                                                                        shrinkWrap: true,
                                                                                        scrollDirection: Axis.vertical,
                                                                                        itemCount: listViewUserClientUserClientAssignmentsRowList.length,
                                                                                        itemBuilder: (context, listViewUserClientIndex) {
                                                                                          final listViewUserClientUserClientAssignmentsRow = listViewUserClientUserClientAssignmentsRowList[listViewUserClientIndex];
                                                                                          return Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: 400.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    boxShadow: [
                                                                                                      BoxShadow(
                                                                                                        blurRadius: 4.0,
                                                                                                        color: Color(0x33000000),
                                                                                                        offset: Offset(
                                                                                                          0.0,
                                                                                                          2.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    ],
                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                  ),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                                                          child: Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              listViewUserClientUserClientAssignmentsRow.clientName,
                                                                                                              'null',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Geist Font Family',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 5.0),
                                                                                                          child: Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              listViewUserClientUserClientAssignmentsRow.clientAddress,
                                                                                                              'null',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Geist Font Family',
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  fontSize: 10.0,
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
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                child: FlutterFlowIconButton(
                                                                                                  borderColor: Colors.transparent,
                                                                                                  borderRadius: 8.0,
                                                                                                  buttonSize: 30.0,
                                                                                                  fillColor: Color(0xFFCF080C),
                                                                                                  icon: Icon(
                                                                                                    Icons.delete_forever,
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    size: 14.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    await UserClientAssignmentsTable().delete(
                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                        'id',
                                                                                                        listViewUserClientUserClientAssignmentsRow.id,
                                                                                                      ),
                                                                                                    );
                                                                                                    safeSetState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
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
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (FFAppState().appIsLoadingData)
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: wrapWithModel(
                                model: _model.loadingCompModel,
                                updateCallback: () => safeSetState(() {}),
                                child: LoadingCompWidget(),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
