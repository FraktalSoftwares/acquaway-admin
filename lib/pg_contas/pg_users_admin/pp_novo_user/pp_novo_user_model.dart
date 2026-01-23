import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pp_novo_user_widget.dart' show PpNovoUserWidget;
import 'package:flutter/material.dart';

class PpNovoUserModel extends FlutterFlowModel<PpNovoUserWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txNome widget.
  FocusNode? txNomeFocusNode;
  TextEditingController? txNomeTextController;
  String? Function(BuildContext, String?)? txNomeTextControllerValidator;
  // State field(s) for txEmail widget.
  FocusNode? txEmailFocusNode;
  TextEditingController? txEmailTextController;
  String? Function(BuildContext, String?)? txEmailTextControllerValidator;
  // State field(s) for ddNivel widget.
  String? ddNivelValue;
  FormFieldController<String>? ddNivelValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txNomeFocusNode?.dispose();
    txNomeTextController?.dispose();

    txEmailFocusNode?.dispose();
    txEmailTextController?.dispose();
  }
}
