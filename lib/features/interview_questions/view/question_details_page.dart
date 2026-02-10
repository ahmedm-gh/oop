import 'package:flutter/material.dart';
import 'package:tuts/core/extensions/extensions.dart';
import 'package:tuts/core/models/interview_question.dart';

import '../../../shared/app_widgets.dart';
import '../../../shared/widgets/difficulty_chip.dart';

// TODO: ADD .safeBidi()
class QuestionDetailsScreen extends StatelessWidget {
  const QuestionDetailsScreen({required this.question, super.key});
  final InterviewQuestion? question;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final question = this.question;
    if (question == null) {
      return Material(child: Center(child: Text(l10n.questionNotFound)));
    }

    final langCode = l10n.localeName;
    final content = question.getLocalizedContent(langCode);
    final colors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.interviewQuestions),
        actions: [
          Padding(
            padding: const .symmetric(horizontal: 10),
            child: DifficultyChip(question.difficulty),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const .all(16),
        child: Column(
          crossAxisAlignment: .stretch,
          spacing: 16,
          children: [
            // Question type and categories
            Text(
              [
                question.id,
                question.type.label(l10n),
                ...question.categories.map((c) => c.label(l10n)),
              ].join(" • "),
              // maxLines: 1,
              // overflow: .ellipsis,
              style: TextStyle(fontSize: 12, color: colors.onSurfaceVariant),
            ),
            // Question title
            Text(
              content.question.safeBidi(),
              style: const TextStyle(fontSize: 20, fontWeight: .bold),
            ),
            Container(
              width: .infinity,
              padding: const .symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: colors.surfaceContainerLow,
                borderRadius: .circular(12),
                border: .all(
                  color: colors.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
              child: Column(
                crossAxisAlignment: .stretch,
                spacing: 10,
                children: [
                  Text(
                    l10n.answer,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: .bold,
                      color: colors.primary,
                    ),
                  ),
                  ...content.answer.map(ContentViewer.new),
                ],
              ),
            ),

            // Code example
            if (question.examples case final examples?
                when examples.isNotEmpty) ...[
              Text(
                l10n.codeExample,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w600,
                  color: colors.onSurface,
                ),
              ),
              ...examples.map(CodeBlockViewer.fromStrCodeBlock),
            ],

            // Notes
            if (content.notes case final notes? when notes.isNotEmpty) ...[
              SmallTitledList.notes(
                title: Text(l10n.notes),
                content: notes.length == 1 ? Text(notes.first) : null,
                items: notes.length < 2 ? null : notes.map(Text.new).toList(),
              ),
            ],

            // Pros
            if (question.getLocalizedPros(langCode) case final pros?
                when pros.isNotEmpty) ...[
              SmallTitledList.advantages(items: pros.map(Text.new).toList()),
            ],

            // Cons
            if (question.getLocalizedCons(langCode) case final cons?
                when cons.isNotEmpty) ...[
              SmallTitledList.disadvantages(items: cons.map(Text.new).toList()),
            ],

            // Notes
            if (content.bestUse case final use? when use.isNotEmpty) ...[
              SmallTitledList.whenToUse(
                title: Text(l10n.whenToUse),
                content: Text(use),
              ),
            ],

            // Tags
            // if (question.tags case final tags? when tags.isNotEmpty)
            //   Text.rich(
            //     TextSpan(
            //       style: const TextStyle(fontSize: 12),
            //       children: [
            //         TextSpan(
            //           text: "${l10n.tags}: ",
            //           style: TextStyle(
            //             color: colors.secondary,
            //             fontWeight: .bold,
            //           ),
            //         ),
            //         TextSpan(text: tags.join(", ")),
            //       ],
            //     ),
            //   ),
            // if (question.tags case final tags? when tags.isNotEmpty) ...[
            //   Text(
            //     l10n.tags,
            //     style: TextStyle(
            //       fontSize: 12,
            //       fontWeight: .w600,
            //       color: colors.onSurface,
            //     ),
            //   ),
            //   Tags(tags),
            // ],
          ],
        ),
      ),
    );
  }
}
