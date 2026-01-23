import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pp_procedimento_recomendado_model.dart';
export 'pp_procedimento_recomendado_model.dart';

class PpProcedimentoRecomendadoWidget extends StatefulWidget {
  const PpProcedimentoRecomendadoWidget({
    super.key,
    required this.idSos,
    required this.tipoSos,
  });

  final int? idSos;
  final String? tipoSos;

  @override
  State<PpProcedimentoRecomendadoWidget> createState() =>
      _PpProcedimentoRecomendadoWidgetState();
}

class _PpProcedimentoRecomendadoWidgetState
    extends State<PpProcedimentoRecomendadoWidget> {
  late PpProcedimentoRecomendadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PpProcedimentoRecomendadoModel());

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
        constraints: const BoxConstraints(
          maxWidth: 800.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Procedimento recomendado',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tipo de solicitação: ${widget.tipoSos}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at libero blandit, dictum quam ut, sagittis nunc. Etiam augue nisl, volutpat ut purus sit amet, rhoncus suscipit ex. Integer vel erat felis. Aliquam at suscipit tellus. Ut dapibus sapien leo, ut faucibus tellus vehicula quis. Nulla nulla nisi, interdum at venenatis non, vehicula id diam. Etiam et nisi et turpis ultrices imperdiet vel sed nibh. Ut justo diam, malesuada eu pellentesque ornare, eleifend sed massa. Nullam erat sem, mollis vitae justo euismod, gravida molestie justo.\nPellentesque at semper justo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id turpis diam. Sed vehicula velit orci, ac imperdiet elit ultrices a. Sed finibus sed urna id laoreet. Nullam sit amet mollis velit, non ullamcorper velit. Fusce ullamcorper convallis magna sit amet rhoncus. Ut suscipit blandit sapien sagittis blandit. \nInteger congue dictum quam, scelerisque pulvinar lacus aliquet vel.\nInteger congue dictum quam, scelerisque pulvinar lacus aliquet vel.\nInteger congue dictum quam, scelerisque pulvinar lacus aliquet vel.\nInteger congue dictum quam, scelerisque pulvinar lacus aliquet vel.\nInteger congue dictum quam, scelerisque pulvinar lacus aliquet vel.\n\nTelefones de emergência: \nMarinha: (00) 1234-5678\nPolícia: 190 ',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ].divide(const SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}
