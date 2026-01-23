import '/flutter_flow/flutter_flow_util.dart';
import 'pg_viagens_widget.dart' show PgViagensWidget;
import 'package:flutter/material.dart';

class PgViagensModel extends FlutterFlowModel<PgViagensWidget> {
  ///  Local state fields for this component.

  int? empresaSelecionada;

  String? stage = 'Geral';

  DateTime? dataInicio;

  DateTime? dataFim;

  ///  State fields for stateful widgets in this component.

  // State field(s) for txBuscaEmpresa widget.
  FocusNode? txBuscaEmpresaFocusNode;
  TextEditingController? txBuscaEmpresaTextController;
  String? Function(BuildContext, String?)?
      txBuscaEmpresaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txBuscaEmpresaFocusNode?.dispose();
    txBuscaEmpresaTextController?.dispose();
  }
}
