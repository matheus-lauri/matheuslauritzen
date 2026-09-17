import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/generated/app_localizations.dart';
import '../models/project.dart';

/// A Material 3 [Card] presenting a [Project], with a hover lift on
/// desktop/web and a ripple + external launch on tap.
class ProjectCard extends StatefulWidget {
  final Project project;
  const ProjectCard({required this.project, super.key});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovering = false;

  Future<void> _openProject() async {
    final uri = Uri.parse(widget.project.url);
    if (!await launchUrl(uri)) {
      throw 'Não foi possível abrir ${widget.project.url}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: SizedBox(
          width: 320,
          child: Card(
            elevation: _hovering ? 4 : 0,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: _openProject,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.project.title,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(widget.project.description, style: textTheme.bodyMedium),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FilledButton.tonalIcon(
                        onPressed: _openProject,
                        icon: const Icon(Icons.open_in_new, size: 18),
                        label: Text(l10n.projectsAccessButton),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
