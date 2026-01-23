import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pp_detalhes_user_widget.dart' show PpDetalhesUserWidget;
import 'package:flutter/material.dart';

class PpDetalhesUserModel extends FlutterFlowModel<PpDetalhesUserWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for txNome widget.
  FocusNode? txNomeFocusNode;
  TextEditingController? txNomeTextController;
  String? Function(BuildContext, String?)? txNomeTextControllerValidator;
  
  // State field(s) for txEmail widget.
  FocusNode? txEmailFocusNode;
  TextEditingController? txEmailTextController;
  String? Function(BuildContext, String?)? txEmailTextControllerValidator;
  
  // State field(s) for ddNivelAcesso widget.
  String? ddNivelAcessoValue;
  FormFieldController<String>? ddNivelAcessoValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    txNomeFocusNode?.dispose();
    txNomeTextController?.dispose();
    txEmailFocusNode?.dispose();
    txEmailTextController?.dispose();
  }
}
