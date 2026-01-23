import '/flutter_flow/flutter_flow_util.dart';
import 'pg_contas_widget.dart' show PgContasWidget;
import 'package:flutter/material.dart';

class PgContasModel extends FlutterFlowModel<PgContasWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  bool isDataUploading_uploadDataFch = false;
  FFUploadedFile uploadedLocalFile_uploadDataFch =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataFch = '';

  // State field(s) for txNome widget.
  FocusNode? txNomeFocusNode;
  TextEditingController? txNomeTextController;
  String? Function(BuildContext, String?)? txNomeTextControllerValidator;
  // State field(s) for txEmail widget.
  FocusNode? txEmailFocusNode;
  TextEditingController? txEmailTextController;
  String? Function(BuildContext, String?)? txEmailTextControllerValidator;
  // State field(s) for txSenha widget.
  FocusNode? txSenhaFocusNode;
  TextEditingController? txSenhaTextController;
  String? Function(BuildContext, String?)? txSenhaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    txNomeFocusNode?.dispose();
    txNomeTextController?.dispose();

    txEmailFocusNode?.dispose();
    txEmailTextController?.dispose();

    txSenhaFocusNode?.dispose();
    txSenhaTextController?.dispose();
  }
}
