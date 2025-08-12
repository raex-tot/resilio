import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'skill_filter_chip.dart';
import '../../widgets/app_scaffold.dart';
import '../../core/l10n/generated/app_localizations.dart';

class SkillsPage extends ConsumerWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return AppScaffold(
      title: l10n.tabSkills,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              title: Text(l10n.recommendedSkill),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: const [
              SkillFilterChip(label: 'All'),
              SkillFilterChip(label: 'Low'),
              SkillFilterChip(label: 'Medium'),
              SkillFilterChip(label: 'High'),
            ],
          ),
          const SizedBox(height: 16),
          const ListTile(title: Text('TIP')),
        ],
      ),
    );
  }
}
