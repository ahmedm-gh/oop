import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../shared/design_layouts.dart';

class QuestionCardsWrapper extends StatelessWidget {
  const QuestionCardsWrapper({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return CardTheme(
      elevation: 0,
      color: colors.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: DL.inListCardBorderRadius,
        side: BorderSide(color: colors.outlineVariant.withValues(alpha: 0.35)),
      ),
      clipBehavior: .hardEdge,
      child: child,
    );
  }
}
