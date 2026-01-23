import '../database.dart';

class VwViagensResumoTable extends SupabaseTable<VwViagensResumoRow> {
  @override
  String get tableName => 'vw_viagens_resumo';

  @override
  VwViagensResumoRow createRow(Map<String, dynamic> data) =>
      VwViagensResumoRow(data);
}

class VwViagensResumoRow extends SupabaseDataRow {
  VwViagensResumoRow(super.data);

  @override
  SupabaseTable get table => VwViagensResumoTable();

  int? get idViagem => getField<int>('id_viagem');
  set idViagem(int? value) => setField<int>('id_viagem', value);

  int? get idEmbarcacao => getField<int>('id_embarcacao');
  set idEmbarcacao(int? value) => setField<int>('id_embarcacao', value);

  String? get nomeBarco => getField<String>('nome_barco');
  set nomeBarco(String? value) => setField<String>('nome_barco', value);

  int? get companieId => getField<int>('companie_id');
  set companieId(int? value) => setField<int>('companie_id', value);

  String? get nomeEmpresa => getField<String>('nome_empresa');
  set nomeEmpresa(String? value) => setField<String>('nome_empresa', value);

  String? get cnpjEmpresa => getField<String>('cnpj_empresa');
  set cnpjEmpresa(String? value) => setField<String>('cnpj_empresa', value);

  String? get userIdPiloto => getField<String>('user_id_piloto');
  set userIdPiloto(String? value) => setField<String>('user_id_piloto', value);

  String? get nomePiloto => getField<String>('nome_piloto');
  set nomePiloto(String? value) => setField<String>('nome_piloto', value);

  String? get fotoPiloto => getField<String>('foto_piloto');
  set fotoPiloto(String? value) => setField<String>('foto_piloto', value);

  String? get emailPiloto => getField<String>('email_piloto');
  set emailPiloto(String? value) => setField<String>('email_piloto', value);

  int? get duracaoMinutos => getField<int>('duracao_minutos');
  set duracaoMinutos(int? value) => setField<int>('duracao_minutos', value);

  DateTime? get dataViagem => getField<DateTime>('data_viagem');
  set dataViagem(DateTime? value) => setField<DateTime>('data_viagem', value);

  PostgresTime? get horaInicio => getField<PostgresTime>('hora_inicio');
  set horaInicio(PostgresTime? value) =>
      setField<PostgresTime>('hora_inicio', value);

  PostgresTime? get horaFim => getField<PostgresTime>('hora_fim');
  set horaFim(PostgresTime? value) => setField<PostgresTime>('hora_fim', value);

  double? get kmTotais => getField<double>('km_totais');
  set kmTotais(double? value) => setField<double>('km_totais', value);

  String? get origemLocal => getField<String>('origem_local');
  set origemLocal(String? value) => setField<String>('origem_local', value);

  String? get origemLat => getField<String>('origem_lat');
  set origemLat(String? value) => setField<String>('origem_lat', value);

  String? get origemLong => getField<String>('origem_long');
  set origemLong(String? value) => setField<String>('origem_long', value);

  String? get origemCidade => getField<String>('origem_cidade');
  set origemCidade(String? value) => setField<String>('origem_cidade', value);

  String? get origemEstado => getField<String>('origem_estado');
  set origemEstado(String? value) => setField<String>('origem_estado', value);

  String? get destinoLocal => getField<String>('destino_local');
  set destinoLocal(String? value) => setField<String>('destino_local', value);

  String? get destinoLat => getField<String>('destino_lat');
  set destinoLat(String? value) => setField<String>('destino_lat', value);

  String? get destinoLong => getField<String>('destino_long');
  set destinoLong(String? value) => setField<String>('destino_long', value);

  String? get destinoCidade => getField<String>('destino_cidade');
  set destinoCidade(String? value) => setField<String>('destino_cidade', value);

  String? get destinoEstado => getField<String>('destino_estado');
  set destinoEstado(String? value) => setField<String>('destino_estado', value);
}
