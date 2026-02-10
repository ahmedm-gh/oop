import 'package:flutter/material.dart';
import 'package:tuts/core/enums/enums.dart';
import 'package:tuts/core/extensions/extensions.dart';

class DifficultyChip extends StatelessWidget {
  const DifficultyChip(this.difficulty, {super.key});

  final DifficultyLevel difficulty;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: difficulty.color.withAlpha(50),
        borderRadius: .circular(5),
      ),
      child: Padding(
        padding: const .symmetric(horizontal: 7.5, vertical: 5),
        child: Text(
          difficulty.label(l10n),
          style: TextStyle(
            fontSize: 12,
            color: difficulty.color,
            fontWeight: .bold,
            height: 1,
          ),
        ),
      ),
    );
  }
}
