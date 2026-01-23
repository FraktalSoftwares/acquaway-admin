import '../database.dart';

class NotificacoesTable extends SupabaseTable<NotificacoesRow> {
  @override
  String get tableName => 'notificacoes';

  @override
  NotificacoesRow createRow(Map<String, dynamic> data) => NotificacoesRow(data);
}

class NotificacoesRow extends SupabaseDataRow {
  NotificacoesRow(super.data);

  @override
  SupabaseTable get table => NotificacoesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userReciver => getField<String>('user_reciver');
  set userReciver(String? value) => setField<String>('user_reciver', value);

  String? get titulo => getField<String>('titulo');
  set titulo(String? value) => setField<String>('titulo', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  bool? get lido => getField<bool>('lido');
  set lido(bool? value) => setField<bool>('lido', value);

  int? get companiesId => getField<int>('companies_id');
  set companiesId(int? value) => setField<int>('companies_id', value);
}
