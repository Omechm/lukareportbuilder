import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'menu_items_model.dart';
export 'menu_items_model.dart';

class MenuItemsWidget extends StatefulWidget {
  const MenuItemsWidget({
    super.key,
    this.menuItems,
    required this.pageNumber,
  });

  final List<MenuItemsRow>? menuItems;
  final int? pageNumber;

  @override
  State<MenuItemsWidget> createState() => _MenuItemsWidgetState();
}

class _MenuItemsWidgetState extends State<MenuItemsWidget> {
  late MenuItemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuItemsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.outputMenuItems = await MenuItemsTable().queryRows(
        queryFn: (q) => q.order('item_order', ascending: true),
      );
    });

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

    return Builder(
      builder: (context) {
        final paramMenuItemchildren = widget.menuItems
                ?.sortedList(keyOf: (e) => e.itemOrder!, desc: false)
                .toList() ??
            [];

        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(paramMenuItemchildren.length,
                (paramMenuItemchildrenIndex) {
              final paramMenuItemchildrenItem =
                  paramMenuItemchildren[paramMenuItemchildrenIndex];
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (paramMenuItemchildrenItem.menuItemName == 'Academy')
                    Container(
                      width: 1.0,
                      height: 100.0,
                      decoration: BoxDecoration(),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Container(
                      width: 201.43,
                      height: 25.0,
                      decoration: BoxDecoration(
                        color: FFAppState().appDashBoardMenuIsSelected == true
                            ? FlutterFlowTheme.of(context).secondaryBackground
                            : FlutterFlowTheme.of(context).primaryBackground,
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
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 4.0, 4.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              HomepageWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.bottomToTop,
                                ),
                              },
                            );

                            _model.refreshComp = 'refresh';
                            safeSetState(() {});
                            if (paramMenuItemchildrenItem.itemOrder == 1) {
                              if (Navigator.of(context).canPop()) {
                                context.pop();
                              }
                              context.pushNamed(
                                HomepageWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            } else {
                              if (paramMenuItemchildrenItem.itemOrder == 2) {
                                context.goNamed(
                                  ReportbuilderWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              } else {
                                if (paramMenuItemchildrenItem.itemOrder == 3) {
                                  context.goNamed(
                                    ReportsWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                } else {
                                  if (paramMenuItemchildrenItem.itemOrder ==
                                      4) {
                                    context.goNamed(
                                      ReporttemplatesWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  } else {
                                    if (paramMenuItemchildrenItem.itemOrder ==
                                        5) {
                                      context.goNamed(
                                        UsermanagementWidget.routeName,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    } else {
                                      if (paramMenuItemchildrenItem.itemOrder ==
                                          6) {
                                        if (Navigator.of(context).canPop()) {
                                          context.pop();
                                        }
                                        context.pushNamed(
                                          ClientmanagementWidget.routeName,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else {
                                        if (paramMenuItemchildrenItem
                                                .itemOrder ==
                                            7) {
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            AcademyWidget.routeName,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }

                            _model.refreshComp = 'neeew';
                            safeSetState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  paramMenuItemchildrenItem.menuItemName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Geist Font Family',
                                        color: widget.pageNumber ==
                                                paramMenuItemchildrenItem
                                                    .itemOrder
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
