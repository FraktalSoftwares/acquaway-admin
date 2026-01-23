import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pp_alterar_senha_model.dart';
export 'pp_alterar_senha_model.dart';

class PpAlterarSenhaWidget extends StatefulWidget {
  const PpAlterarSenhaWidget({super.key});

  @override
  State<PpAlterarSenhaWidget> createState() => _PpAlterarSenhaWidgetState();
}

class _PpAlterarSenhaWidgetState extends State<PpAlterarSenhaWidget> {
  late PpAlterarSenhaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PpAlterarSenhaModel());

    _model.txSenhaAtualTextController ??= TextEditingController();
    _model.txSenhaAtualFocusNode ??= FocusNode();

    _model.txNovaSenhaTextController ??= TextEditingController();
    _model.txNovaSenhaFocusNode ??= FocusNode();

    _model.txConfirmarSenhaTextController ??= TextEditingController();
    _model.txConfirmarSenhaFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  Future<void> _showEsqueciSenhaDialog() async {
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: const AlignmentDirectional(
            0.0,
            0.0,
          ).resolve(Directionality.of(context)),
          child: WebViewAware(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400.0),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  16.0,
                  16.0,
                  16.0,
                  24.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Alterar Senha',
                            style: FlutterFlowTheme.of(
                              context,
                            ).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).bodyMedium.fontStyle,
                              ),
                              color: const Color(0xFF323334),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).bodyMedium.fontStyle,
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Color(0xFF323334),
                            size: 24.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(dialogContext);
                          },
                        ),
                      ].divide(const SizedBox(width: 12.0)),
                    ),
                    Text(
                      'Esqueceu sua senha?',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: const Color(0xFF323334),
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                    ),
                    Text(
                      'Não se preocupe! Enviaremos um link para recuperar sua senha para o email cadastrado na sua conta',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: const Color(0xFF646768),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(dialogContext);
                          },
                          text: 'Cancelar',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0,
                              0.0,
                              16.0,
                              0.0,
                            ),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              0.0,
                              0.0,
                              0.0,
                            ),
                            color: const Color(0x00007191),
                            textStyle: FlutterFlowTheme.of(
                              context,
                            ).titleSmall.override(
                              font: GoogleFonts.interTight(
                                fontWeight:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).titleSmall.fontWeight,
                                fontStyle:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).titleSmall.fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.0,
                              fontWeight:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).titleSmall.fontWeight,
                              fontStyle:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).titleSmall.fontStyle,
                            ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            if (currentUserEmail.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('E-mail é obrigatório!'),
                                ),
                              );
                              return;
                            }
                            await authManager.resetPassword(
                              email: currentUserEmail,
                              context: dialogContext,
                            );
                            Navigator.pop(dialogContext);
                            Navigator.pop(context);
                            _showEmailEnviadoDialog();
                          },
                          text: 'Enviar',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0,
                              0.0,
                              16.0,
                              0.0,
                            ),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              0.0,
                              0.0,
                              0.0,
                            ),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(
                              context,
                            ).titleSmall.override(
                              font: GoogleFonts.interTight(
                                fontWeight:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).titleSmall.fontWeight,
                                fontStyle:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).titleSmall.fontStyle,
                              ),
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).titleSmall.fontWeight,
                              fontStyle:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).titleSmall.fontStyle,
                            ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ].divide(const SizedBox(width: 12.0)),
                    ),
                  ].divide(const SizedBox(height: 12.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showEmailEnviadoDialog() async {
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: const AlignmentDirectional(
            0.0,
            0.0,
          ).resolve(Directionality.of(context)),
          child: WebViewAware(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400.0),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  16.0,
                  16.0,
                  16.0,
                  24.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Alterar Senha',
                            style: FlutterFlowTheme.of(
                              context,
                            ).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).bodyMedium.fontStyle,
                              ),
                              color: const Color(0xFF323334),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).bodyMedium.fontStyle,
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Color(0xFF323334),
                            size: 24.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(dialogContext);
                          },
                        ),
                      ].divide(const SizedBox(width: 12.0)),
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF90C74F),
                          width: 2.0,
                        ),
                      ),
                      child: const Icon(
                        Icons.check_rounded,
                        color: Color(0xFF90C74F),
                        size: 48.0,
                      ),
                    ),
                    Text(
                      'Email enviado',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: const Color(0xFF323334),
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(dialogContext);
                      },
                      text: 'Voltar para minha conta',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0,
                          0.0,
                          16.0,
                          0.0,
                        ),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          0.0,
                          0.0,
                          0.0,
                        ),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(
                          context,
                        ).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight:
                                FlutterFlowTheme.of(
                                  context,
                                ).titleSmall.fontWeight,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).titleSmall.fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).titleSmall.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ].divide(const SizedBox(height: 12.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400.0),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Alterar Senha',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: const Color(0xFF323334),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Color(0xFF323334),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ].divide(const SizedBox(width: 12.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Senha atual',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).bodyMedium.fontStyle,
                          ),
                          color: const Color(0xFF323334),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      const Text(
                        '*',
                        style: TextStyle(
                          color: Color(0xFF90C74F),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.txSenhaAtualTextController,
                      focusNode: _model.txSenhaAtualFocusNode,
                      autofocus: false,
                      obscureText: !_model.txSenhaAtualVisibility!,
                      decoration: InputDecoration(
                        isDense: true,
                        suffixIcon: InkWell(
                          onTap:
                              () => setState(
                                () =>
                                    _model.txSenhaAtualVisibility =
                                        !_model.txSenhaAtualVisibility!,
                              ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            _model.txSenhaAtualVisibility!
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFF646768),
                            size: 20.0,
                          ),
                        ),
                        labelStyle: FlutterFlowTheme.of(
                          context,
                        ).labelMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontWeight,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontStyle,
                        ),
                        hintText: 'Digite sua senha atual',
                        hintStyle: FlutterFlowTheme.of(
                          context,
                        ).labelMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontWeight,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontStyle,
                          ),
                          color: const Color(0xFFB1B3B4),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontStyle,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFE5E6E6),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFE5E6E6),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).bodyMedium.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.txSenhaAtualTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await _showEsqueciSenhaDialog();
                    },
                    child: Text(
                      'Esqueci minha senha',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: const Color(0xFF007191),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                    ),
                  ),
                ].divide(const SizedBox(height: 8.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Nova senha',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).bodyMedium.fontStyle,
                          ),
                          color: const Color(0xFF323334),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      const Text(
                        '*',
                        style: TextStyle(
                          color: Color(0xFF90C74F),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.txNovaSenhaTextController,
                      focusNode: _model.txNovaSenhaFocusNode,
                      autofocus: false,
                      obscureText: !_model.txNovaSenhaVisibility!,
                      decoration: InputDecoration(
                        isDense: true,
                        suffixIcon: InkWell(
                          onTap:
                              () => setState(
                                () =>
                                    _model.txNovaSenhaVisibility =
                                        !_model.txNovaSenhaVisibility!,
                              ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            _model.txNovaSenhaVisibility!
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFF646768),
                            size: 20.0,
                          ),
                        ),
                        labelStyle: FlutterFlowTheme.of(
                          context,
                        ).labelMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontWeight,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontStyle,
                        ),
                        hintText: 'Digite sua nova senha',
                        hintStyle: FlutterFlowTheme.of(
                          context,
                        ).labelMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontWeight,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontStyle,
                          ),
                          color: const Color(0xFFB1B3B4),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontStyle,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFE5E6E6),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFE5E6E6),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).bodyMedium.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.txNovaSenhaTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ].divide(const SizedBox(height: 8.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Confirme a nova senha',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).bodyMedium.fontStyle,
                          ),
                          color: const Color(0xFF323334),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      const Text(
                        '*',
                        style: TextStyle(
                          color: Color(0xFF90C74F),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.txConfirmarSenhaTextController,
                      focusNode: _model.txConfirmarSenhaFocusNode,
                      autofocus: false,
                      obscureText: !_model.txConfirmarSenhaVisibility!,
                      decoration: InputDecoration(
                        isDense: true,
                        suffixIcon: InkWell(
                          onTap:
                              () => setState(
                                () =>
                                    _model.txConfirmarSenhaVisibility =
                                        !_model.txConfirmarSenhaVisibility!,
                              ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            _model.txConfirmarSenhaVisibility!
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFF646768),
                            size: 20.0,
                          ),
                        ),
                        labelStyle: FlutterFlowTheme.of(
                          context,
                        ).labelMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontWeight,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontStyle,
                        ),
                        hintText: 'Confirme sua nova senha',
                        hintStyle: FlutterFlowTheme.of(
                          context,
                        ).labelMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontWeight,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontStyle,
                          ),
                          color: const Color(0xFFB1B3B4),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontStyle,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFE5E6E6),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFE5E6E6),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).bodyMedium.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.txConfirmarSenhaTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ].divide(const SizedBox(height: 8.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'Cancelar',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0,
                        0.0,
                        16.0,
                        0.0,
                      ),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                      ),
                      color: const Color(0x00007191),
                      textStyle: FlutterFlowTheme.of(
                        context,
                      ).titleSmall.override(
                        font: GoogleFonts.interTight(
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).titleSmall.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      // Validações
                      if (_model.txSenhaAtualTextController?.text.isEmpty ??
                          true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Por favor, digite sua senha atual'),
                          ),
                        );
                        return;
                      }

                      if (_model.txNovaSenhaTextController?.text.isEmpty ??
                          true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Por favor, digite sua nova senha'),
                          ),
                        );
                        return;
                      }

                      if (_model.txNovaSenhaTextController!.text.length < 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'A nova senha deve ter pelo menos 6 caracteres',
                            ),
                          ),
                        );
                        return;
                      }

                      if (_model.txConfirmarSenhaTextController?.text.isEmpty ??
                          true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Por favor, confirme sua nova senha'),
                          ),
                        );
                        return;
                      }

                      if (_model.txNovaSenhaTextController!.text !=
                          _model.txConfirmarSenhaTextController!.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'As senhas não coincidem. Por favor, verifique.',
                            ),
                          ),
                        );
                        return;
                      }

                      // Verificar senha atual tentando fazer login
                      // No Supabase, fazer signIn com o mesmo usuário apenas atualiza a sessão
                      try {
                        final user = await authManager.signInWithEmail(
                          context,
                          currentUserEmail,
                          _model.txSenhaAtualTextController!.text,
                        );

                        if (user == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Senha atual incorreta. Por favor, verifique.',
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        // Se chegou aqui, a senha está correta, então atualiza
                        await authManager.updatePassword(
                          newPassword: _model.txNovaSenhaTextController!.text,
                          context: context,
                        );

                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Senha alterada com sucesso!'),
                            backgroundColor: Color(0xFF90C74F),
                          ),
                        );
                      } catch (e) {
                        // Captura erros de autenticação
                        String errorMessage =
                            'Erro ao alterar senha. Tente novamente.';
                        if (e.toString().contains(
                              'Invalid login credentials',
                            ) ||
                            e.toString().contains('Email not confirmed') ||
                            e.toString().contains('Invalid password')) {
                          errorMessage =
                              'Senha atual incorreta. Por favor, verifique.';
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(errorMessage),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    text: 'Confirmar',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0,
                        0.0,
                        16.0,
                        0.0,
                      ),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                      ),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(
                        context,
                      ).titleSmall.override(
                        font: GoogleFonts.interTight(
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).titleSmall.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ].divide(const SizedBox(width: 12.0)),
              ),
            ].divide(const SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
