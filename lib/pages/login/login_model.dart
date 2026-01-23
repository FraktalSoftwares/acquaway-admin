import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txEmailLogin widget.
  FocusNode? txEmailLoginFocusNode;
  TextEditingController? txEmailLoginTextController;
  String? Function(BuildContext, String?)? txEmailLoginTextControllerValidator;
  // State field(s) for txSenhaLogin widget.
  FocusNode? txSenhaLoginFocusNode;
  TextEditingController? txSenhaLoginTextController;
  late bool txSenhaLoginVisibility;
  String? Function(BuildContext, String?)? txSenhaLoginTextControllerValidator;

  @override
  void initState(BuildContext context) {
    txSenhaLoginVisibility = false;
  }

  @override
  void dispose() {
    txEmailLoginFocusNode?.dispose();
    txEmailLoginTextController?.dispose();

    txSenhaLoginFocusNode?.dispose();
    txSenhaLoginTextController?.dispose();
  }
}
