import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill.freezed.dart';
part 'skill.g.dart';

enum SkillLevel { low, medium, high }

@freezed
class Skill with _$Skill {
  const factory Skill({
    required String id,
    required String title,
    required SkillLevel level,
    @Default([]) List<String> steps,
    Map<String, String>? localized,
    @Default(false) bool isCore,
  }) = _Skill;

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
}
