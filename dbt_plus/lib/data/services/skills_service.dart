import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/skill.dart';
import '../../core/util/result.dart';
import 'firestore_service.dart';

final skillsServiceProvider = Provider<SkillsService>((ref) {
  final fs = ref.watch(firestoreServiceProvider);
  return SkillsService(fs);
});

class SkillsService {
  SkillsService(this._fs);
  final FirebaseFirestore _fs;

  CollectionReference<Map<String, dynamic>> get _skills => _fs.collection('skills');
  CollectionReference<Map<String, dynamic>> get _userSkills => _fs.collection('user_skills');

  Stream<List<Skill>> listSkills({SkillLevel? level, String? search}) {
    Query<Map<String, dynamic>> q = _skills;
    if (level != null) q = q.where('level', isEqualTo: level.name);
    if (search != null && search.isNotEmpty) q = q.where('title', isGreaterThanOrEqualTo: search);
    return q.snapshots().map((s) => s.docs.map((d) => Skill.fromJson(d.data()).copyWith(id: d.id)).toList());
  }

  Stream<List<String>> listUserSkills(String userId) {
    return _userSkills.where('userId', isEqualTo: userId).snapshots().map(
        (s) => s.docs.map((d) => d.data()['skillId'] as String).toList());
  }

  Future<Result<void>> toggleFavorite(String userId, String skillId, bool favorite) async {
    try {
      final doc = _userSkills.doc('${userId}_$skillId');
      await doc.set({'userId': userId, 'skillId': skillId, 'favorite': favorite});
      return const Success(null);
    } catch (e) {
      return Failure(e);
    }
  }
}
