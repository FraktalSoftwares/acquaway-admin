import '../database.dart';

class ViagensParadasTable extends SupabaseTable<ViagensParadasRow> {
  @override
  String get tableName => 'viagens_paradas';

  @override
  ViagensParadasRow createRow(Map<String, dynamic> data) =>
      ViagensParadasRow(data);
}

class ViagensParadasRow extends SupabaseDataRow {
  ViagensParadasRow(super.data);

  @override
  SupabaseTable get table => ViagensParadasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get viagensId => getField<int>('viagens_id');
  set viagensId(int? value) => setField<int>('viagens_id', value);

  int? get viagemLocalizacoesId => getField<int>('viagem_localizacoes_id');
  set viagemLocalizacoesId(int? value) =>
      setField<int>('viagem_localizacoes_id', value);

  int? get minutosParados => getField<int>('minutos_parados');
  set minutosParados(int? value) => setField<int>('minutos_parados', value);
}
