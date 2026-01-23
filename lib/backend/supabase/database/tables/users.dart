import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(super.data);

  @override
  SupabaseTable get table => UsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  bool? get termos => getField<bool>('termos');
  set termos(bool? value) => setField<bool>('termos', value);

  String? get tipoUser => getField<String>('tipo_user');
  set tipoUser(String? value) => setField<String>('tipo_user', value);

  int? get companiesId => getField<int>('companies_id');
  set companiesId(int? value) => setField<int>('companies_id', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  bool? get verificado => getField<bool>('verificado');
  set verificado(bool? value) => setField<bool>('verificado', value);

  String? get fcmToken => getField<String>('fcm_token');
  set fcmToken(String? value) => setField<String>('fcm_token', value);

  bool? get onboard => getField<bool>('onboard');
  set onboard(bool? value) => setField<bool>('onboard', value);

  String? get stripeCustomerId => getField<String>('stripe_customer_id');
  set stripeCustomerId(String? value) =>
      setField<String>('stripe_customer_id', value);

  bool? get ativo => getField<bool>('ativo');
  set ativo(bool? value) => setField<bool>('ativo', value);
}
