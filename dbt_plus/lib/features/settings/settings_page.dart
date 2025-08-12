import 'package:flutter/material.dart';

import '../../widgets/app_scaffold.dart';
import '../../core/l10n/generated/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AppScaffold(
      title: l10n.settings,
      body: ListView(
        children: const [
          ListTile(title: Text('Language')),
          ListTile(title: Text('Accent Color')),
        ],
      ),
    );
  }
}
