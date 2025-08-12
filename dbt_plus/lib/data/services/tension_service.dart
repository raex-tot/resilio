import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/util/result.dart';
import '../models/tension_sample.dart';
import 'firestore_service.dart';

final tensionServiceProvider = Provider<TensionService>((ref) {
  final fs = ref.watch(firestoreServiceProvider);
  return TensionService(fs);
});

class TensionService {
  TensionService(this._fs);
  final FirebaseFirestore _fs;

  CollectionReference<Map<String, dynamic>> get _col => _fs.collection('tension_samples');

  Future<Result<void>> addSample(TensionSample sample) async {
    try {
      await _col.doc(sample.id).set(sample.toJson());
      return const Success(null);
    } catch (e) {
      return Failure(e);
    }
  }

  Stream<List<TensionSample>> listSamples(String userId) {
    return _col.where('userId', isEqualTo: userId).orderBy('ts', descending: true).snapshots().map(
        (s) => s.docs.map((d) => TensionSample.fromJson(d.data()).copyWith(id: d.id)).toList());
  }
}

  Future<Result<Map<DateTime, double>>> statsByDay(String userId) async {
    try {
      final snap = await _col.where('userId', isEqualTo: userId).get();
      final map = <DateTime, List<int>>{};
      for (final d in snap.docs) {
        final sample = TensionSample.fromJson(d.data());
        final day = DateTime(sample.ts.year, sample.ts.month, sample.ts.day);
        map.putIfAbsent(day, () => []).add(sample.tension);
      }
      final result = map.map((k, v) => MapEntry(k, v.isEmpty ? 0 : v.reduce((a,b)=>a+b)/v.length));
      return Success(result);
    } catch (e) {
      return Failure(e);
    }
  }
}
