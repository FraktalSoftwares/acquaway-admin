import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/core/utils/logger.dart';
import '/core/config/env_config.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Supabase Edge Group Code

class SupabaseEdgeGroup {
  static String getBaseUrl() =>
      'https://ljpuzupbogxjdowibfoy.supabase.co/functions/v1/';
  static Map<String, String> headers = {};
  
  /// Gera headers padrão para Edge Functions do Supabase
  /// Inclui apenas apikey obrigatório
  static Map<String, String> getDefaultHeaders() {
    return <String, String>{
      'apikey': EnvConfig.supabaseAnonKey,
      'Content-Type': 'application/json',
    };
  }
  
  static BuscarViagensAtivasCall buscarViagensAtivasCall =
      BuscarViagensAtivasCall();
  static TotalDeUsersPorTipoCall totalDeUsersPorTipoCall =
      TotalDeUsersPorTipoCall();
  static TotalDeUserEEmpresasCall totalDeUserEEmpresasCall =
      TotalDeUserEEmpresasCall();
  static TotalViagensCall totalViagensCall = TotalViagensCall();
  static TotalDeAlertasCall totalDeAlertasCall = TotalDeAlertasCall();
  static TotalDeSOSCall totalDeSOSCall = TotalDeSOSCall();
  static AtivarOuInativarEmpresaCall ativarOuInativarEmpresaCall =
      AtivarOuInativarEmpresaCall();
  static DadosDoDashboardCall dadosDoDashboardCall = DadosDoDashboardCall();
  static BuscarDadosDaDashboardGraficosCall buscarDadosDaDashboardGraficosCall =
      BuscarDadosDaDashboardGraficosCall();
  static BuscarMesEvolucaoCall buscarMesEvolucaoCall = BuscarMesEvolucaoCall();
}

class BuscarViagensAtivasCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SupabaseEdgeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Buscar Viagens Ativas',
      apiUrl: '${baseUrl}get_active_trips',
      callType: ApiCallType.GET,
      headers: SupabaseEdgeGroup.getDefaultHeaders(),
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? viagenscoordenadasformatadas(dynamic response) => (getJsonField(
        response,
        r'''$.viagens[:].coordenadas_formatadas''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? viagensqtdalertas(dynamic response) => (getJsonField(
        response,
        r'''$.viagens[:].qtd_alertas''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<bool>? viagenssosemitido(dynamic response) => (getJsonField(
        response,
        r'''$.viagens[:].sos_emitido''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<String>? viagensdestino(dynamic response) => (getJsonField(
        response,
        r'''$.viagens[:].destino''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? viagensorigem(dynamic response) => (getJsonField(
        response,
        r'''$.viagens[:].origem''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? viagensnomepiloto(dynamic response) => (getJsonField(
        response,
        r'''$.viagens[:].nome_piloto''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? viagensnomebarco(dynamic response) => (getJsonField(
        response,
        r'''$.viagens[:].nome_barco''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? viagensviagemid(dynamic response) => (getJsonField(
        response,
        r'''$.viagens[:].viagem_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? viagens(dynamic response) => getJsonField(
        response,
        r'''$.viagens''',
        true,
      ) as List?;
}

class TotalDeUsersPorTipoCall {
  Future<ApiCallResponse> call({
    String? inicio = '',
    String? fim = '',
  }) async {
    final baseUrl = SupabaseEdgeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Total de users por tipo',
      apiUrl: '${baseUrl}get-user-stats',
      callType: ApiCallType.GET,
      headers: SupabaseEdgeGroup.getDefaultHeaders(),
      params: {
        'inicio': inicio,
        'fim': fim,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total''',
      ));
  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
}

class TotalDeUserEEmpresasCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SupabaseEdgeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Total de user e empresas',
      apiUrl: '${baseUrl}get-general-stats',
      callType: ApiCallType.GET,
      headers: SupabaseEdgeGroup.getDefaultHeaders(),
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalusers(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_users''',
      ));
  int? totalcompanies(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_companies''',
      ));
  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
}

class TotalViagensCall {
  Future<ApiCallResponse> call({
    String? inicio = '',
    String? fim = '',
  }) async {
    final baseUrl = SupabaseEdgeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Total viagens',
      apiUrl: '${baseUrl}get-dashboard-stats',
      callType: ApiCallType.GET,
      headers: SupabaseEdgeGroup.getDefaultHeaders(),
      params: {
        'inicio': inicio,
        'fim': fim,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  double? mediaembarcacoesporpiloto(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.media_embarcacoes_por_piloto''',
      ));
  double? mediaembarcacoesporempresa(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.media_embarcacoes_por_empresa''',
      ));
  int? totalembarcacoes(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_embarcacoes''',
      ));
  int? totalviagens(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_viagens''',
      ));
}

class TotalDeAlertasCall {
  Future<ApiCallResponse> call({
    String? inicio = '',
    String? fim = '',
  }) async {
    final baseUrl = SupabaseEdgeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Total de Alertas',
      apiUrl: '${baseUrl}get-alert-counts',
      callType: ApiCallType.GET,
      headers: SupabaseEdgeGroup.getDefaultHeaders(),
      params: {
        'inicio': inicio,
        'fim': fim,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total''',
      ));
  int? alertasFumaa(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.alertas.Fumaça''',
      ));
  int? alertasNeblina(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.alertas.Neblina''',
      ));
  dynamic alertas(dynamic response) => getJsonField(
        response,
        r'''$.alertas''',
      );
}

class TotalDeSOSCall {
  Future<ApiCallResponse> call({
    String? inicio = '',
    String? fim = '',
  }) async {
    final baseUrl = SupabaseEdgeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Total de SOS',
      apiUrl: '${baseUrl}get-sos-stats',
      callType: ApiCallType.GET,
      headers: SupabaseEdgeGroup.getDefaultHeaders(),
      params: {
        'inicio': inicio,
        'fim': fim,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic sos(dynamic response) => getJsonField(
        response,
        r'''$.sos''',
      );
  int? sosNaufrgio(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.sos.Naufrágio''',
      ));
  int? sosIncndio(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.sos.Incêndio''',
      ));
  int? sosAbalroamento(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.sos.Abalroamento''',
      ));
  int? sosColiso(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.sos.Colisão''',
      ));
  int? sosAlagamento(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.sos.Alagamento''',
      ));
  int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total''',
      ));
}

class AtivarOuInativarEmpresaCall {
  Future<ApiCallResponse> call({
    int? companyId,
    bool? status,
  }) async {
    final baseUrl = SupabaseEdgeGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "company_id": $companyId,
  "status": $status
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Ativar ou Inativar Empresa',
      apiUrl: '${baseUrl}toggle-company-status',
      callType: ApiCallType.POST,
      headers: SupabaseEdgeGroup.getDefaultHeaders(),
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class DadosDoDashboardCall {
  Future<ApiCallResponse> call({
    String? dataInicio = '',
    String? dataFim = '',
  }) async {
    final baseUrl = SupabaseEdgeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Dados do Dashboard',
      apiUrl: '${baseUrl}get-dashboard-metrics',
      callType: ApiCallType.GET,
      headers: SupabaseEdgeGroup.getDefaultHeaders(),
      params: {
        'dataInicio': dataInicio,
        'dataFim': dataFim,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  double? totalgeral(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.total_geral''',
      ));
  double? recebido(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.recebido''',
      ));
  double? pendente(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.pendente''',
      ));
  String? taxainadimplencia(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.taxa_inadimplencia''',
      ));
  double? totalassinaturascount(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.total_assinaturas_count''',
      ));
}

class BuscarDadosDaDashboardGraficosCall {
  Future<ApiCallResponse> call({
    String? dataInicio = '',
    String? dataFim = '',
  }) async {
    final baseUrl = SupabaseEdgeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Buscar dados da Dashboard Graficos',
      apiUrl: '${baseUrl}get-subscriptions-by-type',
      callType: ApiCallType.GET,
      headers: SupabaseEdgeGroup.getDefaultHeaders(),
      params: {
        'dataInicio': dataInicio,
        'dataFim': dataFim,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic plans(dynamic response) => getJsonField(
        response,
        r'''$.plans''',
      );
  double? total(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.total''',
      ));
  bool? filtroaplicado(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.filtro_aplicado''',
      ));
}

class BuscarMesEvolucaoCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SupabaseEdgeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Buscar Mes Evolucao',
      apiUrl: '${baseUrl}get-monthly-evolution',
      callType: ApiCallType.GET,
      headers: SupabaseEdgeGroup.getDefaultHeaders(),
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<double>? ticketMedio(dynamic response) => (getJsonField(
        response,
        r'''$[:].ticketMedio''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? somaValores(dynamic response) => (getJsonField(
        response,
        r'''$[:].somaValores''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? totalAssinaturas(dynamic response) => (getJsonField(
        response,
        r'''$[:].totalAssinaturas''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<String>? mes(dynamic response) => (getJsonField(
        response,
        r'''$[:].mes''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Supabase Edge Group Code

class WeatherNowCall {
  static Future<ApiCallResponse> call({
    String? lat = '',
    String? lon = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Weather Now',
      apiUrl:
          'https://ljpuzupbogxjdowibfoy.supabase.co/functions/v1/weather_now?lat=$lat&lon=$lon',
      callType: ApiCallType.GET,
      headers: SupabaseEdgeGroup.getDefaultHeaders(),
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? ventohojedirecaocardeal(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.vento_hoje.direcao_cardeal''',
      ));
  static int? ventohojedirecaograus(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.vento_hoje.direcao_graus''',
      ));
  static int? ventohojerajadaskmh(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.vento_hoje.rajadas_kmh''',
      ));
  static int? ventohojevelocidadekmh(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.vento_hoje.velocidade_kmh''',
      ));
  static dynamic ventohoje(dynamic response) => getJsonField(
        response,
        r'''$.vento_hoje''',
      );
  static int? resumohojeprecipitacaoprobabilidadepercentual(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.resumo_hoje.precipitacao.probabilidade_percentual''',
      ));
  static int? resumohojeprecipitacaovolumemm(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.resumo_hoje.precipitacao.volume_mm''',
      ));
  static dynamic resumohojeprecipitacao(dynamic response) => getJsonField(
        response,
        r'''$.resumo_hoje.precipitacao''',
      );
  static String? resumohojevisibilidadeunidade(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.resumo_hoje.visibilidade.unidade''',
      ));
  static int? resumohojevisibilidadedistancia(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.resumo_hoje.visibilidade.distancia''',
      ));
  static dynamic resumohojevisibilidade(dynamic response) => getJsonField(
        response,
        r'''$.resumo_hoje.visibilidade''',
      );
  static String? resumohojecondicaogeral(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.resumo_hoje.condicao_geral''',
      ));
  static int? resumohojetemperaturaagoracelsius(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.resumo_hoje.temperatura_agora_celsius''',
      ));
  static dynamic resumohoje(dynamic response) => getJsonField(
        response,
        r'''$.resumo_hoje''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (e) {
    AppLogger.w("List serialization failed. Returning empty list.", e);
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (e) {
    AppLogger.w("Json serialization failed. Returning empty json.", e);
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
