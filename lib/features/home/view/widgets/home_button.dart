import 'package:flutter/material.dart';

import '../../../../core/extensions/extensions.dart';
import '../../../../shared/widgets/icons.dart';

class HomeMenuCard extends StatelessWidget {
  const HomeMenuCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
    super.key,
  });
  final String title;
  final Widget icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    final card = Card(
      margin: .zero,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colors.outlineVariant.withValues(alpha: 0.5)),
        borderRadius: .circular(20),
      ),
      elevation: 0,
      clipBehavior: .hardEdge,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              color.withValues(alpha: 0.05),
              color.withValues(alpha: 0.0125),
              color.withValues(alpha: 0.05),
            ],
          ),
        ),
        child: Stack(
          alignment: .center,
          children: [
            // Background
            Positioned(
              child: Text(
                title,
                textAlign: .center,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: .bold,
                  color: color.withAlpha(5),
                ),
              ),
            ),
            // Background icon
            // PositionedDirectional(
            //   bottom: -10,
            //   end: -10,
            //   child: Icon(
            //     icon,
            //     size: 140,
            //     color: color.withValues(alpha: 0.06),
            //   ),
            // ),
            InkWell(
              onTap: onTap,
              borderRadius: .circular(20),
              child: Padding(
                padding: const .all(17.5),
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .stretch,
                  children: [
                    IconTheme.merge(
                      data: IconThemeData(size: 48, color: color),
                      child: icon,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      textAlign: .center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: .bold,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    if (onTap == null) {
      return Stack(
        alignment: .center,
        children: [
          SizedBox(
            width: .infinity,
            child: Opacity(opacity: 0.5, child: card),
          ),
          Positioned(
            right: 16,
            top: 16,
            child: FilledIcon(
              icon: const Icon(Icons.construction_rounded, size: 24),
              padding: const .all(8),
              background: colors.surfaceContainerHighest.withValues(
                alpha: 0.75,
              ),
              borderRadius: .circular(10),
            ),
          ),
        ],
      );
    }

    return card;
  }
}
