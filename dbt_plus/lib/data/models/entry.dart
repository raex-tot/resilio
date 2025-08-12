import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry.freezed.dart';
part 'entry.g.dart';

@freezed
class Entry with _$Entry {
  const factory Entry({
    required String id,
    required String userId,
    required DateTime date,
    @Default(0) int mood,
    @Default(0) int tension,
    @Default([]) List<String> urges,
    @Default([]) List<String> behaviors,
    String? notes,
    @Default([]) List<String> tags,
    @Default([]) List<String> skillsUsed,
    DateTime? createdAt,
  }) = _Entry;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
}
