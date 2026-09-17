import 'package:flutter/material.dart';

/// A skill [Chip] that scales up slightly on hover (desktop/web) using the
/// app's Material 3 [ChipThemeData] for colors, so it adapts automatically
/// to light/dark mode.
class SkillChip extends StatefulWidget {
  final String skill;
  const SkillChip({required this.skill, super.key});

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.08 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: Chip(label: Text(widget.skill)),
      ),
    );
  }
}
