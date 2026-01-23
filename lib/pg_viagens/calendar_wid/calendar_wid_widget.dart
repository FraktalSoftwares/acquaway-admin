import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'calendar_wid_model.dart';
export 'calendar_wid_model.dart';

class CalendarWidWidget extends StatefulWidget {
  const CalendarWidWidget({super.key, this.actionRetorn});

  final Future Function(DateTime? dataInicio, DateTime? dataFim)? actionRetorn;

  @override
  State<CalendarWidWidget> createState() => _CalendarWidWidgetState();
}

class _CalendarWidWidgetState extends State<CalendarWidWidget> {
  late CalendarWidModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarWidModel());

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
      width: 364.0,
      height: 417.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: custom_widgets.CalendarPeriodo(
          width: double.infinity,
          height: double.infinity,
          saidas: (dataInicio, dataFim) async {
            await widget.actionRetorn?.call(dataInicio, dataFim);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
