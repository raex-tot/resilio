import 'package:freezed_annotation/freezed_annotation.dart';

part 'tension_sample.freezed.dart';
part 'tension_sample.g.dart';

enum TensionSource { quick, entry }

@freezed
class TensionSample with _$TensionSample {
  const factory TensionSample({
    required String id,
    required String userId,
    required DateTime ts,
    @Default(0) int tension,
    @Default(TensionSource.quick) TensionSource source,
    String? skillId,
  }) = _TensionSample;

  factory TensionSample.fromJson(Map<String, dynamic> json) => _$TensionSampleFromJson(json);
}
