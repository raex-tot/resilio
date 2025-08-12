import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firestoreServiceProvider = Provider<FirebaseFirestore>((ref) {
  final fs = FirebaseFirestore.instance;
  fs.settings = const Settings(persistenceEnabled: true);
  return fs;
});
