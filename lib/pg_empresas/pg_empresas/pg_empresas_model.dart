import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pg_empresas_widget.dart' show PgEmpresasWidget;
import 'package:flutter/material.dart';

class PgEmpresasModel extends FlutterFlowModel<PgEmpresasWidget> {
  ///  Local state fields for this component.

  int? empresaSelecionada;

  String? stage = 'Geral';

  bool aprovacoes = false;

  int? empresaSelecionadaNaoAprovada;

  String? ordenacaoSelecionada;

  ///  State fields for stateful widgets in this component.

  // State field(s) for txBuscaEmpresa widget.
  FocusNode? txBuscaEmpresaFocusNode1;
  TextEditingController? txBuscaEmpresaTextController1;
  String? Function(BuildContext, String?)?
      txBuscaEmpresaTextController1Validator;
  // State field(s) for txBuscaAdminEmpresa widget.
  FocusNode? txBuscaAdminEmpresaFocusNode;
  TextEditingController? txBuscaAdminEmpresaTextController;
  String? Function(BuildContext, String?)?
      txBuscaAdminEmpresaTextControllerValidator;
  // State field(s) for txBuscaEmpresa widget.
  FocusNode? txBuscaEmpresaFocusNode2;
  TextEditingController? txBuscaEmpresaTextController2;
  String? Function(BuildContext, String?)?
      txBuscaEmpresaTextController2Validator;
  // State field(s) for txBuscaUsuariosEmpresa widget.
  FocusNode? txBuscaUsuariosEmpresaFocusNode;
  TextEditingController? txBuscaUsuariosEmpresaTextController;
  String? Function(BuildContext, String?)?
      txBuscaUsuariosEmpresaTextControllerValidator;
  // State field(s) for dropdown ordenacao widget.
  FormFieldController<String>? ddOrdenacaoValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txBuscaEmpresaFocusNode1?.dispose();
    txBuscaEmpresaTextController1?.dispose();

    txBuscaAdminEmpresaFocusNode?.dispose();
    txBuscaAdminEmpresaTextController?.dispose();

    txBuscaEmpresaFocusNode2?.dispose();
    txBuscaEmpresaTextController2?.dispose();

    txBuscaUsuariosEmpresaFocusNode?.dispose();
    txBuscaUsuariosEmpresaTextController?.dispose();
  }
}
