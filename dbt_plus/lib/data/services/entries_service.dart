import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/util/result.dart';
import '../models/entry.dart';
import 'firestore_service.dart';

final entriesServiceProvider = Provider<EntriesService>((ref) {
  final fs = ref.watch(firestoreServiceProvider);
  return EntriesService(fs);
});

class EntriesService {
  EntriesService(this._fs);
  final FirebaseFirestore _fs;

  CollectionReference<Map<String, dynamic>> get _col => _fs.collection('entries');

  Future<Result<void>> addEntry(Entry entry) async {
    try {
      await _col.doc(entry.id).set(entry.toJson());
      return const Success(null);
    } catch (e) {
      return Failure(e);
    }
  }

  Stream<List<Entry>> listEntries(String userId) {
    return _col.where('userId', isEqualTo: userId).orderBy('date', descending: true).snapshots().map(
        (snap) => snap.docs.map((d) => Entry.fromJson(d.data()).copyWith(id: d.id)).toList());
  }

  Future<Result<void>> updateEntry(Entry entry) async {
    try {
      await _col.doc(entry.id).update(entry.toJson());
      return const Success(null);
    } catch (e) {
      return Failure(e);
    }
  }

  Future<Result<void>> deleteEntry(String id) async {
    try {
      await _col.doc(id).delete();
      return const Success(null);
    } catch (e) {
      return Failure(e);
    }
  }
}
