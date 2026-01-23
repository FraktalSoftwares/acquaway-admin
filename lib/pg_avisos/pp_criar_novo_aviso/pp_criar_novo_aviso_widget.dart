import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pp_criar_novo_aviso_model.dart';
export 'pp_criar_novo_aviso_model.dart';

class PpCriarNovoAvisoWidget extends StatefulWidget {
  const PpCriarNovoAvisoWidget({super.key});

  @override
  State<PpCriarNovoAvisoWidget> createState() => _PpCriarNovoAvisoWidgetState();
}

class _PpCriarNovoAvisoWidgetState extends State<PpCriarNovoAvisoWidget> {
  late PpCriarNovoAvisoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PpCriarNovoAvisoModel());

    _model.txtTituloTextController ??= TextEditingController();
    _model.txtTituloFocusNode ??= FocusNode();

    _model.txDescricaoTextController ??= TextEditingController();
    _model.txDescricaoFocusNode ??= FocusNode();

    _model.txDuracaoTextController ??= TextEditingController();
    _model.txDuracaoFocusNode ??= FocusNode();

    _model.txRaioTextController ??= TextEditingController();
    _model.txRaioFocusNode ??= FocusNode();

    _model.txLatTextController ??= TextEditingController();
    _model.txLatFocusNode ??= FocusNode();

    _model.txLonTextController ??= TextEditingController();
    _model.txLonFocusNode ??= FocusNode();

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
                    'Novo aviso',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                    'DADOS GERAIS',
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Título do aviso',
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
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.txtTituloTextController,
                          focusNode: _model.txtTituloFocusNode,
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
                            hintText: 'Insira o título',
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
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          enableInteractiveSelection: true,
                          validator: _model.txtTituloTextControllerValidator
                              .asValidator(context),
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
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.txDescricaoTextController,
                          focusNode: _model.txDescricaoFocusNode,
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
                            hintText: 'Insira uma descrição para o aviso',
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
                          maxLines: null,
                          minLines: 5,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          enableInteractiveSelection: true,
                          validator: _model.txDescricaoTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ].divide(const SizedBox(height: 8.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                            TextFormField(
                              controller: _model.txDuracaoTextController,
                              focusNode: _model.txDuracaoFocusNode,
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
                                hintText: 'Horas',
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
                                  FlutterFlowTheme.of(context).primaryText,
                              enableInteractiveSelection: true,
                              validator: _model.txDuracaoTextControllerValidator
                                  .asValidator(context),
                            ),
                          ].divide(const SizedBox(height: 8.0)),
                        ),
                      ),
                    ].divide(const SizedBox(width: 24.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Raio de cobertura',
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
                            TextFormField(
                              controller: _model.txRaioTextController,
                              focusNode: _model.txRaioFocusNode,
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
                                hintText: 'Milhas Náuticas',
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
                                  FlutterFlowTheme.of(context).primaryText,
                              enableInteractiveSelection: true,
                              validator: _model.txRaioTextControllerValidator
                                  .asValidator(context),
                            ),
                          ].divide(const SizedBox(height: 8.0)),
                        ),
                      ),
                    ].divide(const SizedBox(width: 24.0)),
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
                              'Latitude',
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
                            TextFormField(
                              controller: _model.txLatTextController,
                              focusNode: _model.txLatFocusNode,
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
                                hintText: 'Insira a latitude',
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
                                  FlutterFlowTheme.of(context).primaryText,
                              enableInteractiveSelection: true,
                              validator: _model.txLatTextControllerValidator
                                  .asValidator(context),
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
                              'Longitude',
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
                            TextFormField(
                              controller: _model.txLonTextController,
                              focusNode: _model.txLonFocusNode,
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
                                hintText: 'Insira a longitude',
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
                                  FlutterFlowTheme.of(context).primaryText,
                              enableInteractiveSelection: true,
                              validator: _model.txLonTextControllerValidator
                                  .asValidator(context),
                            ),
                          ].divide(const SizedBox(height: 8.0)),
                        ),
                      ),
                    ].divide(const SizedBox(width: 24.0)),
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
                      FFButtonWidget(
                        onPressed: () async {
                          await AvisosTable().insert({
                            'aviso': _model.txDescricaoTextController.text,
                            'duracao': double.tryParse(
                              _model.txDuracaoTextController.text,
                            ),
                            'status': 'Ativo',
                            'titulo_aviso': '',
                            'lat': _model.txLatTextController.text,
                            'lon': _model.txLonTextController.text,
                            'milhas': double.tryParse(
                              _model.txRaioTextController.text,
                            ),
                          });
                          Navigator.pop(context);
                        },
                        text: 'Emitir aviso',
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
                ].divide(const SizedBox(height: 24.0)),
              ),
            ].divide(const SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}
