import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../l10n/generated/app_localizations.dart';
import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/footer_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';

typedef _NavIcons = ({IconData icon, IconData selectedIcon});

const List<_NavIcons> _navIcons = [
  (icon: Icons.home_outlined, selectedIcon: Icons.home),
  (icon: Icons.person_outline, selectedIcon: Icons.person),
  (icon: Icons.code_outlined, selectedIcon: Icons.code),
  (icon: Icons.work_outline, selectedIcon: Icons.work),
  (icon: Icons.mail_outline, selectedIcon: Icons.mail),
];

const double _wideBreakpoint = 800;
const double _extendedRailBreakpoint = 1100;

/// Home page with an adaptive Material 3 navigation: a [NavigationRail] on
/// wide viewports (web/desktop) and a bottom [NavigationBar] on narrow ones
/// (mobile), both driving and driven by the current scroll position.
class HomePage extends StatefulWidget {
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;
  final Locale locale;
  final ValueChanged<Locale> onLocaleChanged;

  const HomePage({
    required this.themeMode,
    required this.onToggleTheme,
    required this.locale,
    required this.onLocaleChanged,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(5, (_) => GlobalKey());
  int _selectedIndex = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _goToSection(int index) {
    final sectionContext = _sectionKeys[index].currentContext;
    if (sectionContext != null) {
      Scrollable.ensureVisible(
        sectionContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onSectionVisibility(int index, VisibilityInfo info) {
    if (info.visibleFraction > 0.5 && _selectedIndex != index) {
      setState(() => _selectedIndex = index);
    }
  }

  Widget _buildSection(int index, Widget child) {
    return VisibilityDetector(
      key: Key('section-$index'),
      onVisibilityChanged: (info) => _onSectionVisibility(index, info),
      child: Container(key: _sectionKeys[index], child: child),
    );
  }

  Widget _buildScrollBody(bool isCompact) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          _buildSection(0, HeroSection(isCompact: isCompact)),
          _buildSection(1, const AboutSection()),
          _buildSection(2, const SkillsSection()),
          _buildSection(3, const ProjectsSection()),
          _buildSection(4, const ContactSection()),
          const FooterSection(),
        ],
      ),
    );
  }

  Widget _buildLanguageToggle(AppLocalizations l10n) {
    return SegmentedButton<Locale>(
      segments: [
        ButtonSegment(
          value: const Locale('pt'),
          label: const Text('PT'),
          tooltip: l10n.languageTogglePt,
        ),
        ButtonSegment(
          value: const Locale('en'),
          label: const Text('EN'),
          tooltip: l10n.languageToggleEn,
        ),
      ],
      selected: {widget.locale},
      showSelectedIcon: false,
      onSelectionChanged: (selection) => widget.onLocaleChanged(selection.first),
    );
  }

  PreferredSizeWidget _buildAppBar(AppLocalizations l10n) {
    final isDark = widget.themeMode == ThemeMode.dark;
    return AppBar(
      title: const Text(
        'Matheus Baron Lauritzen',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        _buildLanguageToggle(l10n),
        const SizedBox(width: 12),
        IconButton(
          onPressed: widget.onToggleTheme,
          tooltip: isDark ? l10n.themeToggleToLight : l10n.themeToggleToDark,
          icon: Icon(
            isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final navLabels = [
      l10n.navHome,
      l10n.navAbout,
      l10n.navSkills,
      l10n.navProjects,
      l10n.navContact,
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= _wideBreakpoint;
        final isExtended = constraints.maxWidth >= _extendedRailBreakpoint;

        if (!isWide) {
          return Scaffold(
            appBar: _buildAppBar(l10n),
            body: _buildScrollBody(true),
            bottomNavigationBar: NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _goToSection,
              destinations: List.generate(
                _navIcons.length,
                (i) => NavigationDestination(
                  icon: Icon(_navIcons[i].icon),
                  selectedIcon: Icon(_navIcons[i].selectedIcon),
                  label: navLabels[i],
                ),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: _buildAppBar(l10n),
          body: Row(
            children: [
              NavigationRail(
                selectedIndex: _selectedIndex,
                onDestinationSelected: _goToSection,
                extended: isExtended,
                labelType: isExtended ? null : NavigationRailLabelType.all,
                destinations: List.generate(
                  _navIcons.length,
                  (i) => NavigationRailDestination(
                    icon: Icon(_navIcons[i].icon),
                    selectedIcon: Icon(_navIcons[i].selectedIcon),
                    label: Text(navLabels[i]),
                  ),
                ),
              ),
              const VerticalDivider(width: 1),
              Expanded(child: _buildScrollBody(false)),
            ],
          ),
        );
      },
    );
  }
}
