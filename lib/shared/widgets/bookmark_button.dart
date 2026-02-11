import 'package:flutter/material.dart';
import 'package:tuts/core/extensions/extensions.dart';

class BookmarkIconButton extends StatelessWidget {
  const BookmarkIconButton({
    required this.onPressed,
    this.isActive = false,
    this.animated = false,
    this.tooltip,
    this.compact = false,
    super.key,
  });

  const BookmarkIconButton.compact({
    required this.onPressed,
    this.isActive = false,
    this.animated = false,
    this.tooltip,
    super.key,
  }) : compact = true;

  final VoidCallback? onPressed;
  final bool isActive;
  final bool animated;
  final String? tooltip;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    final icon = Icon(
      key: ValueKey(isActive),
      isActive ? Icons.bookmark_rounded : Icons.bookmark_outline_rounded,
      color: isActive ? colors.primary : colors.onSurfaceVariant,
    );

    return IconButton(
      tooltip: tooltip,
      style: IconButton.styleFrom(
        side: .none,
        backgroundColor: colors.surfaceContainerLow,
      ),
      onPressed: onPressed,
      padding: compact ? const .all(5) : null,
      iconSize: compact ? 18 : null,
      constraints: compact
          ? const BoxConstraints(minWidth: 20, minHeight: 20)
          : null,
      icon: animated
          ? AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: icon,
            )
          : icon,
    );
  }
}
