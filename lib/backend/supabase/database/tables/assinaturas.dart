import '../database.dart';

class AssinaturasTable extends SupabaseTable<AssinaturasRow> {
  @override
  String get tableName => 'assinaturas';

  @override
  AssinaturasRow createRow(Map<String, dynamic> data) => AssinaturasRow(data);
}

class AssinaturasRow extends SupabaseDataRow {
  AssinaturasRow(super.data);

  @override
  SupabaseTable get table => AssinaturasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get companiesId => getField<int>('companies_id');
  set companiesId(int? value) => setField<int>('companies_id', value);

  String get stripeSubscriptionId =>
      getField<String>('stripe_subscription_id')!;
  set stripeSubscriptionId(String value) =>
      setField<String>('stripe_subscription_id', value);

  String? get stripePriceId => getField<String>('stripe_price_id');
  set stripePriceId(String? value) =>
      setField<String>('stripe_price_id', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  DateTime? get currentPeriodStart =>
      getField<DateTime>('current_period_start');
  set currentPeriodStart(DateTime? value) =>
      setField<DateTime>('current_period_start', value);

  DateTime? get currentPeriodEnd => getField<DateTime>('current_period_end');
  set currentPeriodEnd(DateTime? value) =>
      setField<DateTime>('current_period_end', value);

  bool? get cancelAtPeriodEnd => getField<bool>('cancel_at_period_end');
  set cancelAtPeriodEnd(bool? value) =>
      setField<bool>('cancel_at_period_end', value);

  String? get planoNome => getField<String>('plano_nome');
  set planoNome(String? value) => setField<String>('plano_nome', value);
}
