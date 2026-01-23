import '/componentes/nav_menu/nav_menu_widget.dart';
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
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navMenu component.
  late NavMenuModel navMenuModel;
  // Model for pgContas component.
  late PgContasModel pgContasModel;
  // Model for pgDashboard component.
  late PgDashboardModel pgDashboardModel;
  // Model for pgUsuarios component.
  late PgUsuariosModel pgUsuariosModel;
  // Model for pgEmpresas component.
  late PgEmpresasModel pgEmpresasModel;
  // Model for pgEmbarcacoes component.
  late PgEmbarcacoesModel pgEmbarcacoesModel;
  // Model for pgViagens component.
  late PgViagensModel pgViagensModel;
  // Model for pgAcompanhamento component.
  late PgAcompanhamentoModel pgAcompanhamentoModel;
  // Model for pgNotificacoes component.
  late PgNotificacoesModel pgNotificacoesModel;
  // Model for pgAvisos component.
  late PgAvisosModel pgAvisosModel;
  // Model for pgSolicitacoesSos component.
  late PgSolicitacoesSosModel pgSolicitacoesSosModel;

  @override
  void initState(BuildContext context) {
    navMenuModel = createModel(context, () => NavMenuModel());
    pgContasModel = createModel(context, () => PgContasModel());
    pgDashboardModel = createModel(context, () => PgDashboardModel());
    pgUsuariosModel = createModel(context, () => PgUsuariosModel());
    pgEmpresasModel = createModel(context, () => PgEmpresasModel());
    pgEmbarcacoesModel = createModel(context, () => PgEmbarcacoesModel());
    pgViagensModel = createModel(context, () => PgViagensModel());
    pgAcompanhamentoModel = createModel(context, () => PgAcompanhamentoModel());
    pgNotificacoesModel = createModel(context, () => PgNotificacoesModel());
    pgAvisosModel = createModel(context, () => PgAvisosModel());
    pgSolicitacoesSosModel =
        createModel(context, () => PgSolicitacoesSosModel());
  }

  @override
  void dispose() {
    navMenuModel.dispose();
    pgContasModel.dispose();
    pgDashboardModel.dispose();
    pgUsuariosModel.dispose();
    pgEmpresasModel.dispose();
    pgEmbarcacoesModel.dispose();
    pgViagensModel.dispose();
    pgAcompanhamentoModel.dispose();
    pgNotificacoesModel.dispose();
    pgAvisosModel.dispose();
    pgSolicitacoesSosModel.dispose();
  }
}
