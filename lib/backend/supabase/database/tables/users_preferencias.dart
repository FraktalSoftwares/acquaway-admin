import '../database.dart';

class UsersPreferenciasTable extends SupabaseTable<UsersPreferenciasRow> {
  @override
  String get tableName => 'users_preferencias';

  @override
  UsersPreferenciasRow createRow(Map<String, dynamic> data) =>
      UsersPreferenciasRow(data);
}

class UsersPreferenciasRow extends SupabaseDataRow {
  UsersPreferenciasRow(super.data);

  @override
  SupabaseTable get table => UsersPreferenciasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get usersId => getField<String>('users_id');
  set usersId(String? value) => setField<String>('users_id', value);

  String? get velocidade => getField<String>('velocidade');
  set velocidade(String? value) => setField<String>('velocidade', value);

  String? get distancia => getField<String>('distancia');
  set distancia(String? value) => setField<String>('distancia', value);

  String? get profundidade => getField<String>('profundidade');
  set profundidade(String? value) => setField<String>('profundidade', value);

  bool? get tempo => getField<bool>('tempo');
  set tempo(bool? value) => setField<bool>('tempo', value);

  bool? get temperatura => getField<bool>('temperatura');
  set temperatura(bool? value) => setField<bool>('temperatura', value);

  bool? get vento => getField<bool>('vento');
  set vento(bool? value) => setField<bool>('vento', value);

  bool? get visibilidade => getField<bool>('visibilidade');
  set visibilidade(bool? value) => setField<bool>('visibilidade', value);

  bool? get precipitacao => getField<bool>('precipitacao');
  set precipitacao(bool? value) => setField<bool>('precipitacao', value);
}
