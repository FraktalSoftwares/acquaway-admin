import '/flutter_flow/flutter_flow_util.dart';
import 'pp_alterar_senha_widget.dart' show PpAlterarSenhaWidget;
import 'package:flutter/material.dart';

class PpAlterarSenhaModel extends FlutterFlowModel<PpAlterarSenhaWidget> {
  // State field(s) for txSenhaAtual widget.
  FocusNode? txSenhaAtualFocusNode;
  TextEditingController? txSenhaAtualTextController;
  bool? txSenhaAtualVisibility;
  String? Function(BuildContext, String?)? txSenhaAtualTextControllerValidator;
  
  // State field(s) for txNovaSenha widget.
  FocusNode? txNovaSenhaFocusNode;
  TextEditingController? txNovaSenhaTextController;
  bool? txNovaSenhaVisibility;
  String? Function(BuildContext, String?)? txNovaSenhaTextControllerValidator;
  
  // State field(s) for txConfirmarSenha widget.
  FocusNode? txConfirmarSenhaFocusNode;
  TextEditingController? txConfirmarSenhaTextController;
  bool? txConfirmarSenhaVisibility;
  String? Function(BuildContext, String?)? txConfirmarSenhaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    txSenhaAtualVisibility = false;
    txNovaSenhaVisibility = false;
    txConfirmarSenhaVisibility = false;
  }

  @override
  void dispose() {
    txSenhaAtualFocusNode?.dispose();
    txSenhaAtualTextController?.dispose();
    txNovaSenhaFocusNode?.dispose();
    txNovaSenhaTextController?.dispose();
    txConfirmarSenhaFocusNode?.dispose();
    txConfirmarSenhaTextController?.dispose();
  }
}
