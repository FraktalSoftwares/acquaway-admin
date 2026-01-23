import '/flutter_flow/flutter_flow_util.dart';
import 'pp_criar_novo_aviso_widget.dart' show PpCriarNovoAvisoWidget;
import 'package:flutter/material.dart';

class PpCriarNovoAvisoModel extends FlutterFlowModel<PpCriarNovoAvisoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtTitulo widget.
  FocusNode? txtTituloFocusNode;
  TextEditingController? txtTituloTextController;
  String? Function(BuildContext, String?)? txtTituloTextControllerValidator;
  // State field(s) for txDescricao widget.
  FocusNode? txDescricaoFocusNode;
  TextEditingController? txDescricaoTextController;
  String? Function(BuildContext, String?)? txDescricaoTextControllerValidator;
  // State field(s) for txDuracao widget.
  FocusNode? txDuracaoFocusNode;
  TextEditingController? txDuracaoTextController;
  String? Function(BuildContext, String?)? txDuracaoTextControllerValidator;
  // State field(s) for txRaio widget.
  FocusNode? txRaioFocusNode;
  TextEditingController? txRaioTextController;
  String? Function(BuildContext, String?)? txRaioTextControllerValidator;
  // State field(s) for txLat widget.
  FocusNode? txLatFocusNode;
  TextEditingController? txLatTextController;
  String? Function(BuildContext, String?)? txLatTextControllerValidator;
  // State field(s) for txLon widget.
  FocusNode? txLonFocusNode;
  TextEditingController? txLonTextController;
  String? Function(BuildContext, String?)? txLonTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtTituloFocusNode?.dispose();
    txtTituloTextController?.dispose();

    txDescricaoFocusNode?.dispose();
    txDescricaoTextController?.dispose();

    txDuracaoFocusNode?.dispose();
    txDuracaoTextController?.dispose();

    txRaioFocusNode?.dispose();
    txRaioTextController?.dispose();

    txLatFocusNode?.dispose();
    txLatTextController?.dispose();

    txLonFocusNode?.dispose();
    txLonTextController?.dispose();
  }
}
