import '/flutter_flow/flutter_flow_util.dart';
import 'pp_download_relatorio_widget.dart' show PpDownloadRelatorioWidget;
import 'package:flutter/material.dart';

class PpDownloadRelatorioModel
    extends FlutterFlowModel<PpDownloadRelatorioWidget> {
  ///  Local state fields for this component.

  // Tipo de relatório: 'compilado' ou 'descritivo'
  String tipoRelatorio = 'compilado';

  // Estatísticas selecionadas (apenas as 11 opções do modal)
  bool faturamentoMensal = false;
  bool faturamentoRecebido = false;
  bool valoresPendentes = false;
  bool taxaInadimplencia = false;
  bool numeroAssinaturasPlano = false;
  bool usuariosCadastrados = false;
  bool empresasCadastradas = false;
  bool totalViagensRealizadas = false;
  bool totalEmbarcacoesCadastradas = false;
  bool mediaEmbarcacoesPorEmpresa = false;
  bool mediaEmbarcacoesPorPiloto = false;

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
    if (numeroAssinaturasPlano) selecionadas.add('numero_assinaturas_plano');
    if (usuariosCadastrados) selecionadas.add('usuarios_cadastrados');
    if (empresasCadastradas) selecionadas.add('empresas_cadastradas');
    if (totalViagensRealizadas) selecionadas.add('total_viagens_realizadas');
    if (totalEmbarcacoesCadastradas) {
      selecionadas.add('total_embarcacoes_cadastradas');
    }
    if (mediaEmbarcacoesPorEmpresa) {
      selecionadas.add('media_embarcacoes_por_empresa');
    }
    if (mediaEmbarcacoesPorPiloto) {
      selecionadas.add('media_embarcacoes_por_piloto');
    }
    return selecionadas;
  }
}
