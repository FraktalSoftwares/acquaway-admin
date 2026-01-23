import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pg_avisos_widget.dart' show PgAvisosWidget;
import 'package:flutter/material.dart';

class PgAvisosModel extends FlutterFlowModel<PgAvisosWidget> {
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
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txBuscaEmpresaFocusNode?.dispose();
    txBuscaEmpresaTextController?.dispose();
  }
}
