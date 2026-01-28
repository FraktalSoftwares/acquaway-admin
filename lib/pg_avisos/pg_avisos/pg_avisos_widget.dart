import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pg_avisos/pp_criar_novo_aviso/pp_criar_novo_aviso_widget.dart';
import '/pg_avisos/pp_detalhe_aviso/pp_detalhe_aviso_widget.dart';
import '/pg_viagens/calendar_wid/calendar_wid_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pg_avisos_model.dart';
export 'pg_avisos_model.dart';

class PgAvisosWidget extends StatefulWidget {
  const PgAvisosWidget({super.key});

  @override
  State<PgAvisosWidget> createState() => _PgAvisosWidgetState();
}

class _PgAvisosWidgetState extends State<PgAvisosWidget> {
  late PgAvisosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PgAvisosModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.empresaSelecionada = null;
      _model.stage = 'Geral';
      safeSetState(() {});
    });

    _model.txBuscaEmpresaTextController ??= TextEditingController();
    _model.txBuscaEmpresaFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_model.empresaSelecionada == null)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Avisos',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).bodyMedium.fontStyle,
                          ),
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        24.0,
                        0.0,
                        0.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: 320.0,
                                  child: TextFormField(
                                    controller:
                                        _model.txBuscaEmpresaTextController,
                                    focusNode: _model.txBuscaEmpresaFocusNode,
                                    onChanged:
                                        (_) => EasyDebounce.debounce(
                                          '_model.txBuscaEmpresaTextController',
                                          const Duration(milliseconds: 500),
                                          () => safeSetState(() {}),
                                        ),
                                    autofocus: false,
                                    enabled: true,
                                    obscureText: false,
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
                                        fontWeight:
                                            FlutterFlowTheme.of(
                                              context,
                                            ).labelMedium.fontWeight,
                                        fontStyle:
                                            FlutterFlowTheme.of(
                                              context,
                                            ).labelMedium.fontStyle,
                                      ),
                                      hintText: 'Buscar Aviso...',
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
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
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
                                      fillColor: Colors.transparent,
                                      prefixIcon: const Icon(
                                        Icons.search_rounded,
                                        color: Color(0xFF4B4D4E),
                                        size: 24.0,
                                      ),
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
                                    cursorColor:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).primaryText,
                                    enableInteractiveSelection: true,
                                    validator: _model
                                        .txBuscaEmpresaTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(
                                              _model.dropDownValue ??= 'Ativo',
                                            ),
                                    options: List<String>.from([
                                      'Finalizado',
                                      'Cancelado',
                                      'Ativo',
                                    ]),
                                    optionLabels: const [
                                      'Finalizado',
                                      'Cancelado',
                                      'Ativo',
                                    ],
                                    onChanged:
                                        (val) => safeSetState(
                                          () => _model.dropDownValue = val,
                                        ),
                                    width: 134.4,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(
                                      context,
                                    ).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle:
                                            FlutterFlowTheme.of(
                                              context,
                                            ).bodyMedium.fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontStyle,
                                    ),
                                    hintText: 'Status',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).secondaryText,
                                      size: 24.0,
                                    ),
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 8.0,
                                    margin:
                                        const EdgeInsetsDirectional.fromSTEB(
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
                              if (_model.dataInicio != null)
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        '${valueOrDefault<String>(dateTimeFormat("dd/MM/yyyy", _model.dataInicio, locale: FFLocalizations.of(context).languageCode), '00/00/0000')} - ${valueOrDefault<String>(dateTimeFormat("dd/MM/yyyy", _model.dataFim, locale: FFLocalizations.of(context).languageCode), '00/00/0000')}',
                                        '00/00/0000 - 00/00/0000',
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
                                    FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color:
                                            FlutterFlowTheme.of(
                                              context,
                                            ).primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.dataInicio = null;
                                        _model.dataFim = null;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ].divide(const SizedBox(width: 12.0)),
                                ),
                              Builder(
                                builder:
                                    (context) => FFButtonWidget(
                                      onPressed: () async {
                                        await showAlignedDialog(
                                          barrierColor: Colors.transparent,
                                          context: context,
                                          isGlobal: false,
                                          avoidOverflow: true,
                                          targetAnchor:
                                              const AlignmentDirectional(
                                                1.0,
                                                1.0,
                                              ).resolve(
                                                Directionality.of(context),
                                              ),
                                          followerAnchor:
                                              const AlignmentDirectional(
                                                1.0,
                                                -1.0,
                                              ).resolve(
                                                Directionality.of(context),
                                              ),
                                          builder: (dialogContext) {
                                            return Material(
                                              color: Colors.transparent,
                                              child: WebViewAware(
                                                child: CalendarWidWidget(
                                                  actionRetorn: (
                                                    dataInicio,
                                                    dataFim,
                                                  ) async {
                                                    _model.dataInicio =
                                                        dataInicio;
                                                    _model.dataFim = dataFim;
                                                    safeSetState(() {});
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      text: 'Período',
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                              16.0,
                                              0.0,
                                              16.0,
                                              0.0,
                                            ),
                                        iconAlignment: IconAlignment.end,
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
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
                                          color: const Color(0xFF252627),
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
                                          color: Color(0x00007191),
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                    ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  await actions.exportAvisosExcel(
                                    _model.dataInicio ?? DateTime(2000, 1, 1),
                                    _model.dataFim ?? getCurrentTimestamp,
                                  );
                                },
                                text: 'Baixar relatório',
                                icon: const Icon(
                                  Icons.file_download_outlined,
                                  size: 15.0,
                                ),
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
                                    color: const Color(0xFF252627),
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
                                    color: Color(0xFF007191),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Builder(
                                    builder:
                                        (context) => FFButtonWidget(
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      const AlignmentDirectional(
                                                        0.0,
                                                        0.0,
                                                      ).resolve(
                                                        Directionality.of(
                                                          context,
                                                        ),
                                                      ),
                                                  child: const WebViewAware(
                                                    child:
                                                        PpCriarNovoAvisoWidget(),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          text: 'Novo aviso',
                                          icon: const Icon(
                                            Icons.add,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
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
                                            color:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).primary,
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
                                            borderRadius: BorderRadius.circular(
                                              12.0,
                                            ),
                                          ),
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 24.0)),
                              ),
                            ].divide(const SizedBox(width: 24.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 100.0,
                                height: 48.0,
                                decoration: const BoxDecoration(),
                                child: Align(
                                  alignment: const AlignmentDirectional(
                                    -1.0,
                                    0.0,
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          12.0,
                                          0.0,
                                          12.0,
                                          0.0,
                                        ),
                                    child: Text(
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
                                  ),
                                ),
                              ),
                              Container(
                                width: 300.0,
                                height: 48.0,
                                decoration: const BoxDecoration(),
                                child: Align(
                                  alignment: const AlignmentDirectional(
                                    -1.0,
                                    0.0,
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          12.0,
                                          0.0,
                                          12.0,
                                          0.0,
                                        ),
                                    child: Text(
                                      'Aviso',
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
                                  ),
                                ),
                              ),
                              Container(
                                width: 200.0,
                                height: 48.0,
                                decoration: const BoxDecoration(),
                                child: Align(
                                  alignment: const AlignmentDirectional(
                                    -1.0,
                                    0.0,
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          12.0,
                                          0.0,
                                          12.0,
                                          0.0,
                                        ),
                                    child: Text(
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
                                  ),
                                ),
                              ),
                              Container(
                                width: 200.0,
                                height: 48.0,
                                decoration: const BoxDecoration(),
                                child: Align(
                                  alignment: const AlignmentDirectional(
                                    -1.0,
                                    0.0,
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          12.0,
                                          0.0,
                                          12.0,
                                          0.0,
                                        ),
                                    child: Text(
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
                                  ),
                                ),
                              ),
                              Container(
                                width: 200.0,
                                height: 48.0,
                                decoration: const BoxDecoration(),
                                child: Align(
                                  alignment: const AlignmentDirectional(
                                    -1.0,
                                    0.0,
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          12.0,
                                          0.0,
                                          12.0,
                                          0.0,
                                        ),
                                    child: Text(
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
                                  ),
                                ),
                              ),
                              Container(
                                width: 200.0,
                                height: 48.0,
                                decoration: const BoxDecoration(),
                                child: Align(
                                  alignment: const AlignmentDirectional(
                                    -1.0,
                                    0.0,
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          12.0,
                                          0.0,
                                          12.0,
                                          0.0,
                                        ),
                                    child: Text(
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
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 12.0)),
                          ),
                          Flexible(
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: FutureBuilder<List<AvisosRow>>(
                                future: AvisosTable().queryRows(
                                  queryFn:
                                      (q) => q
                                          .gteOrNull(
                                            'created_at',
                                            supaSerialize<DateTime>(
                                              _model.dataInicio,
                                            ),
                                          )
                                          .lteOrNull(
                                            'created_at',
                                            supaSerialize<DateTime>(
                                              _model.dataFim,
                                            ),
                                          )
                                          .ilike(
                                            'status',
                                            '%${_model.dropDownValue}%',
                                          )
                                          .ilike(
                                            'aviso',
                                            '%${_model.txBuscaEmpresaTextController.text}%',
                                          ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).primary,
                                              ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<AvisosRow> lvHistoricoAvisosRowList =
                                      snapshot.data!;

                                  return ListView.separated(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      24.0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: lvHistoricoAvisosRowList.length,
                                    separatorBuilder:
                                        (_, __) => const SizedBox(height: 12.0),
                                    itemBuilder: (context, lvHistoricoIndex) {
                                      final lvHistoricoAvisosRow =
                                          lvHistoricoAvisosRowList[lvHistoricoIndex];
                                      return Builder(
                                        builder:
                                            (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          const AlignmentDirectional(
                                                            0.0,
                                                            0.0,
                                                          ).resolve(
                                                            Directionality.of(
                                                              context,
                                                            ),
                                                          ),
                                                      child: WebViewAware(
                                                        child: PpDetalheAvisoWidget(
                                                          idAviso:
                                                              lvHistoricoAvisosRow
                                                                  .id,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 100.0,
                                                        height: 48.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                    -1.0,
                                                                    0.0,
                                                                  ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional.fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                    ),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                    String
                                                                  >(
                                                                    lvHistoricoAvisosRow
                                                                        .id
                                                                        .toString(),
                                                                    '0000',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                    context,
                                                                  ).bodyMedium.override(
                                                                    font: GoogleFonts.inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle:
                                                                          FlutterFlowTheme.of(
                                                                            context,
                                                                          ).bodyMedium.fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle:
                                                                        FlutterFlowTheme.of(
                                                                          context,
                                                                        ).bodyMedium.fontStyle,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(
                                                            const SizedBox(
                                                              height: 2.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 300.0,
                                                        height: 48.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                -1.0,
                                                                0.0,
                                                              ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional.fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                ),
                                                            child: Text(
                                                              valueOrDefault<
                                                                String
                                                              >(
                                                                lvHistoricoAvisosRow
                                                                    .aviso,
                                                                'Aviso',
                                                              ),
                                                              style: FlutterFlowTheme.of(
                                                                context,
                                                              ).bodyMedium.override(
                                                                font: GoogleFonts.inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(
                                                                        context,
                                                                      ).bodyMedium.fontStyle,
                                                                ),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 200.0,
                                                        height: 48.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                -1.0,
                                                                0.0,
                                                              ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional.fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                ),
                                                            child: Text(
                                                              valueOrDefault<
                                                                String
                                                              >(
                                                                dateTimeFormat(
                                                                  "dd/MM/yyyy",
                                                                  lvHistoricoAvisosRow
                                                                      .createdAt,
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
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(
                                                                        context,
                                                                      ).bodyMedium.fontStyle,
                                                                ),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 200.0,
                                                        height: 48.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                -1.0,
                                                                0.0,
                                                              ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional.fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                ),
                                                            child: Text(
                                                              valueOrDefault<
                                                                String
                                                              >(
                                                                lvHistoricoAvisosRow
                                                                    .duracao
                                                                    ?.toString(),
                                                                '00',
                                                              ),
                                                              style: FlutterFlowTheme.of(
                                                                context,
                                                              ).bodyMedium.override(
                                                                font: GoogleFonts.inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(
                                                                        context,
                                                                      ).bodyMedium.fontStyle,
                                                                ),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 200.0,
                                                        height: 48.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                -1.0,
                                                                0.0,
                                                              ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional.fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                ),
                                                            child: Text(
                                                              '${lvHistoricoAvisosRow.lat} ${lvHistoricoAvisosRow.lon}',
                                                              style: FlutterFlowTheme.of(
                                                                context,
                                                              ).bodyMedium.override(
                                                                font: GoogleFonts.inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(
                                                                        context,
                                                                      ).bodyMedium.fontStyle,
                                                                ),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 200.0,
                                                        height: 48.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                -1.0,
                                                                0.0,
                                                              ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional.fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                ),
                                                            child: Text(
                                                              valueOrDefault<
                                                                String
                                                              >(
                                                                lvHistoricoAvisosRow
                                                                    .status,
                                                                'Status',
                                                              ),
                                                              style: FlutterFlowTheme.of(
                                                                context,
                                                              ).bodyMedium.override(
                                                                font: GoogleFonts.inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(
                                                                        context,
                                                                      ).bodyMedium.fontStyle,
                                                                ),
                                                                color: valueOrDefault<
                                                                  Color
                                                                >(
                                                                  () {
                                                                    if (lvHistoricoAvisosRow
                                                                            .status ==
                                                                        'Ativo') {
                                                                      return const Color(
                                                                        0xFF1EAE3E,
                                                                      );
                                                                    } else if (lvHistoricoAvisosRow
                                                                            .status ==
                                                                        'Cancelado') {
                                                                      return const Color(
                                                                        0xFFAE1E1E,
                                                                      );
                                                                    } else if (lvHistoricoAvisosRow
                                                                            .status ==
                                                                        'Finalizado') {
                                                                      return const Color(
                                                                        0xFF007191,
                                                                      );
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                        context,
                                                                      ).primaryText;
                                                                    }
                                                                  }(),
                                                                  FlutterFlowTheme.of(
                                                                    context,
                                                                  ).primaryText,
                                                                ),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                      const SizedBox(
                                                        width: 12.0,
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 1.0,
                                                    thickness: 2.0,
                                                    color: Color(0xFFE5E6E6),
                                                  ),
                                                ].divide(
                                                  const SizedBox(height: 12.0),
                                                ),
                                              ),
                                            ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 24.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
