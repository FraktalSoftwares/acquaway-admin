import '../database.dart';

class SosTable extends SupabaseTable<SosRow> {
  @override
  String get tableName => 'sos';

  @override
  SosRow createRow(Map<String, dynamic> data) => SosRow(data);
}

class SosRow extends SupabaseDataRow {
  SosRow(super.data);

  @override
  SupabaseTable get table => SosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get companieId => getField<int>('companie_id');
  set companieId(int? value) => setField<int>('companie_id', value);

  String? get userIdPiloto => getField<String>('user_id_piloto');
  set userIdPiloto(String? value) => setField<String>('user_id_piloto', value);

  String? get tipoSos => getField<String>('tipo_sos');
  set tipoSos(String? value) => setField<String>('tipo_sos', value);

  String? get userIdAtendente => getField<String>('user_id_atendente');
  set userIdAtendente(String? value) =>
      setField<String>('user_id_atendente', value);

  String? get lat => getField<String>('lat');
  set lat(String? value) => setField<String>('lat', value);

  String? get long => getField<String>('long');
  set long(String? value) => setField<String>('long', value);

  int? get embarcacoesId => getField<int>('embarcacoes_id');
  set embarcacoesId(int? value) => setField<int>('embarcacoes_id', value);

  int? get viagemId => getField<int>('viagem_id');
  set viagemId(int? value) => setField<int>('viagem_id', value);

  bool? get resolvida => getField<bool>('resolvida');
  set resolvida(bool? value) => setField<bool>('resolvida', value);
}
