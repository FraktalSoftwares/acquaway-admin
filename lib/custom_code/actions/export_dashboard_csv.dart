// Automatic FlutterFlow imports
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:download/download.dart';
import 'package:intl/intl.dart';
import '/core/utils/logger.dart';

Future<void> exportDashboardCSV(
  DateTime? dataInicio,
  DateTime? dataFim,
  String tipoRelatorio,
  List<String> estatisticas,
) async {
  try {
    AppLogger.i('=== INÍCIO DA EXPORTAÇÃO CSV DO DASHBOARD ===');

    // Formatação das datas
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    String strInicio = dataInicio != null ? formatter.format(dataInicio) : '';
    String strFim = dataFim != null ? formatter.format(dataFim) : '';

    List<List<dynamic>> csvData = [];
    List<String> headers = [];

    // Buscar dados do dashboard
    ApiCallResponse? responseDashboard;
    ApiCallResponse? responseUsuarios;
    ApiCallResponse? responseViagens;

    // Buscar dados financeiros
    if (estatisticas.isEmpty ||
        estatisticas.any((e) =>
            e.contains('faturamento') ||
            e.contains('valores') ||
            e.contains('taxa') ||
            e.contains('ticket') ||
            e.contains('assinaturas'))) {
      try {
        responseDashboard = await SupabaseEdgeGroup.dadosDoDashboardCall.call(
          dataInicio: strInicio,
          dataFim: strFim,
        );
      } catch (e) {
        AppLogger.w('Erro ao buscar dados do dashboard: $e');
      }
    }

    // Buscar dados de usuários
    if (estatisticas.isEmpty ||
        estatisticas
            .any((e) => e.contains('usuarios') || e.contains('empresas'))) {
      try {
        responseUsuarios =
            await SupabaseEdgeGroup.totalDeUserEEmpresasCall.call();
      } catch (e) {
        AppLogger.w('Erro ao buscar dados de usuários: $e');
      }
    }

    // Buscar dados de viagens
    if (estatisticas.isEmpty ||
        estatisticas
            .any((e) => e.contains('viagens') || e.contains('embarcacoes'))) {
      try {
        responseViagens = await SupabaseEdgeGroup.totalViagensCall.call(
          inicio: strInicio,
          fim: strFim,
        );
      } catch (e) {
        AppLogger.w('Erro ao buscar dados de viagens: $e');
      }
    }

    // Construir CSV baseado no tipo de relatório
    if (tipoRelatorio == 'compilado') {
      // Relatório compilado - uma linha com todas as estatísticas
      headers = ['Estatística', 'Valor'];
      csvData.add(headers);

      // Adicionar cada estatística selecionada
      if (estatisticas.isEmpty || estatisticas.contains('faturamento_mensal')) {
        final valor = responseDashboard != null
            ? SupabaseEdgeGroup.dadosDoDashboardCall
                .totalgeral(responseDashboard.jsonBody)
            : null;
        csvData.add(['Faturamento mensal', _formatCurrency(valor)]);
      }
      if (estatisticas.isEmpty ||
          estatisticas.contains('faturamento_recebido')) {
        final valor = responseDashboard != null
            ? SupabaseEdgeGroup.dadosDoDashboardCall
                .recebido(responseDashboard.jsonBody)
            : null;
        csvData.add(['Faturamento recebido', _formatCurrency(valor)]);
      }
      if (estatisticas.isEmpty || estatisticas.contains('valores_pendentes')) {
        final valor = responseDashboard != null
            ? SupabaseEdgeGroup.dadosDoDashboardCall
                .pendente(responseDashboard.jsonBody)
            : null;
        csvData
            .add(['Valores pendentes/inadimplentes', _formatCurrency(valor)]);
      }
      if (estatisticas.isEmpty || estatisticas.contains('taxa_inadimplencia')) {
        final valor = responseDashboard != null
            ? SupabaseEdgeGroup.dadosDoDashboardCall
                .taxainadimplencia(responseDashboard.jsonBody)
            : null;
        csvData.add(['Taxa de inadimplência', valor ?? '0%']);
      }
      if (estatisticas.isEmpty ||
          estatisticas.contains('numero_assinaturas_plano')) {
        final valor = responseDashboard != null
            ? SupabaseEdgeGroup.dadosDoDashboardCall
                .totalassinaturascount(responseDashboard.jsonBody)
            : null;
        csvData
            .add(['Número de assinaturas por plano', valor?.toString() ?? '0']);
      }
      if (estatisticas.isEmpty ||
          estatisticas.contains('usuarios_cadastrados')) {
        final valor = responseUsuarios != null
            ? SupabaseEdgeGroup.totalDeUserEEmpresasCall
                .totalusers(responseUsuarios.jsonBody)
            : null;
        csvData.add(['Usuários cadastrados', valor?.toString() ?? '0']);
      }
      if (estatisticas.isEmpty ||
          estatisticas.contains('empresas_cadastradas')) {
        final valor = responseUsuarios != null
            ? SupabaseEdgeGroup.totalDeUserEEmpresasCall
                .totalcompanies(responseUsuarios.jsonBody)
            : null;
        csvData.add(['Empresas cadastradas', valor?.toString() ?? '0']);
      }
      if (estatisticas.isEmpty ||
          estatisticas.contains('total_viagens_realizadas')) {
        final valor = responseViagens != null
            ? SupabaseEdgeGroup.totalViagensCall
                .totalviagens(responseViagens.jsonBody)
            : null;
        csvData.add(['Total de viagens realizadas', valor?.toString() ?? '0']);
      }
      if (estatisticas.isEmpty ||
          estatisticas.contains('total_embarcacoes_cadastradas')) {
        final valor = responseViagens != null
            ? SupabaseEdgeGroup.totalViagensCall
                .totalembarcacoes(responseViagens.jsonBody)
            : null;
        csvData.add(
            ['Total de embarcações cadastradas', valor?.toString() ?? '0']);
      }
      if (estatisticas.isEmpty ||
          estatisticas.contains('media_embarcacoes_por_empresa')) {
        final valor = responseViagens != null
            ? SupabaseEdgeGroup.totalViagensCall
                .mediaembarcacoesporempresa(responseViagens.jsonBody)
            : null;
        csvData.add([
          'Média de embarcações por empresa',
          valor?.toStringAsFixed(2) ?? '0'
        ]);
      }
      if (estatisticas.isEmpty ||
          estatisticas.contains('media_embarcacoes_por_piloto')) {
        final valor = responseViagens != null
            ? SupabaseEdgeGroup.totalViagensCall
                .mediaembarcacoesporpiloto(responseViagens.jsonBody)
            : null;
        csvData.add([
          'Média de embarcações por piloto individual',
          valor?.toStringAsFixed(2) ?? '0'
        ]);
      }
    } else {
      // Relatório descritivo - múltiplas linhas com detalhes
      headers = ['Período', 'Estatística', 'Valor', 'Detalhes'];
      csvData.add(headers);

      String periodo = strInicio.isNotEmpty && strFim.isNotEmpty
          ? '$strInicio a $strFim'
          : 'Período não especificado';

      // Adicionar cada estatística com mais detalhes
      if (estatisticas.isEmpty || estatisticas.contains('faturamento_mensal')) {
        final valor = responseDashboard != null
            ? SupabaseEdgeGroup.dadosDoDashboardCall
                .totalgeral(responseDashboard.jsonBody)
            : null;
        csvData
            .add([periodo, 'Faturamento mensal', _formatCurrency(valor), '']);
      }
      if (estatisticas.isEmpty ||
          estatisticas.contains('faturamento_recebido')) {
        final valor = responseDashboard != null
            ? SupabaseEdgeGroup.dadosDoDashboardCall
                .recebido(responseDashboard.jsonBody)
            : null;
        csvData
            .add([periodo, 'Faturamento recebido', _formatCurrency(valor), '']);
      }
      if (estatisticas.isEmpty || estatisticas.contains('valores_pendentes')) {
        final valor = responseDashboard != null
            ? SupabaseEdgeGroup.dadosDoDashboardCall
                .pendente(responseDashboard.jsonBody)
            : null;
        csvData.add([
          periodo,
          'Valores pendentes/inadimplentes',
          _formatCurrency(valor),
          ''
        ]);
      }
      if (estatisticas.isEmpty || estatisticas.contains('taxa_inadimplencia')) {
        final valor = responseDashboard != null
            ? SupabaseEdgeGroup.dadosDoDashboardCall
                .taxainadimplencia(responseDashboard.jsonBody)
            : null;
        csvData.add([periodo, 'Taxa de inadimplência', valor ?? '0%', '']);
      }
      if (estatisticas.isEmpty ||
          estatisticas.contains('numero_assinaturas_plano')) {
        final valor = responseDashboard != null
            ? SupabaseEdgeGroup.dadosDoDashboardCall
                .totalassinaturascount(responseDashboard.jsonBody)
            : null;
        csvData.add([
          periodo,
          'Número de assinaturas por plano',
          valor?.toString() ?? '0',
          ''
        ]);
      }
      if (estatisticas.isEmpty ||
          estatisticas.contains('usuarios_cadastrados')) {
        final valor = responseUsuarios != null
            ? SupabaseEdgeGroup.totalDeUserEEmpresasCall
                .totalusers(responseUsuarios.jsonBody)
            : null;
        csvData.add(
            [periodo, 'Usuários cadastrados', valor?.toString() ?? '0', '']);
      }
      if (estatisticas.isEmpty ||
          estatisticas.contains('empresas_cadastradas')) {
        final valor = responseUsuarios != null
            ? SupabaseEdgeGroup.totalDeUserEEmpresasCall
                .totalcompanies(responseUsuarios.jsonBody)
            : null;
        csvData.add(
            [periodo, 'Empresas cadastradas', valor?.toString() ?? '0', '']);
      }
      if (estatisticas.isEmpty ||
          estatisticas.contains('total_viagens_realizadas')) {
        final valor = responseViagens != null
            ? SupabaseEdgeGroup.totalViagensCall
                .totalviagens(responseViagens.jsonBody)
            : null;
        csvData.add([
          periodo,
          'Total de viagens realizadas',
          valor?.toString() ?? '0',
          ''
        ]);
      }
      if (estatisticas.isEmpty ||
          estatisticas.contains('total_embarcacoes_cadastradas')) {
        final valor = responseViagens != null
            ? SupabaseEdgeGroup.totalViagensCall
                .totalembarcacoes(responseViagens.jsonBody)
            : null;
        csvData.add([
          periodo,
          'Total de embarcações cadastradas',
          valor?.toString() ?? '0',
          ''
        ]);
      }
      if (estatisticas.isEmpty ||
          estatisticas.contains('media_embarcacoes_por_empresa')) {
        final valor = responseViagens != null
            ? SupabaseEdgeGroup.totalViagensCall
                .mediaembarcacoesporempresa(responseViagens.jsonBody)
            : null;
        csvData.add([
          periodo,
          'Média de embarcações por empresa',
          valor?.toStringAsFixed(2) ?? '0',
          ''
        ]);
      }
      if (estatisticas.isEmpty ||
          estatisticas.contains('media_embarcacoes_por_piloto')) {
        final valor = responseViagens != null
            ? SupabaseEdgeGroup.totalViagensCall
                .mediaembarcacoesporpiloto(responseViagens.jsonBody)
            : null;
        csvData.add([
          periodo,
          'Média de embarcações por piloto individual',
          valor?.toStringAsFixed(2) ?? '0',
          ''
        ]);
      }
    }

    // Converter para CSV
    String csv = const ListToCsvConverter().convert(csvData);

    // Gerar nome do arquivo
    String timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    String fileName = 'Relatorio_Dashboard_$timestamp.csv';

    // Converter string para bytes (UTF-8)
    final csvBytes = utf8.encode(csv).toList();

    // Download do arquivo - Stream.fromIterable espera uma lista de int
    await download(Stream.fromIterable(csvBytes), fileName);

    AppLogger.i('=== EXPORTAÇÃO CSV CONCLUÍDA COM SUCESSO! ===');
  } catch (e, stackTrace) {
    AppLogger.e('Erro crítico na exportação CSV', e, stackTrace);
    rethrow;
  }
}

String _formatCurrency(double? value) {
  if (value == null) return 'R\$ 0,00';
  return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
}
