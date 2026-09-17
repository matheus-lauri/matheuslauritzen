import 'package:flutter/material.dart';

/// The profile photo shown in the hero section: fades/scales in on first
/// build and grows slightly on hover when a mouse is available.
class HeroAvatar extends StatefulWidget {
  final double size;
  const HeroAvatar({required this.size, super.key});

  @override
  State<HeroAvatar> createState() => _HeroAvatarState();
}

class _HeroAvatarState extends State<HeroAvatar> {
  double _scale = 0.8;
  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) setState(() => _scale = 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveScale = _hovering ? 1.08 : _scale;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: effectiveScale,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image: const DecorationImage(
              image: AssetImage('assets/foto_perfil.png'),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withValues(alpha: 0.25),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
