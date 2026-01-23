import '../database.dart';

class AvisosTable extends SupabaseTable<AvisosRow> {
  @override
  String get tableName => 'avisos';

  @override
  AvisosRow createRow(Map<String, dynamic> data) => AvisosRow(data);
}

class AvisosRow extends SupabaseDataRow {
  AvisosRow(super.data);

  @override
  SupabaseTable get table => AvisosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get aviso => getField<String>('aviso');
  set aviso(String? value) => setField<String>('aviso', value);

  double? get duracao => getField<double>('duracao');
  set duracao(double? value) => setField<double>('duracao', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get tituloAviso => getField<String>('titulo_aviso');
  set tituloAviso(String? value) => setField<String>('titulo_aviso', value);

  String? get lat => getField<String>('lat');
  set lat(String? value) => setField<String>('lat', value);

  String? get lon => getField<String>('lon');
  set lon(String? value) => setField<String>('lon', value);

  double? get milhas => getField<double>('milhas');
  set milhas(double? value) => setField<double>('milhas', value);
}
