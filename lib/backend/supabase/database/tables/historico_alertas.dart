import '../database.dart';

class HistoricoAlertasTable extends SupabaseTable<HistoricoAlertasRow> {
  @override
  String get tableName => 'historico_alertas';

  @override
  HistoricoAlertasRow createRow(Map<String, dynamic> data) =>
      HistoricoAlertasRow(data);
}

class HistoricoAlertasRow extends SupabaseDataRow {
  HistoricoAlertasRow(super.data);

  @override
  SupabaseTable get table => HistoricoAlertasTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get projetoId => getField<String>('projeto_id');
  set projetoId(String? value) => setField<String>('projeto_id', value);

  String get tipoAlerta => getField<String>('tipo_alerta')!;
  set tipoAlerta(String value) => setField<String>('tipo_alerta', value);

  double? get percentualUtilizado => getField<double>('percentual_utilizado');
  set percentualUtilizado(double? value) =>
      setField<double>('percentual_utilizado', value);

  double? get horasUtilizadas => getField<double>('horas_utilizadas');
  set horasUtilizadas(double? value) =>
      setField<double>('horas_utilizadas', value);

  double? get horasVendidas => getField<double>('horas_vendidas');
  set horasVendidas(double? value) => setField<double>('horas_vendidas', value);

  String? get mensagem => getField<String>('mensagem');
  set mensagem(String? value) => setField<String>('mensagem', value);

  DateTime? get enviadoEm => getField<DateTime>('enviado_em');
  set enviadoEm(DateTime? value) => setField<DateTime>('enviado_em', value);

  String? get clickupCommentId => getField<String>('clickup_comment_id');
  set clickupCommentId(String? value) =>
      setField<String>('clickup_comment_id', value);
}
