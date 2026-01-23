import '/componentes/pp_logout/pp_logout_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'nav_menu_model.dart';
export 'nav_menu_model.dart';

class NavMenuWidget extends StatefulWidget {
  const NavMenuWidget({super.key});

  @override
  State<NavMenuWidget> createState() => _NavMenuWidgetState();
}

class _NavMenuWidgetState extends State<NavMenuWidget> {
  late NavMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavMenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 233.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().menu = 'Dashboard';
                    FFAppState().update(() {});
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/acqua-way-web-bqkdd1/assets/29t30mo7xge1/Logo_(3).png',
                      height: 32.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    24.0,
                    0.0,
                    0.0,
                    0.0,
                  ),
                  child: Text(
                    'ADMINISTRAÇÃO',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: const Color(0xFF979A9B),
                      fontSize: 10.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().menu = 'Dashboard';
                    FFAppState().update(() {});
                  },
                  child: Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                      color:
                          FFAppState().menu == 'Dashboard'
                              ? const Color(0xFFE5F8FE)
                              : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        6.0,
                        0.0,
                        6.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0,
                              0.0,
                              0.0,
                              0.0,
                            ),
                            child: Icon(
                              Icons.dashboard_outlined,
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Dashboard'
                                    ? const Color(0xFF007191)
                                    : const Color(0xFF4B4D4E),
                                const Color(0xFF4B4D4E),
                              ),
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Dashboard',
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
                                color: valueOrDefault<Color>(
                                  FFAppState().menu == 'Dashboard'
                                      ? const Color(0xFF007191)
                                      : const Color(0xFF4B4D4E),
                                  const Color(0xFF4B4D4E),
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
                          Container(
                            width: 2.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Dashboard'
                                    ? const Color(0xFF007191)
                                    : const Color(0x004B4D4E),
                                const Color(0x004B4D4E),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().menu = 'Usuários';
                    FFAppState().update(() {});
                  },
                  child: Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                      color:
                          FFAppState().menu == 'Usuários'
                              ? const Color(0xFFE5F8FE)
                              : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        6.0,
                        0.0,
                        6.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0,
                              0.0,
                              0.0,
                              0.0,
                            ),
                            child: Icon(
                              Icons.group,
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Usuários'
                                    ? const Color(0xFF007191)
                                    : const Color(0xFF4B4D4E),
                                const Color(0xFF4B4D4E),
                              ),
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Usuários',
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
                                color: valueOrDefault<Color>(
                                  FFAppState().menu == 'Usuários'
                                      ? const Color(0xFF007191)
                                      : const Color(0xFF4B4D4E),
                                  const Color(0xFF4B4D4E),
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
                          Container(
                            width: 2.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Usuários'
                                    ? const Color(0xFF007191)
                                    : const Color(0x004B4D4E),
                                const Color(0x004B4D4E),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().menu = 'Empresas';
                    FFAppState().update(() {});
                  },
                  child: Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                      color:
                          FFAppState().menu == 'Empresas'
                              ? const Color(0xFFE5F8FE)
                              : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        6.0,
                        0.0,
                        6.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0,
                              0.0,
                              0.0,
                              0.0,
                            ),
                            child: Icon(
                              Icons.business_center_sharp,
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Empresas'
                                    ? const Color(0xFF007191)
                                    : const Color(0xFF4B4D4E),
                                const Color(0xFF4B4D4E),
                              ),
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Empresas',
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
                                color: valueOrDefault<Color>(
                                  FFAppState().menu == 'Empresas'
                                      ? const Color(0xFF007191)
                                      : const Color(0xFF4B4D4E),
                                  const Color(0xFF4B4D4E),
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
                          Container(
                            width: 2.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Empresas'
                                    ? const Color(0xFF007191)
                                    : const Color(0x004B4D4E),
                                const Color(0x004B4D4E),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().menu = 'Embarcações';
                    FFAppState().update(() {});
                  },
                  child: Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                      color:
                          FFAppState().menu == 'Embarcações'
                              ? const Color(0xFFE5F8FE)
                              : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        6.0,
                        0.0,
                        6.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0,
                              0.0,
                              0.0,
                              0.0,
                            ),
                            child: Icon(
                              Icons.directions_boat,
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Embarcações'
                                    ? const Color(0xFF007191)
                                    : const Color(0xFF4B4D4E),
                                const Color(0xFF4B4D4E),
                              ),
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Embarcações',
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
                                color: valueOrDefault<Color>(
                                  FFAppState().menu == 'Embarcações'
                                      ? const Color(0xFF007191)
                                      : const Color(0xFF4B4D4E),
                                  const Color(0xFF4B4D4E),
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
                          Container(
                            width: 2.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Embarcações'
                                    ? const Color(0xFF007191)
                                    : const Color(0x004B4D4E),
                                const Color(0x004B4D4E),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().menu = 'Notificações';
                    FFAppState().update(() {});
                  },
                  child: Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                      color:
                          FFAppState().menu == 'Notificações'
                              ? const Color(0xFFE5F8FE)
                              : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        6.0,
                        0.0,
                        6.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0,
                              0.0,
                              0.0,
                              0.0,
                            ),
                            child: Icon(
                              Icons.notifications_rounded,
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Notificações'
                                    ? const Color(0xFF007191)
                                    : const Color(0xFF4B4D4E),
                                const Color(0xFF4B4D4E),
                              ),
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Notificações',
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
                                color: valueOrDefault<Color>(
                                  FFAppState().menu == 'Notificações'
                                      ? const Color(0xFF007191)
                                      : const Color(0xFF4B4D4E),
                                  const Color(0xFF4B4D4E),
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
                          Container(
                            width: 2.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Notificações'
                                    ? const Color(0xFF007191)
                                    : const Color(0x004B4D4E),
                                const Color(0x004B4D4E),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    24.0,
                    12.0,
                    0.0,
                    0.0,
                  ),
                  child: Text(
                    'ADMINISTRAÇÃO',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: const Color(0xFF979A9B),
                      fontSize: 10.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().menu = 'Viagens';
                    FFAppState().update(() {});
                  },
                  child: Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                      color:
                          FFAppState().menu == 'Viagens'
                              ? const Color(0xFFE5F8FE)
                              : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        6.0,
                        0.0,
                        6.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0,
                              0.0,
                              0.0,
                              0.0,
                            ),
                            child: Icon(
                              Icons.location_on_rounded,
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Viagens'
                                    ? const Color(0xFF007191)
                                    : const Color(0xFF4B4D4E),
                                const Color(0xFF4B4D4E),
                              ),
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Viagens',
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
                                color: valueOrDefault<Color>(
                                  FFAppState().menu == 'Viagens'
                                      ? const Color(0xFF007191)
                                      : const Color(0xFF4B4D4E),
                                  const Color(0xFF4B4D4E),
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
                          Container(
                            width: 2.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Viagens'
                                    ? const Color(0xFF007191)
                                    : const Color(0x004B4D4E),
                                const Color(0x004B4D4E),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().menu = 'Avisos';
                    FFAppState().update(() {});
                  },
                  child: Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                      color:
                          FFAppState().menu == 'Avisos'
                              ? const Color(0xFFE5F8FE)
                              : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        6.0,
                        0.0,
                        6.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0,
                              0.0,
                              0.0,
                              0.0,
                            ),
                            child: Icon(
                              Icons.campaign_rounded,
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Avisos'
                                    ? const Color(0xFF007191)
                                    : const Color(0xFF4B4D4E),
                                const Color(0xFF4B4D4E),
                              ),
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Avisos',
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
                                color: valueOrDefault<Color>(
                                  FFAppState().menu == 'Avisos'
                                      ? const Color(0xFF007191)
                                      : const Color(0xFF4B4D4E),
                                  const Color(0xFF4B4D4E),
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
                          Container(
                            width: 2.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Avisos'
                                    ? const Color(0xFF007191)
                                    : const Color(0x004B4D4E),
                                const Color(0x004B4D4E),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().menu = 'Solicitações de SOS';
                    FFAppState().update(() {});
                  },
                  child: Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                      color:
                          FFAppState().menu == 'Solicitações de SOS'
                              ? const Color(0xFFE5F8FE)
                              : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        6.0,
                        0.0,
                        6.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0,
                              0.0,
                              0.0,
                              0.0,
                            ),
                            child: Icon(
                              Icons.warning_amber,
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Solicitações de SOS'
                                    ? const Color(0xFF007191)
                                    : const Color(0xFF4B4D4E),
                                const Color(0xFF4B4D4E),
                              ),
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Solicitações de SOS',
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
                                color: valueOrDefault<Color>(
                                  FFAppState().menu == 'Solicitações de SOS'
                                      ? const Color(0xFF007191)
                                      : const Color(0xFF4B4D4E),
                                  const Color(0xFF4B4D4E),
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
                          Container(
                            width: 2.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Solicitações de SOS'
                                    ? const Color(0xFF007191)
                                    : const Color(0x004B4D4E),
                                const Color(0x004B4D4E),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().menu = 'Acompanhamento';
                    FFAppState().update(() {});
                  },
                  child: Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                      color:
                          FFAppState().menu == 'Acompanhamento'
                              ? const Color(0xFFE5F8FE)
                              : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        6.0,
                        0.0,
                        6.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0,
                              0.0,
                              0.0,
                              0.0,
                            ),
                            child: Icon(
                              Icons.assistant_navigation,
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Acompanhamento'
                                    ? const Color(0xFF007191)
                                    : const Color(0xFF4B4D4E),
                                const Color(0xFF4B4D4E),
                              ),
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Acompanhamento',
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
                                color: valueOrDefault<Color>(
                                  FFAppState().menu == 'Acompanhamento'
                                      ? const Color(0xFF007191)
                                      : const Color(0xFF4B4D4E),
                                  const Color(0xFF4B4D4E),
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
                          Container(
                            width: 2.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Acompanhamento'
                                    ? const Color(0xFF007191)
                                    : const Color(0x004B4D4E),
                                const Color(0x004B4D4E),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 8.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().menu = 'Conta e configurações';
                    FFAppState().update(() {});
                  },
                  child: Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                      color:
                          FFAppState().menu == 'Conta e configurações'
                              ? const Color(0xFFE5F8FE)
                              : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        6.0,
                        0.0,
                        6.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0,
                              0.0,
                              0.0,
                              0.0,
                            ),
                            child: Icon(
                              Icons.dashboard_outlined,
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Conta e configurações'
                                    ? const Color(0xFF007191)
                                    : const Color(0xFF4B4D4E),
                                const Color(0xFF4B4D4E),
                              ),
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Conta e configurações',
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
                                color: valueOrDefault<Color>(
                                  FFAppState().menu == 'Conta e configurações'
                                      ? const Color(0xFF007191)
                                      : const Color(0xFF4B4D4E),
                                  const Color(0xFF4B4D4E),
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
                          Container(
                            width: 2.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                FFAppState().menu == 'Conta e configurações'
                                    ? const Color(0xFF007191)
                                    : const Color(0x004B4D4E),
                                const Color(0x004B4D4E),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                Builder(
                  builder:
                      (context) => Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          12.0,
                          0.0,
                          12.0,
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
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
                                  child: const WebViewAware(
                                    child: PpLogoutWidget(),
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0,
                                  0.0,
                                  0.0,
                                  0.0,
                                ),
                                child: Icon(
                                  Icons.logout_outlined,
                                  color: Color(0xFFAE1E1E),
                                  size: 24.0,
                                ),
                              ),
                              Text(
                                'Sair',
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
                                  color: const Color(0xFFAE1E1E),
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
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ),
        ].divide(const SizedBox(height: 40.0)),
      ),
    );
  }
}
