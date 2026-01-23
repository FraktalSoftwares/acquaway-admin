// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:download/download.dart';
import 'package:intl/intl.dart';
import '/core/utils/logger.dart';

Future<void> exportEmbarcacoesCSV(bool? filtroAtivo) async {
  try {
    AppLogger.i('=== INÍCIO DA EXPORTAÇÃO CSV DE EMBARCAÇÕES ===');

    // Buscar todas as embarcações com filtro opcional por status
    List<EmbarcacoesRow> embarcacoes;
    
    if (filtroAtivo != null) {
      embarcacoes = await EmbarcacoesTable().queryRows(
        queryFn: (q) => q.eq('ativo', filtroAtivo),
      );
    } else {
      embarcacoes = await EmbarcacoesTable().queryRows(
        queryFn: (q) => q,
      );
    }

    if (embarcacoes.isEmpty) {
      AppLogger.w('Nenhuma embarcação encontrada para exportação.');
      return;
    }

    // Preparar dados do CSV
    List<List<dynamic>> csvData = [];

    // Cabeçalhos
    csvData.add([
      'ID',
      'Nome da Embarcação',
      'TIE/TIEM',
      'TIE/PRPM',
      'Comprimento',
      'Boca',
      'Calado',
      'Largura',
      'Classificação de Uso',
      'Status',
      'ID da Empresa',
      'ID do Usuário',
      'Data de Criação',
    ]);

    // Dados das embarcações
    for (var embarcacao in embarcacoes) {
      csvData.add([
        embarcacao.id.toString(),
        embarcacao.nomeEmbarcacoes ?? '',
        embarcacao.tieTiem ?? '',
        embarcacao.tiePrpm ?? '',
        embarcacao.comprimento?.toString() ?? '',
        embarcacao.boca?.toString() ?? '',
        embarcacao.calado?.toString() ?? '',
        embarcacao.largura?.toString() ?? '',
        embarcacao.classificacaoUso ?? '',
        embarcacao.ativo == true ? 'Ativo' : 'Inativo',
        embarcacao.companie?.toString() ?? '',
        embarcacao.userId ?? '',
        DateFormat('dd/MM/yyyy HH:mm:ss').format(embarcacao.createdAt),
      ]);
    }

    // Converter para CSV
    String csv = const ListToCsvConverter().convert(csvData);

    // Gerar nome do arquivo
    String timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    String statusLabel = filtroAtivo == true 
        ? 'Ativas' 
        : filtroAtivo == false 
            ? 'Inativas' 
            : 'Todas';
    String fileName = 'Relatorio_Embarcacoes_${statusLabel}_$timestamp.csv';

    // Converter string para bytes (UTF-8)
    final csvBytes = utf8.encode(csv).toList();

    // Download do arquivo
    await download(Stream.fromIterable(csvBytes), fileName);

    AppLogger.i('=== EXPORTAÇÃO CSV CONCLUÍDA COM SUCESSO! ===');
    AppLogger.i('Total de embarcações exportadas: ${embarcacoes.length}');
  } catch (e, stackTrace) {
    AppLogger.e('Erro crítico na exportação CSV de embarcações', e, stackTrace);
    rethrow;
  }
}
