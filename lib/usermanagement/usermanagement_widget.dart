import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/sidebarnav_copy_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'usermanagement_model.dart';
export 'usermanagement_model.dart';

class UsermanagementWidget extends StatefulWidget {
  const UsermanagementWidget({
    super.key,
    int? pageNumber,
  }) : this.pageNumber = pageNumber ?? 5;

  final int pageNumber;

  static String routeName = 'usermanagement';
  static String routePath = '/usermanagement';

  @override
  State<UsermanagementWidget> createState() => _UsermanagementWidgetState();
}

class _UsermanagementWidgetState extends State<UsermanagementWidget> {
  late UsermanagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsermanagementModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.outputClients = await ClientsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_name',
          FFAppState().appAuthUserCompanyName,
        ),
      );
      _model.outputRoles = await RolesTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_name',
          FFAppState().appAuthUserCompanyName,
        ),
      );
      _model.roles = [];
      safeSetState(() {});
      _model.clients = _model.outputClients!.toList().cast<ClientsRow>();
      _model.addToRoles('undefined');
      _model.iterator = 0;
      safeSetState(() {});
      while (_model.iterator != _model.outputRoles?.length) {
        _model.addToRoles(
            _model.outputRoles!.elementAtOrNull(_model.iterator)!.roleName!);
        safeSetState(() {});
        _model.iterator = _model.iterator + 1;
        safeSetState(() {});
      }
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textFieldclientTextController ??= TextEditingController();
    _model.textFieldclientFocusNode ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

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
        title: 'usermanagement',
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
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 0.0),
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
                                        width:
                                            MediaQuery.sizeOf(context).width *
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
                                                'User Management',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              'Geist Font Family',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future: SearchuserassignmentsCall
                                                  .call(
                                                companyName: FFAppState()
                                                    .appAuthUserCompanyName,
                                                state: _model.dropDownStateValue !=
                                                            null &&
                                                        _model.dropDownStateValue !=
                                                            ''
                                                    ? _model.dropDownStateValue
                                                    : '',
                                                city: _model.dropDownCityValue !=
                                                            null &&
                                                        _model.dropDownCityValue !=
                                                            ''
                                                    ? _model.dropDownCityValue
                                                    : '',
                                                userRole:
                                                    _model.dropDownRoleValue !=
                                                                null &&
                                                            _model.dropDownRoleValue !=
                                                                ''
                                                        ? _model
                                                            .dropDownRoleValue
                                                        : '',
                                                userfullname: _model.textController1
                                                                .text !=
                                                            ''
                                                    ? _model
                                                        .textController1.text
                                                    : '',
                                                clientName: _model.textFieldclientTextController
                                                                .text !=
                                                            ''
                                                    ? _model
                                                        .textFieldclientTextController
                                                        .text
                                                    : '',
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 10.0,
                                                      height: 10.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          Color(0xFF7C8289),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final listViewSearchuserassignmentsResponse =
                                                    snapshot.data!;

                                                return ListView(
                                                  padding: EdgeInsets.zero,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons.filter_alt,
                                                          color:
                                                              Color(0x962C6BF2),
                                                          size: 5.0,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _model
                                                                      .pageFullname!
                                                                  ? Color(
                                                                      0x7D105DFB)
                                                                  : Color(
                                                                      0x00F0F0F0),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: _model
                                                                        .pageFullname!
                                                                    ? Color(
                                                                        0x7D105DFB)
                                                                    : Color(
                                                                        0x00F0F0F0),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: Container(
                                                                width: 250.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textController1,
                                                                  focusNode: _model
                                                                      .textFieldFocusNode1,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.textController1',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () async {
                                                                      _model
                                                                          .pageFullname = _model.textController1.text !=
                                                                              '';
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelText:
                                                                        'Search user full name',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    alignLabelWithHint:
                                                                        true,
                                                                    hintText:
                                                                        'Search users',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    enabledBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    focusedBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    errorBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    focusedErrorBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Color(
                                                                            0xFFF0F0F0),
                                                                    suffixIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .search,
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Geist Font Family',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  validator: _model
                                                                      .textController1Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _model
                                                                      .pageClient!
                                                                  ? Color(
                                                                      0x7D105DFB)
                                                                  : Color(
                                                                      0x00F0F0F0),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: _model
                                                                        .pageClient!
                                                                    ? Color(
                                                                        0x7D105DFB)
                                                                    : Color(
                                                                        0x00F0F0F0),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: Container(
                                                                width: 250.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textFieldclientTextController,
                                                                  focusNode: _model
                                                                      .textFieldclientFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.textFieldclientTextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () async {
                                                                      _model
                                                                          .pageClient = _model.textFieldclientTextController.text !=
                                                                              '';
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelText:
                                                                        'Search client / location',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    alignLabelWithHint:
                                                                        true,
                                                                    hintText:
                                                                        'Search client/location',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    enabledBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    focusedBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    errorBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    focusedErrorBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Color(
                                                                            0xFFF0F0F0),
                                                                    suffixIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .search,
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Geist Font Family',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  validator: _model
                                                                      .textFieldclientTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: _model
                                                                          .pageRole!
                                                                      ? Color(
                                                                          0x7D105DFB)
                                                                      : Color(
                                                                          0x00F0F0F0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: _model
                                                                            .pageRole!
                                                                        ? Color(
                                                                            0x7D105DFB)
                                                                        : Color(
                                                                            0x00F0F0F0),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child:
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                    controller: _model
                                                                        .dropDownRoleValueController ??= FormFieldController<
                                                                            String>(
                                                                        null),
                                                                    options: _model
                                                                        .roles,
                                                                    onChanged:
                                                                        (val) async {
                                                                      safeSetState(() =>
                                                                          _model.dropDownRoleValue =
                                                                              val);
                                                                      _model
                                                                          .pageRole = _model.dropDownRoleValue !=
                                                                              null &&
                                                                          _model.dropDownRoleValue !=
                                                                              '';
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    height:
                                                                        40.0,
                                                                    searchHintTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    searchTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintText:
                                                                        'Select role',
                                                                    searchHintText:
                                                                        'Search role',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .search,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                    fillColor:
                                                                        Color(
                                                                            0xFFF0F0F0),
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderWidth:
                                                                        0.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        true,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            if (_model.dropDownRoleValue !=
                                                                    null &&
                                                                _model.dropDownRoleValue !=
                                                                    '')
                                                              FlutterFlowIconButton(
                                                                borderRadius:
                                                                    8.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .clear_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .dropDownRoleValueController
                                                                        ?.reset();
                                                                  });
                                                                },
                                                              ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: _model
                                                                          .pageState!
                                                                      ? Color(
                                                                          0x7D105DFB)
                                                                      : Color(
                                                                          0x00F0F0F0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: _model
                                                                            .pageState!
                                                                        ? Color(
                                                                            0x7D105DFB)
                                                                        : Color(
                                                                            0x00F0F0F0),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child:
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                    controller: _model
                                                                        .dropDownStateValueController ??= FormFieldController<
                                                                            String>(
                                                                        null),
                                                                    options: _model
                                                                        .clients
                                                                        .unique((e) => e
                                                                            .state!)
                                                                        .map((e) =>
                                                                            e.state)
                                                                        .withoutNulls
                                                                        .toList(),
                                                                    onChanged:
                                                                        (val) async {
                                                                      safeSetState(() =>
                                                                          _model.dropDownStateValue =
                                                                              val);
                                                                      _model.cities =
                                                                          [];
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.cities = _model
                                                                          .outputClients!
                                                                          .where((e) =>
                                                                              e.state ==
                                                                              _model
                                                                                  .dropDownStateValue)
                                                                          .toList()
                                                                          .map((e) => e
                                                                              .city)
                                                                          .withoutNulls
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                      safeSetState(
                                                                          () {});
                                                                      _model
                                                                          .pageState = _model.dropDownStateValue !=
                                                                              null &&
                                                                          _model.dropDownStateValue !=
                                                                              '';
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    height:
                                                                        40.0,
                                                                    searchHintTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    searchTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Geist Font Family',
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintText:
                                                                        'Select state',
                                                                    searchHintText:
                                                                        'Select state',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .search,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                    fillColor:
                                                                        Color(
                                                                            0xFFF0F0F0),
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderWidth:
                                                                        0.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        true,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            if (_model.dropDownStateValue !=
                                                                    null &&
                                                                _model.dropDownStateValue !=
                                                                    '')
                                                              FlutterFlowIconButton(
                                                                borderRadius:
                                                                    8.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .clear_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .dropDownStateValueController
                                                                        ?.reset();
                                                                    _model
                                                                        .dropDownCityValueController
                                                                        ?.reset();
                                                                  });
                                                                },
                                                              ),
                                                          ],
                                                        ),
                                                        if (_model.pageState ??
                                                            true)
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: _model
                                                                            .pageCity!
                                                                        ? Color(
                                                                            0x7D105DFB)
                                                                        : Color(
                                                                            0x00F0F0F0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: _model
                                                                              .pageCity!
                                                                          ? Color(
                                                                              0x7D105DFB)
                                                                          : Color(
                                                                              0x00F0F0F0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            5.0),
                                                                    child: FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                          .dropDownCityValueController ??= FormFieldController<
                                                                              String>(
                                                                          null),
                                                                      options: _model
                                                                          .cities
                                                                          .unique((e) =>
                                                                              e),
                                                                      onChanged:
                                                                          (val) async {
                                                                        safeSetState(() =>
                                                                            _model.dropDownCityValue =
                                                                                val);
                                                                        _model
                                                                            .pageCity = _model.dropDownCityValue !=
                                                                                null &&
                                                                            _model.dropDownCityValue !=
                                                                                '';
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      height:
                                                                          40.0,
                                                                      searchHintTextStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      searchTextStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintText:
                                                                          'Select city',
                                                                      searchHintText:
                                                                          'Select city',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .search_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      fillColor:
                                                                          Color(
                                                                              0xFFF0F0F0),
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderWidth:
                                                                          0.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          true,
                                                                      isMultiSelect:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (_model.dropDownCityValue !=
                                                                      null &&
                                                                  _model.dropDownCityValue !=
                                                                      '')
                                                                FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      8.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .clear_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .dropDownCityValueController
                                                                          ?.reset();
                                                                    });
                                                                  },
                                                                ),
                                                            ],
                                                          ),
                                                      ].divide(SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final listofusers =
                                                            listViewSearchuserassignmentsResponse
                                                                .jsonBody
                                                                .toList();

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount: listofusers
                                                              .length,
                                                          itemBuilder: (context,
                                                              listofusersIndex) {
                                                            final listofusersItem =
                                                                listofusers[
                                                                    listofusersIndex];
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child:
                                                                      Container(
                                                                    width: 20.0,
                                                                    height:
                                                                        20.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      (listofusersIndex +
                                                                              1)
                                                                          .toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Geist Font Family',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 5.0,
                                                                  height: 5.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x315A5C60),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            1.0,
                                                                            12.0,
                                                                            1.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          UserroleassignmentWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'userid':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                listofusersItem,
                                                                                r'''$.user_id''',
                                                                              ).toString(),
                                                                              ParamType.String,
                                                                            ),
                                                                            'pageNumber':
                                                                                serializeParam(
                                                                              widget.pageNumber,
                                                                              ParamType.int,
                                                                            ),
                                                                            'firstname':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                listofusersItem,
                                                                                r'''$.first_name''',
                                                                              ).toString(),
                                                                              ParamType.String,
                                                                            ),
                                                                            'lastname':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                listofusersItem,
                                                                                r'''$.last_name''',
                                                                              ).toString(),
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
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
                                                                              EdgeInsets.all(5.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Container(
                                                                                width: 300.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Row(
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
                                                                                              }(
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      listofusersItem,
                                                                                                      r'''$.first_name''',
                                                                                                    )?.toString(),
                                                                                                    'null',
                                                                                                  ),
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      listofusersItem,
                                                                                                      r'''$.last_name''',
                                                                                                    )?.toString(),
                                                                                                    'null',
                                                                                                  )),
                                                                                              'null',
                                                                                            ),
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Geist Font Family',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  letterSpacing: 0.0,
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
                                                                                                getJsonField(
                                                                                                  listofusersItem,
                                                                                                  r'''$.first_name''',
                                                                                                )?.toString(),
                                                                                                'null',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: 'Geist Font Family',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  getJsonField(
                                                                                                    listofusersItem,
                                                                                                    r'''$.last_name''',
                                                                                                  )?.toString(),
                                                                                                  'null',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      fontFamily: 'Geist Font Family',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            getJsonField(
                                                                                              listofusersItem,
                                                                                              r'''$.user_email''',
                                                                                            )?.toString(),
                                                                                            'null',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: 'Geist Font Family',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          'Last seen : ${functions.convertToCustomFormat(valueOrDefault<String>(
                                                                                            getJsonField(
                                                                                              listofusersItem,
                                                                                              r'''$.last_seen''',
                                                                                            )?.toString(),
                                                                                            'null',
                                                                                          ))}',
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: 'Geist Font Family',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 16.0)),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              FutureBuilder<List<UserClientAssignmentsRow>>(
                                                                                                future: UserClientAssignmentsTable().queryRows(
                                                                                                  queryFn: (q) => q.eqOrNull(
                                                                                                    'user_id',
                                                                                                    getJsonField(
                                                                                                      listofusersItem,
                                                                                                      r'''$.user_id''',
                                                                                                    ).toString(),
                                                                                                  ),
                                                                                                ),
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
                                                                                                  List<UserClientAssignmentsRow> textUserClientAssignmentsRowList = snapshot.data!;

                                                                                                  return Text(
                                                                                                    'Locations : (${textUserClientAssignmentsRowList.length.toString()}) ',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Geist Font Family',
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                  child: Builder(
                                                                                                    builder: (context) {
                                                                                                      final assignmentsList = getJsonField(
                                                                                                        listofusersItem,
                                                                                                        r'''$.assignments''',
                                                                                                      ).toList();

                                                                                                      return Wrap(
                                                                                                        spacing: 5.0,
                                                                                                        runSpacing: 5.0,
                                                                                                        alignment: WrapAlignment.start,
                                                                                                        crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                        direction: Axis.horizontal,
                                                                                                        runAlignment: WrapAlignment.start,
                                                                                                        verticalDirection: VerticalDirection.down,
                                                                                                        clipBehavior: Clip.none,
                                                                                                        children: List.generate(assignmentsList.length, (assignmentsListIndex) {
                                                                                                          final assignmentsListItem = assignmentsList[assignmentsListIndex];
                                                                                                          return Padding(
                                                                                                            padding: EdgeInsets.all(5.0),
                                                                                                            child: Container(
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0x3710FB29),
                                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                                              ),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsets.all(5.0),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      getJsonField(
                                                                                                                        assignmentsListItem,
                                                                                                                        r'''$.client_name''',
                                                                                                                      ).toString(),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Geist Font Family',
                                                                                                                            fontSize: 8.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      getJsonField(
                                                                                                                        assignmentsListItem,
                                                                                                                        r'''$.address''',
                                                                                                                      ).toString(),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Geist Font Family',
                                                                                                                            fontSize: 8.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        }),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
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
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 122.0,
                                                                                                  height: 33.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: () {
                                                                                                      if (getJsonField(
                                                                                                            listofusersItem,
                                                                                                            r'''$.role_name''',
                                                                                                          ) ==
                                                                                                          getJsonField(
                                                                                                            <String, String?>{
                                                                                                              'role_name': 'CSO',
                                                                                                            },
                                                                                                            r'''$.role_name''',
                                                                                                          )) {
                                                                                                        return Color(0x59C96F46);
                                                                                                      } else if (getJsonField(
                                                                                                            listofusersItem,
                                                                                                            r'''$.role_name''',
                                                                                                          ) ==
                                                                                                          getJsonField(
                                                                                                            <String, String?>{
                                                                                                              'role_name': 'Supervisor',
                                                                                                            },
                                                                                                            r'''$.role_name''',
                                                                                                          )) {
                                                                                                        return FlutterFlowTheme.of(context).accent1;
                                                                                                      } else if (getJsonField(
                                                                                                            listofusersItem,
                                                                                                            r'''$.role_name''',
                                                                                                          ) ==
                                                                                                          getJsonField(
                                                                                                            <String, String?>{
                                                                                                              'role_name': 'HOS',
                                                                                                            },
                                                                                                            r'''$.role_name''',
                                                                                                          )) {
                                                                                                        return Color(0x66EEE460);
                                                                                                      } else if (getJsonField(
                                                                                                            listofusersItem,
                                                                                                            r'''$.role_name''',
                                                                                                          ) ==
                                                                                                          getJsonField(
                                                                                                            <String, String?>{
                                                                                                              'role_name': 'Admin',
                                                                                                            },
                                                                                                            r'''$.role_name''',
                                                                                                          )) {
                                                                                                        return Color(0xFF82FA2A);
                                                                                                      } else if (getJsonField(
                                                                                                            listofusersItem,
                                                                                                            r'''$.role_name''',
                                                                                                          ) ==
                                                                                                          getJsonField(
                                                                                                            <String, String?>{
                                                                                                              'role_name': 'Visualizer',
                                                                                                            },
                                                                                                            r'''$.role_name''',
                                                                                                          )) {
                                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                                      } else {
                                                                                                        return Color(0x00E65454);
                                                                                                      }
                                                                                                    }(),
                                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsets.all(3.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Align(
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                getJsonField(
                                                                                                                  listofusersItem,
                                                                                                                  r'''$.role_name''',
                                                                                                                )?.toString(),
                                                                                                                'null',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Geist Font Family',
                                                                                                                    fontSize: 10.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                        child: FlutterFlowIconButton(
                                                                                          borderRadius: 8.0,
                                                                                          buttonSize: 30.0,
                                                                                          fillColor: FlutterFlowTheme.of(context).error,
                                                                                          icon: Icon(
                                                                                            Icons.delete_forever_sharp,
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            size: 10.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            _model.pageUserID = getJsonField(
                                                                                              listofusersItem,
                                                                                              r'''$.user_id''',
                                                                                            ).toString();
                                                                                            _model.pageUserfullname = '${getJsonField(
                                                                                              listofusersItem,
                                                                                              r'''$.first_name''',
                                                                                            ).toString()} ${getJsonField(
                                                                                              listofusersItem,
                                                                                              r'''$.last_name''',
                                                                                            ).toString()}';
                                                                                            _model.pageAcoountDeletionScreen = true;
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
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
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Number of rows: ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Text(
                                                          functions
                                                              .jSONLenght(
                                                                  listViewSearchuserassignmentsResponse
                                                                      .jsonBody)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Geist Font Family',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (_model.pageAcoountDeletionScreen)
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        30.0, 10.0, 30.0, 30.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3.0,
                                            color: Color(0x1A57636C),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                            spreadRadius: 0.0,
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Icon(
                                                Icons.warning_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                size: 44.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Text(
                                                'Delete Account',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              'Geist Font Family',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'This action is permanent and cannot be undone. All data associated with this account will be permanently deleted. ',
                                                    textAlign: TextAlign.center,
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
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 12.0, 0.0),
                                                  child: Text(
                                                    ' ${_model.pageUserfullname}',
                                                    textAlign: TextAlign.center,
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Container(
                                                width: 500.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 12.0,
                                                          12.0, 12.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Type ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Geist Font Family',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Text(
                                                            'delete this account',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Geist Font Family',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Text(
                                                            ' to confirm:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Geist Font Family',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .textController3,
                                                        focusNode: _model
                                                            .textFieldFocusNode2,
                                                        autofocus: false,
                                                        textInputAction:
                                                            TextInputAction
                                                                .done,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'delete this account',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Geist Font Family',
                                                                    color: Color(
                                                                        0x8F5A5C60),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Geist Font Family',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        minLines: 1,
                                                        validator: _model
                                                            .textController3Validator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  if (_model.textController3
                                                          .text ==
                                                      'delete this account') {
                                                    _model.outputofAccountDeletion =
                                                        await UserTable()
                                                            .delete(
                                                      matchingRows: (rows) =>
                                                          rows.eqOrNull(
                                                        'user_id',
                                                        _model.pageUserID,
                                                      ),
                                                      returnRows: true,
                                                    );
                                                    _model.pageAcoountDeletionScreen =
                                                        false;
                                                    safeSetState(() {});
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Successfully deleted this user',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );

                                                    context.pushNamed(
                                                        UsermanagementWidget
                                                            .routeName);
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'you did not type the correct phrase, try again.',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                      ),
                                                    );
                                                  }

                                                  safeSetState(() {});
                                                },
                                                text:
                                                    'Permanently Delete Account',
                                                options: FFButtonOptions(
                                                  width: 500.0,
                                                  height: 44.0,
                                                  padding: EdgeInsets.all(8.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Geist Font Family',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  _model.pageAcoountDeletionScreen =
                                                      false;
                                                  safeSetState(() {});
                                                },
                                                text: 'Cancel',
                                                options: FFButtonOptions(
                                                  width: 500.0,
                                                  height: 44.0,
                                                  padding: EdgeInsets.all(8.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Geist Font Family',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
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
