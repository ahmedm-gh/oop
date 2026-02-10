import 'package:flutter/material.dart';
import 'package:tuts/core/extensions/extensions.dart';

class BookmarkIconButton extends StatelessWidget {
  const BookmarkIconButton({
    required this.onPressed,
    this.isActive = false,
    this.animated = false,
    super.key,
  });

  final VoidCallback? onPressed;
  final bool isActive;
  final bool animated;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    final child = IconButton(
      key: ValueKey(isActive),
      style: IconButton.styleFrom(
        side: .none,
        backgroundColor: colors.surfaceContainerLow,
      ),
      onPressed: onPressed,
      padding: const .all(5),
      iconSize: 18,
      constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
      icon: Icon(
        isActive ? Icons.bookmark_rounded : Icons.bookmark_outline_rounded,
        color: colors.onSurfaceVariant,
      ),
    );

    return animated
        ? AnimatedSwitcher(
            transitionBuilder: (child, animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            duration: const Duration(milliseconds: 250),
            child: child,
          )
        : child;
  }
}
