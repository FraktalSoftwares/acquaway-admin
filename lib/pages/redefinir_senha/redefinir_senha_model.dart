import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'redefinir_senha_widget.dart' show RedefinirSenhaWidget;
import 'package:flutter/material.dart';

class RedefinirSenhaModel extends FlutterFlowModel<RedefinirSenhaWidget> {
  ///  State fields for stateful widgets in this page.

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

  bool isLoading = false;
  bool tokenProcessed = false;
  bool tokenValid = false;

  @override
  void initState(BuildContext context) {
    txNovaSenhaVisibility = false;
    txConfirmarSenhaVisibility = false;
  }

  @override
  void dispose() {
    txNovaSenhaFocusNode?.dispose();
    txNovaSenhaTextController?.dispose();

    txConfirmarSenhaFocusNode?.dispose();
    txConfirmarSenhaTextController?.dispose();
  }
}
