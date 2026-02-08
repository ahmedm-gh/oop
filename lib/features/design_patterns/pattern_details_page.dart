import "package:flutter/material.dart";
import "package:tuts/core/extensions.dart";
import "package:tuts/core/repositories/design_patterns_repository.dart";
import "package:tuts/shared/app_widgets.dart";

class PatternDetailsPage extends StatelessWidget {
  const PatternDetailsPage({
    required this.patternKey,
    required this.patternName,
    super.key,
  });
  final String patternKey;
  final String patternName;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final pattern = DesignPatternsRepository.getPattern(context, patternKey);

    return Scaffold(
      appBar: AppBar(title: Text(patternName)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .stretch,
          spacing: 15,
          children: [
            Text(
              l10n.details,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              pattern.description,
              textDirection: BidiUtil.getDirection(pattern.description),
            ),

            // Bad Example
            if (pattern.content.badExample != null) ...[
              Text(
                l10n.badExample,
                style: textTheme.titleMedium?.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (pattern.content.badExample case final code?)
                CodeBlockViewer.fromStrCodeBlock(code),
            ],

            // Good Example
            if (pattern.content.goodExample != null) ...[
              Text(
                l10n.goodExample,
                style: textTheme.titleMedium?.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (pattern.content.goodExample case final code?)
                CodeBlockViewer.fromStrCodeBlock(code),
            ],

            if (pattern.content.note case final note?)
              SmallTitledList.notes(content: Text(note)),

            if (pattern.content.whenToUse.isNotEmpty)
              SmallTitledList.whenToUse(
                items: pattern.content.whenToUse.map(Text.new).toList(),
              ),

            if (pattern.content.pros.isNotEmpty)
              SmallTitledList.advantages(
                items: pattern.content.pros.map(Text.new).toList(),
              ),

            if (pattern.content.cons.isNotEmpty)
              SmallTitledList.disadvantages(
                items: pattern.content.cons.map(Text.new).toList(),
              ),

            if (pattern.content.bestUse.isNotEmpty)
              SmallTitledList.bestFor(
                items: pattern.content.bestUse.map(Text.new).toList(),
              ),
            if (pattern.content.references.isNotEmpty)
              ReferenceWidget(urls: pattern.content.references),
          ],
        ),
      ),
    );
  }
}
