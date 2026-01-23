import '../database.dart';

class ViagensTable extends SupabaseTable<ViagensRow> {
  @override
  String get tableName => 'viagens';

  @override
  ViagensRow createRow(Map<String, dynamic> data) => ViagensRow(data);
}

class ViagensRow extends SupabaseDataRow {
  ViagensRow(super.data);

  @override
  SupabaseTable get table => ViagensTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get companieId => getField<int>('companie_id');
  set companieId(int? value) => setField<int>('companie_id', value);

  int? get embarcacaoId => getField<int>('embarcacao_id');
  set embarcacaoId(int? value) => setField<int>('embarcacao_id', value);

  String? get userIdPiloto => getField<String>('user_id_piloto');
  set userIdPiloto(String? value) => setField<String>('user_id_piloto', value);

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);

  double? get distancia => getField<double>('distancia');
  set distancia(double? value) => setField<double>('distancia', value);

  int? get origem => getField<int>('origem');
  set origem(int? value) => setField<int>('origem', value);

  int? get destino => getField<int>('destino');
  set destino(int? value) => setField<int>('destino', value);

  PostgresTime? get horaInicio => getField<PostgresTime>('hora_inicio');
  set horaInicio(PostgresTime? value) =>
      setField<PostgresTime>('hora_inicio', value);

  PostgresTime? get horaFim => getField<PostgresTime>('hora_fim');
  set horaFim(PostgresTime? value) => setField<PostgresTime>('hora_fim', value);

  int? get duracao => getField<int>('duracao');
  set duracao(int? value) => setField<int>('duracao', value);

  bool? get finalizado => getField<bool>('finalizado');
  set finalizado(bool? value) => setField<bool>('finalizado', value);

  bool? get inciado => getField<bool>('inciado');
  set inciado(bool? value) => setField<bool>('inciado', value);
}
