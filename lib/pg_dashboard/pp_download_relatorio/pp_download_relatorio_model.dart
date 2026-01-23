import '/flutter_flow/flutter_flow_util.dart';
import 'pp_download_relatorio_widget.dart' show PpDownloadRelatorioWidget;
import 'package:flutter/material.dart';

class PpDownloadRelatorioModel
    extends FlutterFlowModel<PpDownloadRelatorioWidget> {
  ///  Local state fields for this component.

  // Tipo de relatório: 'compilado' ou 'descritivo'
  String tipoRelatorio = 'compilado';

  // Estatísticas selecionadas
  bool faturamentoMensal = false;
  bool faturamentoRecebido = false;
  bool valoresPendentes = false;
  bool taxaInadimplencia = false;
  bool ticketMedioEmpresa = false;
  bool numeroAssinaturasPlano = false;
  bool usuariosCadastrados = false;
  bool empresasCadastradas = false;
  bool numeroUsuariosPorTipo = false;
  bool totalViagensRealizadas = false;
  bool totalEmbarcacoesCadastradas = false;
  bool mediaEmbarcacoesPorEmpresa = false;
  bool mediaEmbarcacoesPorPiloto = false;
  bool sosEmitidosPorTipo = false;
  bool alertasEmitidosPorTipo = false;
  bool planejamentoViagensPorTipo = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  // Retorna lista de estatísticas selecionadas
  List<String> getEstatisticasSelecionadas() {
    List<String> selecionadas = [];
    if (faturamentoMensal) selecionadas.add('faturamento_mensal');
    if (faturamentoRecebido) selecionadas.add('faturamento_recebido');
    if (valoresPendentes) selecionadas.add('valores_pendentes');
    if (taxaInadimplencia) selecionadas.add('taxa_inadimplencia');
    if (ticketMedioEmpresa) selecionadas.add('ticket_medio_empresa');
    if (numeroAssinaturasPlano) selecionadas.add('numero_assinaturas_plano');
    if (usuariosCadastrados) selecionadas.add('usuarios_cadastrados');
    if (empresasCadastradas) selecionadas.add('empresas_cadastradas');
    if (numeroUsuariosPorTipo) selecionadas.add('numero_usuarios_por_tipo');
    if (totalViagensRealizadas) selecionadas.add('total_viagens_realizadas');
    if (totalEmbarcacoesCadastradas)
      selecionadas.add('total_embarcacoes_cadastradas');
    if (mediaEmbarcacoesPorEmpresa)
      selecionadas.add('media_embarcacoes_por_empresa');
    if (mediaEmbarcacoesPorPiloto)
      selecionadas.add('media_embarcacoes_por_piloto');
    if (sosEmitidosPorTipo) selecionadas.add('sos_emitidos_por_tipo');
    if (alertasEmitidosPorTipo) selecionadas.add('alertas_emitidos_por_tipo');
    if (planejamentoViagensPorTipo)
      selecionadas.add('planejamento_viagens_por_tipo');
    return selecionadas;
  }
}
