import 'package:flutter/material.dart';

import '../../data/portfolio_data.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../widgets/skill_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      color: colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            l10n.navSkills,
            style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: PortfolioData.skills
                .map((skill) => SkillChip(skill: skill))
                .toList(),
          ),
        ],
      ),
    );
  }
}
