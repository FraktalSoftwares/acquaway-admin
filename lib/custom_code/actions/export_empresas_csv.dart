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

Future<void> exportEmpresasCSV() async {
  try {
    AppLogger.i('=== INÍCIO DA EXPORTAÇÃO CSV DE EMPRESAS ATIVAS ===');

    // Buscar todas as empresas ativas
    final empresas = await CompaniesTable().queryRows(
      queryFn: (q) => q.eq('ativo', true),
    );

    if (empresas.isEmpty) {
      AppLogger.w('Nenhuma empresa ativa encontrada para exportação.');
      return;
    }

    // Preparar dados do CSV
    List<List<dynamic>> csvData = [];

    // Cabeçalhos
    csvData.add([
      'ID',
      'Nome',
      'CNPJ',
      'Email',
      'Telefone',
      'Área de Atuação',
      'Atividade da Empresa',
      'CEP',
      'Endereço',
      'Número',
      'Bairro',
      'Cidade',
      'Estado',
      'Data de Criação',
      'Aprovada',
    ]);

    // Dados das empresas
    for (var empresa in empresas) {
      csvData.add([
        empresa.id.toString(),
        empresa.nome ?? '',
        empresa.cnpj ?? '',
        empresa.email ?? '',
        empresa.telefone ?? '',
        empresa.areaAtuacao ?? '',
        empresa.atividadeEmpresa ?? '',
        empresa.cep ?? '',
        empresa.endereco ?? '',
        empresa.numero ?? '',
        empresa.bairro ?? '',
        empresa.cidade ?? '',
        empresa.estado ?? '',
        DateFormat('dd/MM/yyyy HH:mm:ss').format(empresa.createdAt),
        empresa.aprovadas == true ? 'Sim' : 'Não',
      ]);
    }

    // Converter para CSV
    String csv = const ListToCsvConverter().convert(csvData);

    // Gerar nome do arquivo
    String timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    String fileName = 'Relatorio_Empresas_Ativas_$timestamp.csv';

    // Converter string para bytes (UTF-8)
    final csvBytes = utf8.encode(csv).toList();

    // Download do arquivo
    await download(Stream.fromIterable(csvBytes), fileName);

    AppLogger.i('=== EXPORTAÇÃO CSV CONCLUÍDA COM SUCESSO! ===');
    AppLogger.i('Total de empresas exportadas: ${empresas.length}');
  } catch (e, stackTrace) {
    AppLogger.e('Erro crítico na exportação CSV de empresas', e, stackTrace);
    rethrow;
  }
}
