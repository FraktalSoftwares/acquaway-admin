import '/componentes/nav_menu/nav_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pg_acompanhamento/pg_acompanhamento/pg_acompanhamento_widget.dart';
import '/pg_avisos/pg_avisos/pg_avisos_widget.dart';
import '/pg_contas/pg_contas/pg_contas_widget.dart';
import '/pg_dashboard/pg_dashboard/pg_dashboard_widget.dart';
import '/pg_embarcacoes/pg_embarcacoes/pg_embarcacoes_widget.dart';
import '/pg_empresas/pg_empresas/pg_empresas_widget.dart';
import '/pg_notificacao/pg_notificacoes/pg_notificacoes_widget.dart';
import '/pg_solicitacoes_sos/pg_solicitacoes_sos/pg_solicitacoes_sos_widget.dart';
import '/pg_usuarios/pg_usuarios/pg_usuarios_widget.dart';
import '/pg_viagens/pg_viagens/pg_viagens_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/auth/supabase_auth/auth_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    // Wait for user to be loaded before calling auth check
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Wait for user to be available (important for page reloads)
      final appStateNotifier = AppStateNotifier.instance;
      int retries = 0;
      const maxRetries = 10;

      // Wait until user is loaded or max retries reached
      while ((currentUser == null || currentUserUid.isEmpty) &&
          retries < maxRetries &&
          appStateNotifier.loggedIn) {
        await Future.delayed(const Duration(milliseconds: 100));
        retries++;
      }

      // Only call auth if user is actually logged in
      if (appStateNotifier.loggedIn &&
          currentUser != null &&
          currentUserUid.isNotEmpty) {
        await action_blocks.auth(context);
      }
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.navMenuModel,
              updateCallback: () => safeSetState(() {}),
              child: const NavMenuWidget(),
            ),
            if (FFAppState().menu == 'Conta e configurações')
              Flexible(
                child: wrapWithModel(
                  model: _model.pgContasModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const PgContasWidget(),
                ),
              ),
            if (FFAppState().menu == 'Dashboard')
              Flexible(
                child: wrapWithModel(
                  model: _model.pgDashboardModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const PgDashboardWidget(),
                ),
              ),
            if (FFAppState().menu == 'Usuários')
              Flexible(
                child: wrapWithModel(
                  model: _model.pgUsuariosModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const PgUsuariosWidget(),
                ),
              ),
            if (FFAppState().menu == 'Empresas')
              Flexible(
                child: wrapWithModel(
                  model: _model.pgEmpresasModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const PgEmpresasWidget(),
                ),
              ),
            if (FFAppState().menu == 'Embarcações')
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: wrapWithModel(
                    model: _model.pgEmbarcacoesModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const PgEmbarcacoesWidget(),
                  ),
                ),
              ),
            if (FFAppState().menu == 'Viagens')
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: wrapWithModel(
                    model: _model.pgViagensModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const PgViagensWidget(),
                  ),
                ),
              ),
            if (FFAppState().menu == 'Acompanhamento')
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: wrapWithModel(
                    model: _model.pgAcompanhamentoModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const PgAcompanhamentoWidget(),
                  ),
                ),
              ),
            if (FFAppState().menu == 'Notificações')
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: wrapWithModel(
                    model: _model.pgNotificacoesModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const PgNotificacoesWidget(),
                  ),
                ),
              ),
            if (FFAppState().menu == 'Avisos')
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: wrapWithModel(
                    model: _model.pgAvisosModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const PgAvisosWidget(),
                  ),
                ),
              ),
            if (FFAppState().menu == 'Solicitações de SOS')
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: wrapWithModel(
                    model: _model.pgSolicitacoesSosModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const PgSolicitacoesSosWidget(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
