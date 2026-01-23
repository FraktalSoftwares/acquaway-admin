import '../database.dart';

class EmbarcacoesTable extends SupabaseTable<EmbarcacoesRow> {
  @override
  String get tableName => 'embarcacoes';

  @override
  EmbarcacoesRow createRow(Map<String, dynamic> data) => EmbarcacoesRow(data);
}

class EmbarcacoesRow extends SupabaseDataRow {
  EmbarcacoesRow(super.data);

  @override
  SupabaseTable get table => EmbarcacoesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get companie => getField<int>('companie');
  set companie(int? value) => setField<int>('companie', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get nomeEmbarcacoes => getField<String>('nome_embarcacoes');
  set nomeEmbarcacoes(String? value) =>
      setField<String>('nome_embarcacoes', value);

  String? get tieTiem => getField<String>('tie_tiem');
  set tieTiem(String? value) => setField<String>('tie_tiem', value);

  String? get tiePrpm => getField<String>('tie_prpm');
  set tiePrpm(String? value) => setField<String>('tie_prpm', value);

  double? get comprimento => getField<double>('comprimento');
  set comprimento(double? value) => setField<double>('comprimento', value);

  double? get boca => getField<double>('boca');
  set boca(double? value) => setField<double>('boca', value);

  double? get calado => getField<double>('calado');
  set calado(double? value) => setField<double>('calado', value);

  bool? get ativo => getField<bool>('ativo');
  set ativo(bool? value) => setField<bool>('ativo', value);

  int? get largura => getField<int>('largura');
  set largura(int? value) => setField<int>('largura', value);

  String? get classificacaoUso => getField<String>('classificacao_uso');
  set classificacaoUso(String? value) =>
      setField<String>('classificacao_uso', value);
}
