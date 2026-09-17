import 'package:flutter/material.dart';

import '../../data/portfolio_data.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/project.dart';
import '../../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final projects = [
      Project(
        title: l10n.projectSpringBootTitle,
        description: l10n.projectSpringBootDescription,
        url: PortfolioData.springBootProjectUrl,
      ),
      Project(
        title: l10n.projectScroogeTitle,
        description: l10n.projectScroogeDescription,
        url: PortfolioData.scroogeProjectUrl,
      ),
      Project(
        title: l10n.projectImageProcessingTitle,
        description: l10n.projectImageProcessingDescription,
        url: PortfolioData.imageProcessingProjectUrl,
      ),
    ];

    return Container(
      width: double.infinity,
      color: colorScheme.surfaceContainerLow,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            l10n.navProjects,
            style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: projects
                .map((project) => ProjectCard(project: project))
                .toList(),
          ),
        ],
      ),
    );
  }
}
