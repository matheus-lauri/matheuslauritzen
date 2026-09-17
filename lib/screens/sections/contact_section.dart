import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/portfolio_data.dart';
import '../../l10n/generated/app_localizations.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Não foi possível abrir $url';
    }
  }

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
            l10n.navContact,
            style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Text(
              l10n.contactSubtitle,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filledTonal(
                icon: const FaIcon(FontAwesomeIcons.linkedin, size: 24),
                onPressed: () => _launchURL(PortfolioData.linkedinUrl),
                tooltip: l10n.tooltipLinkedin,
              ),
              const SizedBox(width: 16),
              IconButton.filledTonal(
                icon: const FaIcon(FontAwesomeIcons.github, size: 24),
                onPressed: () => _launchURL(PortfolioData.githubUrl),
                tooltip: l10n.tooltipGithub,
              ),
              const SizedBox(width: 16),
              IconButton.filledTonal(
                icon: const FaIcon(FontAwesomeIcons.envelope, size: 24),
                onPressed: () => _launchURL(PortfolioData.emailUrl),
                tooltip: l10n.tooltipEmail,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
