import '../database.dart';

class AlertasTable extends SupabaseTable<AlertasRow> {
  @override
  String get tableName => 'alertas';

  @override
  AlertasRow createRow(Map<String, dynamic> data) => AlertasRow(data);
}

class AlertasRow extends SupabaseDataRow {
  AlertasRow(super.data);

  @override
  SupabaseTable get table => AlertasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get companiesId => getField<int>('companies_id');
  set companiesId(int? value) => setField<int>('companies_id', value);

  String? get userIdPiloto => getField<String>('user_id_piloto');
  set userIdPiloto(String? value) => setField<String>('user_id_piloto', value);

  String? get lat => getField<String>('lat');
  set lat(String? value) => setField<String>('lat', value);

  String? get long => getField<String>('long');
  set long(String? value) => setField<String>('long', value);

  PostgresTime? get hora => getField<PostgresTime>('hora');
  set hora(PostgresTime? value) => setField<PostgresTime>('hora', value);

  String? get tipoAlerta => getField<String>('tipo_alerta');
  set tipoAlerta(String? value) => setField<String>('tipo_alerta', value);

  int? get viagemId => getField<int>('viagem_id');
  set viagemId(int? value) => setField<int>('viagem_id', value);
}
