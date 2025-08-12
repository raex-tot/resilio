import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/app_scaffold.dart';
import '../../core/l10n/generated/app_localizations.dart';

class JournalPage extends ConsumerWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return AppScaffold(
      title: l10n.tabJournal,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/journal/entry/new'),
        child: const Icon(Icons.add),
      ),
      body: const Center(child: Text('No entries yet')),
    );
  }
}
