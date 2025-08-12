import 'package:flutter/material.dart';

import '../../widgets/app_scaffold.dart';
import '../../features/common/line_chart.dart';
import '../../core/l10n/generated/app_localizations.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AppScaffold(
      title: l10n.tabProgress,
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: LineChartWidget(),
      ),
    );
  }
}
