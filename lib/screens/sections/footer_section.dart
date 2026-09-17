import 'package:flutter/material.dart';

import '../../data/portfolio_data.dart';
import '../../l10n/generated/app_localizations.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      color: colorScheme.surfaceContainerLow,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Text(
          l10n.footerRights(DateTime.now().year, PortfolioData.name),
          style: TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
