import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'recuperar_senha_widget.dart' show RecuperarSenhaWidget;
import 'package:flutter/material.dart';

enum RecuperarSenhaState {
  emailInput,
  emailEnviado,
  redefinirSenha,
  sucesso,
}

class RecuperarSenhaModel extends FlutterFlowModel<RecuperarSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  RecuperarSenhaState currentState = RecuperarSenhaState.emailInput;
  String? emailEnviado;

  // State field(s) for txEmail widget.
  FocusNode? txEmailFocusNode;
  TextEditingController? txEmailTextController;
  String? Function(BuildContext, String?)? txEmailTextControllerValidator;

  // State field(s) for txNovaSenha widget.
  FocusNode? txNovaSenhaFocusNode;
  TextEditingController? txNovaSenhaTextController;
  late bool txNovaSenhaVisibility;
  String? Function(BuildContext, String?)? txNovaSenhaTextControllerValidator;

  // State field(s) for txConfirmarSenha widget.
  FocusNode? txConfirmarSenhaFocusNode;
  TextEditingController? txConfirmarSenhaTextController;
  late bool txConfirmarSenhaVisibility;
  String? Function(BuildContext, String?)? txConfirmarSenhaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    txNovaSenhaVisibility = false;
    txConfirmarSenhaVisibility = false;
  }

  @override
  void dispose() {
    txEmailFocusNode?.dispose();
    txEmailTextController?.dispose();

    txNovaSenhaFocusNode?.dispose();
    txNovaSenhaTextController?.dispose();

    txConfirmarSenhaFocusNode?.dispose();
    txConfirmarSenhaTextController?.dispose();
  }
}
