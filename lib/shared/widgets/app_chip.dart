import 'package:flutter/material.dart';
import 'package:tuts/core/enums/difficulty_level.dart';
import 'package:tuts/core/extensions/extensions.dart';

class DifficultyChip extends StatelessWidget {
  const DifficultyChip({
    required this.difficultyLevel,
    this.child,
    this.padding = const .symmetric(horizontal: 2.5),
    super.key,
  });

  final Widget? child;
  final DifficultyLevel? difficultyLevel;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final color = difficultyLevel?.color;

    return Chip(
      padding: padding,
      color: WidgetStatePropertyAll(color?.withValues(alpha: 0.1)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: color != null
            ? BorderSide(color: color.withValues(alpha: 0.25))
            : .none,
        // side: color != null
        //     ? BorderSide(color: color.withValues(alpha: 0.25))
        //     : .none,
      ),
      label:
          child ??
          Text(
            difficultyLevel?.label(context.l10n) ?? "",
            style: TextStyle(color: color, fontSize: 12, fontWeight: .bold),
          ),
    );
  }
}

class AppChip extends StatelessWidget {
  const AppChip({
    required this.child,
    this.padding = const .symmetric(horizontal: 7.5, vertical: 2.5),
    super.key,
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Chip(padding: padding, label: child);
  }
}

//
//

class Tags extends StatelessWidget {
  const Tags(this.tags, {super.key});

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) return const SizedBox.shrink();

    final colors = context.colorScheme;

    return ChipTheme(
      data: ChipThemeData(
        padding: .zero,
        labelPadding: const .symmetric(horizontal: 10),
        backgroundColor: colors.surfaceContainerHighest,
      ),
      child: Wrap(spacing: 5, runSpacing: 5, children: tags.map(tag).toList()),
    );
  }

  TagChip tag(String tag) {
    return TagChip(child: Text(tag));
  }
}

class TagChip extends StatelessWidget {
  const TagChip({
    required this.child,
    this.padding = const .symmetric(horizontal: 2.5),
    super.key,
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: padding,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      label: child,
    );
  }
}
