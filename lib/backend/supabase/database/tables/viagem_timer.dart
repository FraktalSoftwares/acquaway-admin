import '../database.dart';

class ViagemTimerTable extends SupabaseTable<ViagemTimerRow> {
  @override
  String get tableName => 'viagem_timer';

  @override
  ViagemTimerRow createRow(Map<String, dynamic> data) => ViagemTimerRow(data);
}

class ViagemTimerRow extends SupabaseDataRow {
  ViagemTimerRow(super.data);

  @override
  SupabaseTable get table => ViagemTimerTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get viagensId => getField<int>('viagens_id');
  set viagensId(int? value) => setField<int>('viagens_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int get baseElapsedMs => getField<int>('base_elapsed_ms')!;
  set baseElapsedMs(int value) => setField<int>('base_elapsed_ms', value);

  DateTime? get startedAt => getField<DateTime>('started_at');
  set startedAt(DateTime? value) => setField<DateTime>('started_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
