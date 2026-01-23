import '../database.dart';

class CompaniesTable extends SupabaseTable<CompaniesRow> {
  @override
  String get tableName => 'companies';

  @override
  CompaniesRow createRow(Map<String, dynamic> data) => CompaniesRow(data);
}

class CompaniesRow extends SupabaseDataRow {
  CompaniesRow(super.data);

  @override
  SupabaseTable get table => CompaniesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get cnpj => getField<String>('cnpj');
  set cnpj(String? value) => setField<String>('cnpj', value);

  String? get areaAtuacao => getField<String>('area_atuacao');
  set areaAtuacao(String? value) => setField<String>('area_atuacao', value);

  String? get atividadeEmpresa => getField<String>('atividade_empresa');
  set atividadeEmpresa(String? value) =>
      setField<String>('atividade_empresa', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  bool? get aprovadas => getField<bool>('aprovadas');
  set aprovadas(bool? value) => setField<bool>('aprovadas', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get cep => getField<String>('cep');
  set cep(String? value) => setField<String>('cep', value);

  String? get endereco => getField<String>('endereco');
  set endereco(String? value) => setField<String>('endereco', value);

  String? get numero => getField<String>('numero');
  set numero(String? value) => setField<String>('numero', value);

  String? get bairro => getField<String>('bairro');
  set bairro(String? value) => setField<String>('bairro', value);

  String? get cidade => getField<String>('cidade');
  set cidade(String? value) => setField<String>('cidade', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);

  bool? get ativo => getField<bool>('ativo');
  set ativo(bool? value) => setField<bool>('ativo', value);
}
