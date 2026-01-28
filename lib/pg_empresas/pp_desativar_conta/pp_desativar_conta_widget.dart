import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pp_desativar_conta_model.dart';
export 'pp_desativar_conta_model.dart';

class PpDesativarContaWidget extends StatefulWidget {
  const PpDesativarContaWidget({super.key, required this.idEmpresa});

  final int? idEmpresa;

  @override
  State<PpDesativarContaWidget> createState() => _PpDesativarContaWidgetState();
}

class _PpDesativarContaWidgetState extends State<PpDesativarContaWidget> {
  late PpDesativarContaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PpDesativarContaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 500.0),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: Color(0xFFAE1E1E),
                    size: 24.0,
                  ),
                  Expanded(
                    child: Text(
                      'Desativar conta',
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
              Text(
                'Deseja realmente desativar essa conta?',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
              ),
              Text(
                'Ao prosseguir, o acesso do usuário será suspenso. Esta ação é reversível e a conta poderá ser reativada a qualquer momento, sem perda de dados.',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
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
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      await SupabaseEdgeGroup.ativarOuInativarEmpresaCall.call(
                        companyId: widget.idEmpresa,
                        status: false,
                      );

                      Navigator.pop(context, true);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Empresa Inativa!',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    },
                    text: 'Sim, desativar',
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
                      color: const Color(0xFFAE1E1E),
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
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ].divide(const SizedBox(width: 12.0)),
              ),
            ].divide(const SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
