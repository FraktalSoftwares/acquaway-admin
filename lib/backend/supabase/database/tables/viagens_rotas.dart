import '../database.dart';

class ViagensRotasTable extends SupabaseTable<ViagensRotasRow> {
  @override
  String get tableName => 'viagens_rotas';

  @override
  ViagensRotasRow createRow(Map<String, dynamic> data) => ViagensRotasRow(data);
}

class ViagensRotasRow extends SupabaseDataRow {
  ViagensRotasRow(super.data);

  @override
  SupabaseTable get table => ViagensRotasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get viagemId => getField<int>('viagem_id');
  set viagemId(int? value) => setField<int>('viagem_id', value);

  String? get lat => getField<String>('lat');
  set lat(String? value) => setField<String>('lat', value);

  String? get lon => getField<String>('lon');
  set lon(String? value) => setField<String>('lon', value);

  int? get direcao => getField<int>('direcao');
  set direcao(int? value) => setField<int>('direcao', value);
}
