import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/app_scaffold.dart';
import '../../core/l10n/generated/app_localizations.dart';

class CrisisPage extends StatelessWidget {
  const CrisisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AppScaffold(
      title: l10n.tabCrisis,
      body: Center(
        child: ElevatedButton(
          onPressed: () => launchUrl(Uri.parse('tel:000')),
          child: Text(l10n.emergencyContact),
        ),
      ),
    );
  }
}
