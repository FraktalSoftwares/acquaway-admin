import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pp_detalhe_aviso_model.dart';
export 'pp_detalhe_aviso_model.dart';

class PpDetalheAvisoWidget extends StatefulWidget {
  const PpDetalheAvisoWidget({super.key, required this.idAviso});

  final int? idAviso;

  @override
  State<PpDetalheAvisoWidget> createState() => _PpDetalheAvisoWidgetState();
}

class _PpDetalheAvisoWidgetState extends State<PpDetalheAvisoWidget> {
  late PpDetalheAvisoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PpDetalheAvisoModel());

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
      child: FutureBuilder<List<AvisosRow>>(
        future: AvisosTable().querySingleRow(
          queryFn: (q) => q.eqOrNull('id', widget.idAviso),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<AvisosRow> containerAvisosRowList = snapshot.data!;

          final containerAvisosRow =
              containerAvisosRowList.isNotEmpty
                  ? containerAvisosRowList.first
                  : null;

          return Container(
            width: 625.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Detalhes aviso',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).bodyMedium.fontStyle,
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detalhes da embarcação',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).bodyMedium.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ID',
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
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                  ),
                                ),
                                Container(
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE5E6E6),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: const Color(0xFFE5E6E6),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(
                                      -1.0,
                                      0.0,
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            24.0,
                                            0.0,
                                            24.0,
                                            0.0,
                                          ),
                                      child: Text(
                                        valueOrDefault<String>(
                                          containerAvisosRow?.id.toString(),
                                          'N/A',
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
                                          fontWeight:
                                              FlutterFlowTheme.of(
                                                context,
                                              ).bodyMedium.fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(
                                                context,
                                              ).bodyMedium.fontStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 8.0)),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Status',
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
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                  ),
                                ),
                                Container(
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE5E6E6),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: const Color(0xFFE5E6E6),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(
                                      -1.0,
                                      0.0,
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            24.0,
                                            0.0,
                                            24.0,
                                            0.0,
                                          ),
                                      child: Text(
                                        valueOrDefault<String>(
                                          containerAvisosRow?.status,
                                          'N/A',
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
                                          fontWeight:
                                              FlutterFlowTheme.of(
                                                context,
                                              ).bodyMedium.fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(
                                                context,
                                              ).bodyMedium.fontStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 8.0)),
                            ),
                          ),
                        ].divide(const SizedBox(width: 24.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Título do aviso',
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
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).bodyMedium.fontStyle,
                            ),
                          ),
                          Container(
                            height: 44.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5E6E6),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: const Color(0xFFE5E6E6),
                              ),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0,
                                  0.0,
                                  24.0,
                                  0.0,
                                ),
                                child: Text(
                                  valueOrDefault<String>(
                                    containerAvisosRow?.tituloAviso,
                                    'N/A',
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
                                    fontWeight:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontWeight,
                                    fontStyle:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 8.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Descrição',
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
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).bodyMedium.fontStyle,
                            ),
                          ),
                          Container(
                            height: 147.27,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5E6E6),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: const Color(0xFFE5E6E6),
                              ),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0,
                                  24.0,
                                  24.0,
                                  0.0,
                                ),
                                child: Text(
                                  valueOrDefault<String>(
                                    containerAvisosRow?.aviso,
                                    'N/A',
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
                                    fontWeight:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontWeight,
                                    fontStyle:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 8.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Duração',
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
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                  ),
                                ),
                                Container(
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE5E6E6),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: const Color(0xFFE5E6E6),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(
                                      -1.0,
                                      0.0,
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            24.0,
                                            0.0,
                                            24.0,
                                            0.0,
                                          ),
                                      child: Text(
                                        valueOrDefault<String>(
                                          containerAvisosRow?.duracao
                                              ?.toString(),
                                          '00000000',
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
                                          fontWeight:
                                              FlutterFlowTheme.of(
                                                context,
                                              ).bodyMedium.fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(
                                                context,
                                              ).bodyMedium.fontStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 8.0)),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Emitido em',
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
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                  ),
                                ),
                                Container(
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE5E6E6),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: const Color(0xFFE5E6E6),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(
                                      -1.0,
                                      0.0,
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            24.0,
                                            0.0,
                                            24.0,
                                            0.0,
                                          ),
                                      child: Text(
                                        valueOrDefault<String>(
                                          dateTimeFormat(
                                            "dd/MM/yyyy",
                                            containerAvisosRow?.createdAt,
                                            locale:
                                                FFLocalizations.of(
                                                  context,
                                                ).languageCode,
                                          ),
                                          '00/00/0000',
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
                                          fontWeight:
                                              FlutterFlowTheme.of(
                                                context,
                                              ).bodyMedium.fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(
                                                context,
                                              ).bodyMedium.fontStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 8.0)),
                            ),
                          ),
                        ].divide(const SizedBox(width: 24.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Coordenadas',
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
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).bodyMedium.fontStyle,
                            ),
                          ),
                          Container(
                            height: 44.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5E6E6),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: const Color(0xFFE5E6E6),
                              ),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0,
                                  0.0,
                                  24.0,
                                  0.0,
                                ),
                                child: Text(
                                  '${containerAvisosRow?.lat} ${containerAvisosRow?.lon}',
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
                                    fontWeight:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontWeight,
                                    fontStyle:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 8.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await AvisosTable().update(
                                data: {'status': 'Cancelado'},
                                matchingRows:
                                    (rows) =>
                                        rows.eqOrNull('id', widget.idAviso),
                              );
                              Navigator.pop(context);
                            },
                            text: 'Cancelar aviso',
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
                              iconColor: const Color(0xFF252627),
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
                                color: FlutterFlowTheme.of(context).error,
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
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ].divide(const SizedBox(width: 12.0)),
                      ),
                    ].divide(const SizedBox(height: 24.0)),
                  ),
                ].divide(const SizedBox(height: 24.0)),
              ),
            ),
          );
        },
      ),
    );
  }
}
