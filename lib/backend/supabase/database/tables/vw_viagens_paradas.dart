import '../database.dart';

class VwViagensParadasTable extends SupabaseTable<VwViagensParadasRow> {
  @override
  String get tableName => 'vw_viagens_paradas';

  @override
  VwViagensParadasRow createRow(Map<String, dynamic> data) =>
      VwViagensParadasRow(data);
}

class VwViagensParadasRow extends SupabaseDataRow {
  VwViagensParadasRow(super.data);

  @override
  SupabaseTable get table => VwViagensParadasTable();

  int? get idViagem => getField<int>('id_viagem');
  set idViagem(int? value) => setField<int>('id_viagem', value);

  String? get local => getField<String>('local');
  set local(String? value) => setField<String>('local', value);

  String? get lat => getField<String>('lat');
  set lat(String? value) => setField<String>('lat', value);

  String? get long => getField<String>('long');
  set long(String? value) => setField<String>('long', value);

  String? get cidade => getField<String>('cidade');
  set cidade(String? value) => setField<String>('cidade', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);

  int? get minutosParados => getField<int>('minutos_parados');
  set minutosParados(int? value) => setField<int>('minutos_parados', value);
}
