import '/backend/supabase/supabase.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'clientmanagement_model.dart';
export 'clientmanagement_model.dart';

class ClientmanagementWidget extends StatefulWidget {
  const ClientmanagementWidget({
    super.key,
    int? pageNumber,
  }) : this.pageNumber = pageNumber ?? 6;

  final int pageNumber;

  static String routeName = 'clientmanagement';
  static String routePath = '/clientmanagement';

  @override
  State<ClientmanagementWidget> createState() => _ClientmanagementWidgetState();
}

class _ClientmanagementWidgetState extends State<ClientmanagementWidget> {
  late ClientmanagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientmanagementModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.outputClient = await ClientsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_name',
          FFAppState().appAuthUserCompanyName,
        ),
      );
      _model.unfilteredClientPageState = [];
      _model.filteredClientPageState = [];
      safeSetState(() {});
      _model.unfilteredClientPageState =
          _model.outputClient!.toList().cast<ClientsRow>();
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        title: 'clientmanagement',
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
                  mainAxisSize: MainAxisSize.min,
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
                        pageNumber: widget.pageNumber,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
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
                                  width: MediaQuery.sizeOf(context).width * 1.0,
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
                                          'Client Management',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Geist Font Family',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Text(
                                          'Manage users and their roles',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Geist Font Family',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed(
                                          ClientmanagementEditingWidget
                                              .routeName);
                                    },
                                    text: 'Add New Client',
                                    options: FFButtonOptions(
                                      width: 100.0,
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF033395),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Geist Font Family',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      elevation: 2.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  Container(
                                    width: 300.0,
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          safeSetState(() {
                                            _model
                                                    .simpleSearchResults =
                                                TextSearch(_model
                                                        .unfilteredClientPageState
                                                        .map((e) => e
                                                            .clientName)
                                                        .toList()
                                                        .map((str) =>
                                                            TextSearchItem
                                                                .fromTerms(
                                                                    str, [str]))
                                                        .toList())
                                                    .search(_model
                                                        .textController.text)
                                                    .map((r) => r.object)
                                                    .toList();
                                            ;
                                          });
                                          _model.filteredClientPageState =
                                              _model.unfilteredClientPageState
                                                  .where((e) => _model
                                                          .simpleSearchResults
                                                          .contains(
                                                              valueOrDefault<
                                                                  String>(
                                                        e.clientName,
                                                        'null',
                                                      )))
                                                  .toList()
                                                  .cast<ClientsRow>();
                                          safeSetState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Geist Font Family',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        hintText: 'Search clients',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Geist Font Family',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        filled: true,
                                        fillColor: Color(0xFFF0F0F0),
                                        suffixIcon: Icon(
                                          Icons.search,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Geist Font Family',
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 16.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.77,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Clients',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Geist Font Family',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Builder(
                                                builder: (context) {
                                                  final clients = ((_model.textController
                                                                          .text !=
                                                                      '') &&
                                                              (_model
                                                                  .simpleSearchResults
                                                                  .isNotEmpty)
                                                          ? _model
                                                              .filteredClientPageState
                                                              .sortedList(
                                                                  keyOf: (e) => e
                                                                      .clientName,
                                                                  desc: false)
                                                          : _model
                                                              .unfilteredClientPageState
                                                              .sortedList(
                                                                  keyOf: (e) =>
                                                                      e.clientName,
                                                                  desc: false))
                                                      .toList();

                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: clients.length,
                                                    itemBuilder: (context,
                                                        clientsIndex) {
                                                      final clientsItem =
                                                          clients[clientsIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    1.0,
                                                                    12.0,
                                                                    1.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              ClientmanagementEditingWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'clientId':
                                                                    serializeParam(
                                                                  clientsItem
                                                                      .clientId,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'client':
                                                                    serializeParam(
                                                                  clientsItem,
                                                                  ParamType
                                                                      .SupabaseRow,
                                                                ),
                                                                'editing':
                                                                    serializeParam(
                                                                  true,
                                                                  ParamType
                                                                      .bool,
                                                                ),
                                                                'address':
                                                                    serializeParam(
                                                                  clientsItem
                                                                      .address,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'state':
                                                                    serializeParam(
                                                                  clientsItem
                                                                      .state,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'city':
                                                                    serializeParam(
                                                                  clientsItem
                                                                      .city,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFF5F5F5),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          5.0,
                                                                          12.0,
                                                                          5.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  clientsItem.clientName,
                                                                                  'null',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                      fontFamily: 'Geist Font Family',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              clientsItem.address,
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
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            16.0)),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                20.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            fillColor:
                                                                                Color(0xFFEEFFEB),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.edit_rounded,
                                                                              color: Color(0xFF09A541),
                                                                              size: 20.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              context.pushNamed(
                                                                                ClientmanagementEditingWidget.routeName,
                                                                                queryParameters: {
                                                                                  'clientId': serializeParam(
                                                                                    clientsItem.clientId,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'client': serializeParam(
                                                                                    clientsItem,
                                                                                    ParamType.SupabaseRow,
                                                                                  ),
                                                                                  'editing': serializeParam(
                                                                                    true,
                                                                                    ParamType.bool,
                                                                                  ),
                                                                                  'address': serializeParam(
                                                                                    clientsItem.address,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'state': serializeParam(
                                                                                    clientsItem.state,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'city': serializeParam(
                                                                                    clientsItem.city,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ].divide(SizedBox(width: 8.0)),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 20.0, 0.0),
                                                  child: Text(
                                                    'Total Number of clients',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Geist Font Family',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 20.0, 0.0),
                                                  child: Text(
                                                    _model
                                                        .unfilteredClientPageState
                                                        .length
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Geist Font Family',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 24.0)),
                        ),
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
