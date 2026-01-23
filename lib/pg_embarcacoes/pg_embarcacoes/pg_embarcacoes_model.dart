import '/flutter_flow/flutter_flow_util.dart';
import 'pg_embarcacoes_widget.dart' show PgEmbarcacoesWidget;
import 'package:flutter/material.dart';
import '/flutter_flow/form_field_controller.dart';

class PgEmbarcacoesModel extends FlutterFlowModel<PgEmbarcacoesWidget> {
  ///  Local state fields for this component.

  int? embarcacaoSelecionada;

  String? stage = 'Geral';

  DateTime? dataInicio;

  DateTime? dataFim;

  String? filtroStatus;

  ///  State fields for stateful widgets in this component.

  // State field(s) for txBuscaEmbarcacoes widget.
  FocusNode? txBuscaEmbarcacoesFocusNode;
  TextEditingController? txBuscaEmbarcacoesTextController;
  String? Function(BuildContext, String?)?
      txBuscaEmbarcacoesTextControllerValidator;
  // State field(s) for txBuscaEmpresa widget.
  FocusNode? txBuscaEmpresaFocusNode;
  TextEditingController? txBuscaEmpresaTextController;
  String? Function(BuildContext, String?)?
      txBuscaEmpresaTextControllerValidator;
  // State field(s) for filtroStatus dropdown.
  FormFieldController<String>? filtroStatusValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txBuscaEmbarcacoesFocusNode?.dispose();
    txBuscaEmbarcacoesTextController?.dispose();

    txBuscaEmpresaFocusNode?.dispose();
    txBuscaEmpresaTextController?.dispose();
  }
}
