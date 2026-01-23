import '../database.dart';

class ViewSosCompletoTable extends SupabaseTable<ViewSosCompletoRow> {
  @override
  String get tableName => 'view_sos_completo';

  @override
  ViewSosCompletoRow createRow(Map<String, dynamic> data) =>
      ViewSosCompletoRow(data);
}

class ViewSosCompletoRow extends SupabaseDataRow {
  ViewSosCompletoRow(super.data);

  @override
  SupabaseTable get table => ViewSosCompletoTable();

  int? get sosId => getField<int>('sos_id');
  set sosId(int? value) => setField<int>('sos_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get lat => getField<String>('lat');
  set lat(String? value) => setField<String>('lat', value);

  String? get long => getField<String>('long');
  set long(String? value) => setField<String>('long', value);

  String? get tipo => getField<String>('tipo');
  set tipo(String? value) => setField<String>('tipo', value);

  int? get viagemId => getField<int>('viagem_id');
  set viagemId(int? value) => setField<int>('viagem_id', value);

  int? get embarcacoesId => getField<int>('embarcacoes_id');
  set embarcacoesId(int? value) => setField<int>('embarcacoes_id', value);

  bool? get resolvida => getField<bool>('resolvida');
  set resolvida(bool? value) => setField<bool>('resolvida', value);

  String? get nomePiloto => getField<String>('nome_piloto');
  set nomePiloto(String? value) => setField<String>('nome_piloto', value);

  String? get emailPiloto => getField<String>('email_piloto');
  set emailPiloto(String? value) => setField<String>('email_piloto', value);

  String? get nomeAtendente => getField<String>('nome_atendente');
  set nomeAtendente(String? value) => setField<String>('nome_atendente', value);

  int? get companieId => getField<int>('companie_id');
  set companieId(int? value) => setField<int>('companie_id', value);

  String? get nomeCompanie => getField<String>('nome_companie');
  set nomeCompanie(String? value) => setField<String>('nome_companie', value);
}
