import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'comp_option_list_model.dart';
export 'comp_option_list_model.dart';

///
///
class CompOptionListWidget extends StatefulWidget {
  const CompOptionListWidget({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  State<CompOptionListWidget> createState() => _CompOptionListWidgetState();
}

class _CompOptionListWidgetState extends State<CompOptionListWidget>
    with TickerProviderStateMixin {
  late CompOptionListModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompOptionListModel());

    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Container(
        width: 400.0,
        height: 350.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Container(
          width: double.infinity,
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
                spreadRadius: 0.0,
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      icon: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.archivedTaskOutput =
                            await InspectionTasksTable().update(
                          data: {
                            'is_published': false,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'task_id',
                            widget.id,
                          ),
                          returnRows: true,
                        );
                        _model.archivedInspectionFieldOutput =
                            await InspectionFieldsTable().update(
                          data: {
                            'is_published': false,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'task_id',
                            widget.id,
                          ),
                          returnRows: true,
                        );

                        context.pushNamed(ReporttemplatesWidget.routeName);

                        Navigator.pop(context);

                        safeSetState(() {});
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
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
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 9.0, 0.0),
                                    child: Icon(
                                      Icons.unarchive_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 15.0,
                                    ),
                                  ),
                                  Text(
                                    'Archive Template',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Geist Font Family',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.loading = true;
                        if (animationsMap['iconOnActionTriggerAnimation'] !=
                            null) {
                          await animationsMap['iconOnActionTriggerAnimation']!
                              .controller
                            ..reset()
                            ..repeat();
                        }
                        _model.outputExistingTask =
                            await InspectionTasksTable().queryRows(
                          queryFn: (q) => q.eqOrNull(
                            'task_id',
                            widget.id,
                          ),
                        );
                        _model.ouputNewlyCreatedTaskCopy =
                            await InspectionTasksTable().insert({
                          'is_published': true,
                          'task_name':
                              '${_model.outputExistingTask?.firstOrNull?.taskName}- Copy (${getCurrentTimestamp.toString()})',
                          'company_name': FFAppState().appAuthUserCompanyName,
                        });
                        _model.outputOfExistingTaskFields =
                            await InspectionFieldsTable().queryRows(
                          queryFn: (q) => q.eqOrNull(
                            'task_id',
                            widget.id,
                          ),
                        );
                        while (_model.iterator !=
                            _model.outputOfExistingTaskFields?.length) {
                          if (_model.outputOfExistingTaskFields
                                  ?.elementAtOrNull(_model.iterator)
                                  ?.fieldType ==
                              'single-choice') {
                            _model.outputOfExistingFieldOptions =
                                await ChoiceOptionsTable().queryRows(
                              queryFn: (q) => q.eqOrNull(
                                'field_id',
                                _model.outputOfExistingTaskFields
                                    ?.elementAtOrNull(_model.iterator)
                                    ?.fieldId,
                              ),
                            );
                            _model.outputNewlyCreatedOption =
                                await ChoiceOptionsTable().insert({
                              'choice': _model.outputOfExistingFieldOptions
                                  ?.firstOrNull?.choice,
                              'field_id': _model.outputOfExistingTaskFields
                                  ?.elementAtOrNull(_model.iterator)
                                  ?.fieldId,
                              'company_name':
                                  FFAppState().appAuthUserCompanyName,
                            });
                          } else {
                            _model.ouputNewlyCreatedTaskFieldCopy =
                                await InspectionFieldsTable().insert({
                              'is_published': true,
                              'company_name':
                                  FFAppState().appAuthUserCompanyName,
                              'field_name': _model.outputOfExistingTaskFields
                                  ?.elementAtOrNull(_model.iterator)
                                  ?.fieldName,
                              'field_type': _model.outputOfExistingTaskFields
                                  ?.elementAtOrNull(_model.iterator)
                                  ?.fieldType,
                              'is_required': _model.outputOfExistingTaskFields
                                  ?.elementAtOrNull(_model.iterator)
                                  ?.isRequired,
                              'task_id':
                                  _model.ouputNewlyCreatedTaskCopy?.taskId,
                            });
                          }

                          _model.iterator = _model.iterator + 1;
                          safeSetState(() {});
                        }
                        if (animationsMap['iconOnActionTriggerAnimation'] !=
                            null) {
                          animationsMap['iconOnActionTriggerAnimation']!
                              .controller
                              .stop();
                        }
                        _model.loading = false;
                        _model.updatePage(() {});
                        Navigator.pop(context);

                        safeSetState(() {});
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
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
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 9.0, 0.0),
                                    child: Icon(
                                      Icons.file_copy,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 15.0,
                                    ),
                                  ),
                                  Text(
                                    'Duplicate Template',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Geist Font Family',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.loading)
                                    Icon(
                                      Icons.change_circle_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 14.0,
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'iconOnActionTriggerAnimation']!,
                                    ),
                                ],
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
