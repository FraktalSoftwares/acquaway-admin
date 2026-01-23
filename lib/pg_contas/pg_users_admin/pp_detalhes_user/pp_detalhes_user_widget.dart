import '/backend/supabase/supabase.dart';
import '/backend/supabase/database/tables/users.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/core/validators/validators.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pp_detalhes_user_model.dart';
export 'pp_detalhes_user_model.dart';

class PpDetalhesUserWidget extends StatefulWidget {
  const PpDetalhesUserWidget({super.key, required this.user});

  final UsersRow user;

  @override
  State<PpDetalhesUserWidget> createState() => _PpDetalhesUserWidgetState();
}

class _PpDetalhesUserWidgetState extends State<PpDetalhesUserWidget>
    with TickerProviderStateMixin {
  late PpDetalhesUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PpDetalhesUserModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.txNomeTextController ??= TextEditingController(
      text: widget.user.nome ?? '',
    );
    _model.txNomeFocusNode ??= FocusNode();
    _model.txNomeTextControllerValidator ??=
        (context, value) => Validators.required(value, 'Nome');

    _model.txEmailTextController ??= TextEditingController(
      text: widget.user.email ?? '',
    );
    _model.txEmailFocusNode ??= FocusNode();
    _model.txEmailTextControllerValidator ??=
        (context, value) => Validators.email(value);

    _model.ddNivelAcessoValue = widget.user.tipoUser ?? 'Moderador';
    _model.ddNivelAcessoValueController ??= FormFieldController<String>(
      _model.ddNivelAcessoValue,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
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
                            'Redefinição de senha',
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
                      'E-mail enviado',
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
                      'Enviamos um e-mail para ${widget.user.email ?? 'nome@email.com'} com um link para redefinição de senha.',
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
                    FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(dialogContext);
                      },
                      text: 'Entendi',
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

  Future<void> _showExcluirUserDialog() async {
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
                            'Excluir usuário',
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
                        border: Border.all(color: Colors.red, width: 2.0),
                      ),
                      child: const Icon(
                        Icons.warning_rounded,
                        color: Colors.red,
                        size: 48.0,
                      ),
                    ),
                    Text(
                      'Deseja excluir este usuário?',
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
                      'Esta ação é irreversível. Ao prosseguir, o usuário não terá mais acesso ao painel administrativo.',
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
                            try {
                              // Excluir da tabela users
                              await UsersTable().delete(
                                matchingRows:
                                    (rows) => rows.eq('id', widget.user.id),
                              );

                              // Excluir do Auth (usando Admin API seria necessário, mas por enquanto apenas marcamos como inativo)
                              // Nota: A exclusão do Auth requer Admin API, então vamos apenas marcar como inativo
                              await UsersTable().update(
                                data: {'ativo': false},
                                matchingRows:
                                    (rows) => rows.eq('id', widget.user.id),
                              );

                              Navigator.pop(dialogContext);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Usuário excluído com sucesso!',
                                  ),
                                  backgroundColor: Color(0xFF90C74F),
                                ),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Erro ao excluir usuário: ${e.toString()}',
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          text: 'Sim, excluir usuário',
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
                            color: Colors.red,
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

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800.0, maxHeight: 700.0),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Detalhes do usuário',
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
                ],
              ),
              Align(
                alignment: const Alignment(-1.0, 0),
                child: TabBar(
                  isScrollable: true,
                  labelColor: const Color(0xFF323234),
                  unselectedLabelColor: const Color(0xFF323234),
                  labelPadding: const EdgeInsetsDirectional.fromSTEB(
                    24.0,
                    0.0,
                    24.0,
                    0.0,
                  ),
                  labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    ),
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleMedium.fontStyle,
                  ),
                  unselectedLabelStyle: FlutterFlowTheme.of(
                    context,
                  ).titleMedium.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    ),
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleMedium.fontStyle,
                  ),
                  indicatorColor: const Color(0xFF90C74F),
                  indicatorWeight: 2.0,
                  tabs: const [
                    Tab(text: 'Informações gerais'),
                    Tab(text: 'Histórico de atividades'),
                  ],
                  controller: _model.tabBarController,
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _model.tabBarController,
                  children: [
                    // Aba Informações gerais
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          24.0,
                          0.0,
                          24.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Foto de perfil
                            Center(
                              child: Container(
                                width: 120.0,
                                height: 120.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    widget.user.foto,
                                    'https://picsum.photos/seed/779/600',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24.0),
                            // Campo Nome
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Nome',
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
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle:
                                            FlutterFlowTheme.of(
                                              context,
                                            ).bodyMedium.fontStyle,
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
                                const SizedBox(height: 8.0),
                                SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.txNomeTextController,
                                    focusNode: _model.txNomeFocusNode,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      isDense: true,
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
                                      ),
                                      hintText: 'Nome',
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
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFE5E6E6),
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFE5E6E6),
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              FlutterFlowTheme.of(
                                                context,
                                              ).error,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              FlutterFlowTheme.of(
                                                context,
                                              ).error,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xFFFAFAFA),
                                    ),
                                    style: FlutterFlowTheme.of(
                                      context,
                                    ).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight:
                                            FlutterFlowTheme.of(
                                              context,
                                            ).bodyMedium.fontWeight,
                                        fontStyle:
                                            FlutterFlowTheme.of(
                                              context,
                                            ).bodyMedium.fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                    ),
                                    validator: _model
                                        .txNomeTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            // Campo E-mail
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'E-mail',
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
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle:
                                            FlutterFlowTheme.of(
                                              context,
                                            ).bodyMedium.fontStyle,
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
                                const SizedBox(height: 8.0),
                                SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.txEmailTextController,
                                    focusNode: _model.txEmailFocusNode,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      isDense: true,
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
                                      ),
                                      hintText: 'E-mail',
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
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFE5E6E6),
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFE5E6E6),
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              FlutterFlowTheme.of(
                                                context,
                                              ).error,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              FlutterFlowTheme.of(
                                                context,
                                              ).error,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xFFFAFAFA),
                                    ),
                                    style: FlutterFlowTheme.of(
                                      context,
                                    ).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight:
                                            FlutterFlowTheme.of(
                                              context,
                                            ).bodyMedium.fontWeight,
                                        fontStyle:
                                            FlutterFlowTheme.of(
                                              context,
                                            ).bodyMedium.fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                    ),
                                    validator: _model
                                        .txEmailTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            // Campo Nível de acesso
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Nível de acesso',
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
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle:
                                            FlutterFlowTheme.of(
                                              context,
                                            ).bodyMedium.fontStyle,
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
                                const SizedBox(height: 8.0),
                                FlutterFlowDropDown<String>(
                                  controller:
                                      _model.ddNivelAcessoValueController ??=
                                          FormFieldController<String>(
                                            _model.ddNivelAcessoValue,
                                          ),
                                  options: const ['Admin', 'Moderador'],
                                  optionLabels: const [
                                    'Administrador',
                                    'Moderador',
                                  ],
                                  onChanged:
                                      (val) => safeSetState(
                                        () => _model.ddNivelAcessoValue = val,
                                      ),
                                  width: double.infinity,
                                  height: 44.0,
                                  textStyle: FlutterFlowTheme.of(
                                    context,
                                  ).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontWeight,
                                      fontStyle:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                  ),
                                  hintText: 'Selecione',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: const Color(0xFFFAFAFA),
                                  elevation: 2.0,
                                  borderColor: const Color(0xFFE5E6E6),
                                  borderWidth: 0.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                    12.0,
                                    0.0,
                                    12.0,
                                    0.0,
                                  ),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ],
                            ),
                            const SizedBox(height: 24.0),
                            // Link Enviar e-mail de redefinição de senha
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (widget.user.email == null ||
                                    widget.user.email!.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('E-mail não encontrado'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                // Mostrar loading
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (loadingContext) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                );

                                try {
                                  // Enviar email de reset de senha
                                  await SupaFlow.client.auth
                                      .resetPasswordForEmail(
                                        widget.user.email!.trim(),
                                      );

                                  // Fechar loading
                                  if (mounted) {
                                    Navigator.pop(context);
                                  }

                                  // Se chegou aqui, o email foi enviado com sucesso
                                  await _showEmailEnviadoDialog();
                                } catch (e) {
                                  // Fechar loading
                                  if (mounted) {
                                    Navigator.pop(context);
                                  }

                                  // Tratar erro
                                  String errorMessage =
                                      'Erro ao enviar e-mail. Tente novamente.';

                                  final errorString =
                                      e.toString().toLowerCase();

                                  if (errorString.contains('user not found') ||
                                      errorString.contains('not found') ||
                                      errorString.contains('does not exist')) {
                                    errorMessage =
                                        'Usuário não encontrado no sistema de autenticação.';
                                  } else if (errorString.contains(
                                        'invalid email',
                                      ) ||
                                      errorString.contains('email format')) {
                                    errorMessage =
                                        'E-mail inválido. Verifique o formato.';
                                  } else if (errorString.contains(
                                        'rate limit',
                                      ) ||
                                      errorString.contains('too many')) {
                                    errorMessage =
                                        'Muitas tentativas. Aguarde alguns minutos e tente novamente.';
                                  } else if (errorString.contains(
                                    'email not confirmed',
                                  )) {
                                    errorMessage =
                                        'E-mail não confirmado. O usuário precisa confirmar o e-mail primeiro.';
                                  }

                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(errorMessage),
                                        backgroundColor: Colors.red,
                                        duration: const Duration(seconds: 4),
                                      ),
                                    );
                                  }
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Enviar e-mail de redefinição de senha',
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
                                      color: const Color(0xFF90C74F),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            // Link Excluir usuário
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await _showExcluirUserDialog();
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                    size: 20.0,
                                  ),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    'Excluir usuário',
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
                                      color: Colors.red,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24.0),
                            // Botão Salvar alterações
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  // Validações
                                  if (_model
                                          .txNomeTextController
                                          ?.text
                                          .isEmpty ??
                                      true) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Por favor, preencha o nome',
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                    return;
                                  }

                                  final emailError = _model
                                      .txEmailTextControllerValidator
                                      ?.call(
                                        context,
                                        _model.txEmailTextController!.text,
                                      );
                                  if (emailError != null &&
                                      emailError.isNotEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(emailError),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                    return;
                                  }

                                  try {
                                    // Atualizar na tabela users
                                    await UsersTable().update(
                                      data: {
                                        'nome':
                                            _model.txNomeTextController!.text,
                                        'email':
                                            _model.txEmailTextController!.text,
                                        'tipo_user': _model.ddNivelAcessoValue,
                                      },
                                      matchingRows:
                                          (rows) =>
                                              rows.eq('id', widget.user.id),
                                    );

                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Alterações salvas com sucesso!',
                                        ),
                                        backgroundColor: Color(0xFF90C74F),
                                      ),
                                    );
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Erro ao salvar alterações: ${e.toString()}',
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                                text: 'Salvar alterações',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0,
                                    0.0,
                                    16.0,
                                    0.0,
                                  ),
                                  iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Aba Histórico de atividades
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          24.0,
                          0.0,
                          24.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Cabeçalho da tabela
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Data',
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
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontStyle,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Atividade',
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
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontStyle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              height: 24.0,
                              thickness: 1.0,
                              color: Color(0xFFE5E6E6),
                            ),
                            // Lista de atividades (placeholder por enquanto)
                            Text(
                              'Nenhuma atividade registrada ainda.',
                              style: FlutterFlowTheme.of(
                                context,
                              ).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.normal,
                                  fontStyle:
                                      FlutterFlowTheme.of(
                                        context,
                                      ).bodyMedium.fontStyle,
                                ),
                                color: const Color(0xFF646768),
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                fontStyle:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).bodyMedium.fontStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
