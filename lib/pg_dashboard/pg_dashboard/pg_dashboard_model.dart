import '/flutter_flow/flutter_flow_util.dart';
import 'pg_dashboard_widget.dart' show PgDashboardWidget;
import 'package:flutter/material.dart';

class PgDashboardModel extends FlutterFlowModel<PgDashboardWidget> {
  ///  Local state fields for this component.

  DateTime? dataInicio;

  DateTime? dataFim;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
