import '/components/sidebarnav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'twst_widget.dart' show TwstWidget;
import 'package:flutter/material.dart';

class TwstModel extends FlutterFlowModel<TwstWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sidebarnav component.
  late SidebarnavModel sidebarnavModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {
    sidebarnavModel = createModel(context, () => SidebarnavModel());
  }

  @override
  void dispose() {
    sidebarnavModel.dispose();
    tabBarController?.dispose();
  }
}
