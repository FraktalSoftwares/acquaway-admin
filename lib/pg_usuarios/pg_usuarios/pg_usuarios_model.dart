import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'pg_usuarios_widget.dart' show PgUsuariosWidget;
import 'package:flutter/material.dart';

class PgUsuariosModel extends FlutterFlowModel<PgUsuariosWidget> {
  ///  Local state fields for this component.

  String? userSelecionado;

  String stage = 'Geral';

  int? empresaSelecionada;

  String? ordenacaoSelecionada;

  bool mostrarModalDesativar = false;

  bool mostrarModalAtivar = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for txBuscaAdminEmpresa widget.
  FocusNode? txBuscaAdminEmpresaFocusNode1;
  TextEditingController? txBuscaAdminEmpresaTextController1;
  String? Function(BuildContext, String?)?
  txBuscaAdminEmpresaTextController1Validator;
  Completer<List<UsersRow>>? requestCompleter;
  // State field(s) for txBuscaPilotosIndi widget.
  FocusNode? txBuscaPilotosIndiFocusNode;
  TextEditingController? txBuscaPilotosIndiTextController;
  String? Function(BuildContext, String?)?
  txBuscaPilotosIndiTextControllerValidator;
  // State field(s) for txBuscaPilotosEmpresa widget.
  FocusNode? txBuscaPilotosEmpresaFocusNode;
  TextEditingController? txBuscaPilotosEmpresaTextController;
  String? Function(BuildContext, String?)?
  txBuscaPilotosEmpresaTextControllerValidator;
  // State field(s) for txBuscaAdminEmpresa widget.
  FocusNode? txBuscaAdminEmpresaFocusNode2;
  TextEditingController? txBuscaAdminEmpresaTextController2;
  String? Function(BuildContext, String?)?
  txBuscaAdminEmpresaTextController2Validator;
  // State field(s) for dropdown ordenacao widget.
  FormFieldController<String>? ddOrdenacaoValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    txBuscaAdminEmpresaFocusNode1?.dispose();
    txBuscaAdminEmpresaTextController1?.dispose();

    txBuscaPilotosIndiFocusNode?.dispose();
    txBuscaPilotosIndiTextController?.dispose();

    txBuscaPilotosEmpresaFocusNode?.dispose();
    txBuscaPilotosEmpresaTextController?.dispose();

    txBuscaAdminEmpresaFocusNode2?.dispose();
    txBuscaAdminEmpresaTextController2?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
