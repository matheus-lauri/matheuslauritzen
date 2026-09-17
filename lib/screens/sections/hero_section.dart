import 'package:flutter/material.dart';

import '../../data/portfolio_data.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../widgets/hero_avatar.dart';

class HeroSection extends StatelessWidget {
  final bool isCompact;
  const HeroSection({required this.isCompact, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      color: colorScheme.surface,
      height: isCompact ? null : MediaQuery.of(context).size.height * 0.85,
      padding: EdgeInsets.symmetric(
        horizontal: isCompact ? 24 : 64,
        vertical: isCompact ? 64 : 0,
      ),
      alignment: Alignment.center,
      child: Flex(
        direction: isCompact ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: isCompact
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: isCompact ? 0 : 3,
            child: Column(
              crossAxisAlignment: isCompact
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l10n.heroGreeting(PortfolioData.name),
                  style:
                      (isCompact
                              ? textTheme.headlineMedium
                              : textTheme.displayMedium)
                          ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: isCompact ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.heroTagline,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: isCompact ? TextAlign.center : TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(width: isCompact ? 0 : 50, height: isCompact ? 40 : 0),
          Expanded(
            flex: isCompact ? 0 : 2,
            child: HeroAvatar(size: isCompact ? 200 : 380),
          ),
        ],
      ),
    );
  }
}
