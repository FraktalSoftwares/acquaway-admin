import 'dart:math' as math;

String latLogGraus(
  String lat,
  String long,
) {
  // Função interna para converter um único valor de grau decimal (DD) para DMS
  String converterParaDMS(double dd, bool isLatitude) {
    // 1. Determina a direção
    String direcao;
    if (isLatitude) {
      direcao = dd >= 0 ? 'N' : 'S';
    } else {
      direcao = dd >= 0 ? 'E' : 'W';
    }

    // 2. Cálculo do valor absoluto
    double valorAbsoluto = math.max(0.0, dd.abs());

    // 3. Graus (D)
    int graus = valorAbsoluto.floor();

    // 4. Minutos (M)
    double parteDecimal = valorAbsoluto - graus;
    double minTotal = parteDecimal * 60;
    int min = minTotal.floor();

    // 5. Segundos (S)
    double parteDecimalMin = minTotal - min;
    double seg = parteDecimalMin * 60;

    // --- Formatação ---

    String strGraus;
    if (isLatitude) {
      // CORREÇÃO: Latitude usa 2 dígitos (ex: 03°)
      strGraus = graus.toString().padLeft(2, '0');
    } else {
      // CORREÇÃO: Longitude usa 3 dígitos (ex: 043°)
      strGraus = graus.toString().padLeft(3, '0');
    }

    // Minutos com 2 dígitos
    String strMin = min.toString().padLeft(2, '0');

    // CORREÇÃO DOS SEGUNDOS (SOLICITADA):
    // Garante 2 casas decimais fixas e preenche com 0 à esquerda se for menor que 10
    // Ex: 2.23 vira "02.23" (5 caracteres)
    String strSeg = seg.toStringAsFixed(2).padLeft(5, '0');

    return '$strGraus° $strMin\' $strSeg" $direcao';
  }

  // --- Processamento dos Parâmetros ---

  double? latitude;
  double? longitude;
  try {
    latitude = double.tryParse(lat.trim());
    longitude = double.tryParse(long.trim());
  } catch (e) {
    return 'Erro: Coordenadas inválidas.';
  }

  if (latitude == null || longitude == null) {
    return 'Erro: Coordenadas inválidas (null).';
  }

  String resultadoLat = converterParaDMS(latitude, true);
  String resultadoLong = converterParaDMS(longitude, false);

  return '$resultadoLat   $resultadoLong';
}

DateTime trintaDiasAtras(DateTime data) {
  // Subtrai 30 dias da data fornecida
  return data.subtract(const Duration(days: 30));
}

DateTime noventaDiasAtras(DateTime data) {
  // Subtrai 30 dias da data fornecida
  return data.subtract(const Duration(days: 90));
}
