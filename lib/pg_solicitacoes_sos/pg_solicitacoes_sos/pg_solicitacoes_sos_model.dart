import '/flutter_flow/flutter_flow_util.dart';
import 'pg_solicitacoes_sos_widget.dart' show PgSolicitacoesSosWidget;
import 'package:flutter/material.dart';

class PgSolicitacoesSosModel extends FlutterFlowModel<PgSolicitacoesSosWidget> {
  ///  Local state fields for this component.

  int? empresaSelecionada;

  String? stage = 'Geral';

  String textoBusca = '';

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
