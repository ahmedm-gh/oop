import 'package:flutter/material.dart';
import 'package:loopsbase/core/extensions/extensions.dart';
import 'package:loopsbase/core/models/content.dart';

import 'code_block.dart';

class ContentViewer extends StatelessWidget {
  const ContentViewer(this.content, {super.key});

  final Content content;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final textTheme = context.textTheme;

    return switch (content) {
      final StrContent value => Text(value.value),

      final ListContent value => Column(
        crossAxisAlignment: .stretch,
        spacing: 7.5,
        children: [
          if (value.title case final title?)
            Text(
              title,
              style: TextStyle(
                fontWeight: .bold,
                fontSize: 16,
                color: colors.secondary,
              ),
            ),
          ...buildItems(value, colors),
        ],
      ),

      final CodeContent value => CodeBlockViewer.fromStrCodeBlock(value.code),

      final NoteContent value => _buildNote(value, colors, textTheme),

      final AnalogyContent value => _buildAnalogy(value, colors, textTheme),

      final ComparisonContent value => _buildComparison(
        value,
        colors,
        textTheme,
      ),

      final DiagramContent value => _buildDiagram(value, colors, textTheme),
    };
  }

  Widget _buildNote(
    NoteContent content,
    ColorScheme colors,
    TextTheme textTheme,
  ) {
    final noteConfig = _getNoteConfig(content.type, colors);

    return Container(
      decoration: BoxDecoration(
        color: noteConfig.backgroundColor,
        borderRadius: .circular(8),
        border: Border.all(color: noteConfig.borderColor, width: 1.5),
      ),
      padding: const .all(12),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Icon(noteConfig.icon, color: noteConfig.iconColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  noteConfig.label,
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: .bold,
                    color: noteConfig.iconColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content.value,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalogy(
    AnalogyContent content,
    ColorScheme colors,
    TextTheme textTheme,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colors.primaryContainer.withValues(alpha: 0.3),
            colors.secondaryContainer.withValues(alpha: 0.3),
          ],
          begin: .topLeft,
          end: .bottomRight,
        ),
        borderRadius: .circular(12),
        border: Border.all(color: colors.primary.withValues(alpha: 0.3)),
      ),
      padding: const .all(16),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Container(
            padding: const .all(8),
            decoration: BoxDecoration(
              color: colors.primaryContainer,
              shape: .circle,
            ),
            child: Icon(
              Icons.lightbulb_outline,
              color: colors.primary,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Analogy',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: .bold,
                    color: colors.primary,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  content.value,
                  style: textTheme.bodyMedium?.copyWith(
                    fontStyle: .italic,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComparison(
    ComparisonContent content,
    ColorScheme colors,
    TextTheme textTheme,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        borderRadius: .circular(8),
        border: Border.all(color: colors.outlineVariant, width: 1),
      ),
      padding: const .symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          if (content.title case final title?) ...[
            Padding(
              padding: const .symmetric(horizontal: 16, vertical: 8),
              child: Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: .bold,
                  color: colors.primary,
                ),
              ),
            ),
            Divider(height: 1, color: colors.outlineVariant),
          ],
          ...content.value.entries.map(
            (entry) =>
                _buildComparisonRow(entry.key, entry.value, colors, textTheme),
          ),
        ],
      ),
    );
  }

  Widget _buildComparisonRow(
    String key,
    String value,
    ColorScheme colors,
    TextTheme textTheme,
  ) {
    return Container(
      padding: const .symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors.outlineVariant.withValues(alpha: 0.5),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              key,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: .w600,
                color: colors.secondary,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(flex: 3, child: Text(value, style: textTheme.bodyMedium)),
        ],
      ),
    );
  }

  Widget _buildDiagram(
    DiagramContent content,
    ColorScheme colors,
    TextTheme textTheme,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: colors.surfaceContainerHigh,
        borderRadius: .circular(8),
        border: Border.all(color: colors.outline.withValues(alpha: 0.5)),
      ),
      padding: const .all(16),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_tree_outlined,
                size: 18,
                color: colors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Structure Diagram',
                style: textTheme.labelLarge?.copyWith(
                  color: colors.primary,
                  fontWeight: .w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const .all(12),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: .circular(6),
            ),
            child: Text(
              content.value,
              style: textTheme.bodyMedium?.copyWith(
                fontFamily: 'monospace',
                height: 1.6,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildItems(ListContent content, ColorScheme colors) {
    return [
      for (var i = 0; i < content.value.length; i++)
        Row(
          crossAxisAlignment: .start,
          children: [
            if (content is OLContent)
              Container(
                decoration: BoxDecoration(
                  color: colors.surfaceContainerHighest,
                  borderRadius: .circular(5),
                ),
                margin: const .directional(start: 10),
                padding: const .symmetric(horizontal: 5, vertical: 2.5),
                alignment: .center,
                constraints: const BoxConstraints(minWidth: 25),
                child: Text(
                  "${i + 1}",
                  style: const TextStyle(fontSize: 12, fontWeight: .w600),
                ),
              )
            else
              Padding(
                padding: const .directional(start: 10),
                child: Text(
                  "•",
                  style: TextStyle(
                    color: colors.primary,
                    fontSize: 18,
                    fontWeight: .bold,
                  ),
                ),
              ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                content.value[i],
                style: const TextStyle(height: 1.5),
              ),
            ),
          ],
        ),
    ];
  }

  _NoteConfig _getNoteConfig(NoteType type, ColorScheme colors) {
    return switch (type) {
      .info => _NoteConfig(
        icon: Icons.info_outline,
        label: 'Info',
        iconColor: colors.primary,
        backgroundColor: colors.primaryContainer.withValues(alpha: 0.3),
        borderColor: colors.primary.withValues(alpha: 0.5),
      ),
      .warning => _NoteConfig(
        icon: Icons.warning_amber_outlined,
        label: 'Warning',
        iconColor: Colors.orange,
        backgroundColor: Colors.orange.withValues(alpha: 0.1),
        borderColor: Colors.orange.withValues(alpha: 0.5),
      ),
      .tip => _NoteConfig(
        icon: Icons.tips_and_updates_outlined,
        label: 'Tip',
        iconColor: Colors.green,
        backgroundColor: Colors.green.withValues(alpha: 0.1),
        borderColor: Colors.green.withValues(alpha: 0.5),
      ),
      .important => _NoteConfig(
        icon: Icons.priority_high,
        label: 'Important',
        iconColor: Colors.red,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        borderColor: Colors.red.withValues(alpha: 0.5),
      ),
    };
  }
}

class _NoteConfig {
  const _NoteConfig({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.backgroundColor,
    required this.borderColor,
  });

  final IconData icon;
  final String label;
  final Color iconColor;
  final Color backgroundColor;
  final Color borderColor;
}
