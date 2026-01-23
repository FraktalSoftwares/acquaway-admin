import '../database.dart';

class ViagemLocalizacoesTable extends SupabaseTable<ViagemLocalizacoesRow> {
  @override
  String get tableName => 'viagem_localizacoes';

  @override
  ViagemLocalizacoesRow createRow(Map<String, dynamic> data) =>
      ViagemLocalizacoesRow(data);
}

class ViagemLocalizacoesRow extends SupabaseDataRow {
  ViagemLocalizacoesRow(super.data);

  @override
  SupabaseTable get table => ViagemLocalizacoesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get viagemId => getField<int>('viagem_id');
  set viagemId(int? value) => setField<int>('viagem_id', value);

  String? get lat => getField<String>('lat');
  set lat(String? value) => setField<String>('lat', value);

  String? get long => getField<String>('long');
  set long(String? value) => setField<String>('long', value);

  String? get local => getField<String>('local');
  set local(String? value) => setField<String>('local', value);

  String? get cidade => getField<String>('cidade');
  set cidade(String? value) => setField<String>('cidade', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);

  String? get clima => getField<String>('clima');
  set clima(String? value) => setField<String>('clima', value);

  int? get companiesId => getField<int>('companies_id');
  set companiesId(int? value) => setField<int>('companies_id', value);

  int? get sort => getField<int>('sort');
  set sort(int? value) => setField<int>('sort', value);
}
