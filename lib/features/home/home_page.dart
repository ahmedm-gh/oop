import "package:flutter/material.dart";
import "package:oop_tut/core/app_notifiers.dart";
import "package:oop_tut/core/extensions.dart";
import "package:oop_tut/features/design_patterns/design_patterns_page.dart";
import "package:oop_tut/features/refactoring/refactoring_page.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.translate_rounded),
            onPressed: AppNotifiers.toggleLocale,
            tooltip: l10n.language,
          ),
          ValueListenableBuilder(
            valueListenable: AppNotifiers.appNotifier,
            builder: (context, appValues, _) {
              return IconButton(
                icon: Icon(
                  appValues.brightness == .dark
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                ),
                onPressed: AppNotifiers.toggleTheme,
                tooltip: appValues.brightness == .dark
                    ? l10n.lightMode
                    : l10n.darkMode,
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const .all(24),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              _HomeMenuCard(
                title: l10n.designPatterns,
                icon: Icons.architecture_rounded,
                color: colors.primary,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DesignPatternsPage()),
                ),
              ),
              const SizedBox(height: 20),
              _HomeMenuCard(
                title: l10n.refactoring,
                icon: Icons.auto_fix_high_rounded,
                color: colors.tertiary,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RefactoringPage()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeMenuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _HomeMenuCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: .transparency,
      child: InkWell(
        onTap: onTap,
        borderRadius: .circular(20),
        child: Container(
          width: double.infinity,
          height: 160,
          padding: const .all(24),
          decoration: BoxDecoration(
            borderRadius: .circular(20),
            border: Border.all(color: color.withValues(alpha: 0.2), width: 2),
          ),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: .bold, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
