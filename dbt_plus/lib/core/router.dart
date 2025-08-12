import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/skills/skills_page.dart';
import '../features/journal/journal_page.dart';
import '../features/crisis/crisis_page.dart';
import '../features/progress/progress_page.dart';
import '../features/settings/settings_page.dart';
import '../features/skills/skill_detail_page.dart';
import '../features/journal/entry_editor_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/skills',
    routes: [
      GoRoute(path: '/skills', builder: (_, __) => const SkillsPage(), routes: [
        GoRoute(path: 'skill/:id', builder: (_, s) => SkillDetailPage(id: s.params['id']!)),
      ]),
      GoRoute(path: '/journal', builder: (_, __) => const JournalPage(), routes: [
        GoRoute(path: 'entry/:id', builder: (_, s) => EntryEditorPage(id: s.params['id'])),
      ]),
      GoRoute(path: '/crisis', builder: (_, __) => const CrisisPage()),
      GoRoute(path: '/progress', builder: (_, __) => const ProgressPage()),
      GoRoute(path: '/settings', builder: (_, __) => const SettingsPage()),
    ],
  );
});
