import 'package:flutter/material.dart';

import '../../core/extensions/extensions.dart';

class ActionChipsWrapper extends StatelessWidget {
  const ActionChipsWrapper({
    required this.child,
    super.key,
    this.borderRadius = const .all(.circular(6)),
    this.side,
    this.padding = const .symmetric(horizontal: 5),
    this.backgroundColor,
  });
  final Widget child;

  final BorderRadius borderRadius;
  final BorderSide? side;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return ChipTheme(
      data: ChipThemeData(
        backgroundColor:
            backgroundColor ??
            colors.surfaceContainerHigh.withValues(alpha: 0.5),
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        side: side ?? BorderSide(color: colors.outlineVariant),
      ),
      child: child,
    );
  }
}
