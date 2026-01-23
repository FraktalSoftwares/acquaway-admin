// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:excel/excel.dart';
import 'package:download/download.dart';
import 'package:intl/intl.dart';
import '/core/utils/logger.dart';

Future exportAvisosExcel(DateTime dataInicio, DateTime dataFim) async {
  try {
    AppLogger.i('=== INÍCIO DA EXPORTAÇÃO ACQUAWAY ===');

    // Formatação das datas para o filtro do Supabase (YYYY-MM-DD)
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    String strInicio = formatter.format(dataInicio);
    String strFim = formatter.format(dataFim);

    // Lista para armazenar todos os dados da View
    List<Map<String, dynamic>> allData = [];

    // Configuração da paginação para não travar o app
    int batchSize = 1000;
    int offset = 0;
    bool hasMoreData = true;

    AppLogger.i('Buscando dados na avisos entre $strInicio e $strFim...');

    // Loop para buscar os dados em lotes
    while (hasMoreData) {
      final response = await SupaFlow.client
          .from('avisos')
          .select()
          .gte('created_at', strInicio)
          .lte('created_at', strFim)
          .range(offset, offset + batchSize - 1);

      if (response.isNotEmpty) {
        allData.addAll(List<Map<String, dynamic>>.from(response));
        AppLogger.d('Batch carregado: ${response.length} registros');
      }

      if (response.length < batchSize) {
        hasMoreData = false;
      } else {
        offset += batchSize;
      }
    }

    if (allData.isEmpty) {
      AppLogger.w('AVISO: Nenhum registro encontrado para este período.');
      return;
    }

    AppLogger.i('Criando arquivo Excel...');
    var excel = Excel.createExcel();
    Sheet sheet = excel['Sheet1'];

    // Template de mapeamento: "Nome no Excel": "Coluna na View"
    const template = <String, String>{
      'ID': 'id',
      'Data': 'created_at',
      'aviso': 'aviso',
      'duracao': 'duracao',
      'status': 'status',
      'titulo_aviso': 'titulo_aviso',
      'lat': 'lat',
      'lon': 'lon',
      'milhas': 'milhas',
    };

    final headers = template.keys.toList();

    // 1. Adicionar Headers (Linha 0)
    for (var i = 0; i < headers.length; i++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0))
          .value = TextCellValue(headers[i]);
    }

    // 2. Preencher Dados (Linhas 1+)
    for (var rowIndex = 0; rowIndex < allData.length; rowIndex++) {
      final rowData = allData[rowIndex];

      for (var colIndex = 0; colIndex < headers.length; colIndex++) {
        final headerName = headers[colIndex];
        final viewKey = template[headerName]!;
        var value = rowData[viewKey];

        var cell = sheet.cell(
          CellIndex.indexByColumnRow(
            columnIndex: colIndex,
            rowIndex: rowIndex + 1,
          ),
        );

        if (value == null) {
          cell.value = TextCellValue('');
        } else if (value is num) {
          cell.value = DoubleCellValue(value.toDouble());
        } else {
          cell.value = TextCellValue(value.toString());
        }
      }
    }

    // Ajuste de largura das colunas
    for (var i = 0; i < headers.length; i++) {
      sheet.setColumnWidth(i, 20);
    }

    AppLogger.i('Codificando e baixando arquivo...');
    var bytes = excel.encode();
    if (bytes != null) {
      // Gera o nome do arquivo com a data de início para facilitar a organização
      String fileName = 'Relatorio_Avisos_$strInicio';
      await download(Stream.fromIterable(bytes), '$fileName.xlsx');
    }

    AppLogger.i('=== EXPORTAÇÃO CONCLUÍDA COM SUCESSO! ===');
  } catch (e, stackTrace) {
    AppLogger.e('Erro crítico na exportação', e, stackTrace);
  }
}
