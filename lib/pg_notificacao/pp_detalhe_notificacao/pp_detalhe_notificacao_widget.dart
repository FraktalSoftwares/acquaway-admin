import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pp_detalhe_notificacao_model.dart';
export 'pp_detalhe_notificacao_model.dart';

/// New Component Gen
class PpDetalheNotificacaoWidget extends StatefulWidget {
  const PpDetalheNotificacaoWidget({super.key, required this.idNotificacao});

  final int? idNotificacao;

  @override
  State<PpDetalheNotificacaoWidget> createState() =>
      _PpDetalheNotificacaoWidgetState();
}

class _PpDetalheNotificacaoWidgetState
    extends State<PpDetalheNotificacaoWidget> {
  late PpDetalheNotificacaoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PpDetalheNotificacaoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NotificacoesRow>>(
      future: NotificacoesTable().querySingleRow(
        queryFn: (q) => q.eqOrNull('id', widget.idNotificacao),
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
        List<NotificacoesRow> containerNotificacoesRowList = snapshot.data!;

        final containerNotificacoesRow =
            containerNotificacoesRowList.isNotEmpty
                ? containerNotificacoesRowList.first
                : null;

        return Container(
          constraints: const BoxConstraints(maxWidth: 623.0, maxHeight: 373.0),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(
              16.0,
              16.0,
              16.0,
              16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notificação',
                      style: FlutterFlowTheme.of(
                        context,
                      ).headlineSmall.override(
                        font: GoogleFonts.interTight(
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).headlineSmall.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(
                                context,
                              ).headlineSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(
                              context,
                            ).headlineSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(
                              context,
                            ).headlineSmall.fontStyle,
                      ),
                    ),
                    FlutterFlowIconButton(
                      buttonSize: 48.0,
                      icon: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ].divide(const SizedBox(width: 8.0)),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).customColor4,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                containerNotificacoesRow?.titulo,
                                'NA',
                              ),
                              style: FlutterFlowTheme.of(
                                context,
                              ).bodyLarge.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      FlutterFlowTheme.of(
                                        context,
                                      ).bodyLarge.fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).bodyLarge.fontStyle,
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                dateTimeFormat(
                                  "dd MMMM yyyy\',\' H:mm",
                                  containerNotificacoesRow?.createdAt,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                '10 Janeiro 2024, 08:50',
                              ),
                              style: FlutterFlowTheme.of(
                                context,
                              ).bodySmall.override(
                                font: GoogleFonts.inter(
                                  fontWeight:
                                      FlutterFlowTheme.of(
                                        context,
                                      ).bodySmall.fontWeight,
                                  fontStyle:
                                      FlutterFlowTheme.of(
                                        context,
                                      ).bodySmall.fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).bodySmall.fontWeight,
                                fontStyle:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).bodySmall.fontStyle,
                              ),
                            ),
                          ].divide(const SizedBox(height: 8.0)),
                        ),
                        Text(
                          valueOrDefault<String>(
                            containerNotificacoesRow?.descricao,
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at libero blandit, dictum quam ut, sagittis nunc. Etiam augue nisl, volutpat ut purus sit amet, rhoncus suscipit ex. Integer vel erat felis.',
                          ),
                          style: FlutterFlowTheme.of(
                            context,
                          ).bodyMedium.override(
                            font: GoogleFonts.interTight(
                              fontWeight:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).bodyMedium.fontWeight,
                              fontStyle:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).bodyMedium.fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await NotificacoesTable().update(
                                  data: {'lido': true},
                                  matchingRows:
                                      (rows) => rows.eqOrNull(
                                        'id',
                                        widget.idNotificacao,
                                      ),
                                );
                              },
                              child: Text(
                                'Marcar como lida',
                                style: FlutterFlowTheme.of(
                                  context,
                                ).bodyMedium.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w500,
                                    fontStyle:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle:
                                      FlutterFlowTheme.of(
                                        context,
                                      ).bodyMedium.fontStyle,
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await NotificacoesTable().delete(
                                  matchingRows:
                                      (rows) => rows.eqOrNull(
                                        'id',
                                        widget.idNotificacao,
                                      ),
                                );
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.delete_outline,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 16.0,
                                  ),
                                  Text(
                                    'Excluir notificação',
                                    style: FlutterFlowTheme.of(
                                      context,
                                    ).bodyMedium.override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w500,
                                        fontStyle:
                                            FlutterFlowTheme.of(
                                              context,
                                            ).bodyMedium.fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).error,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontStyle,
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 4.0)),
                              ),
                            ),
                          ].divide(const SizedBox(width: 16.0)),
                        ),
                      ].divide(const SizedBox(height: 24.0)),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 12.0)),
            ),
          ),
        );
      },
    );
  }
}
