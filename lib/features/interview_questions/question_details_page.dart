import 'package:flutter/material.dart';
import 'package:tuts/core/extensions/extensions.dart';
import 'package:tuts/core/models/interview_question.dart';

import '../../shared/app_widgets.dart';

// TODO: ADD .safeBidi()
class QuestionDetailsPage extends StatelessWidget {
  const QuestionDetailsPage({required this.question, super.key});
  final InterviewQuestion question;

  @override
  Widget build(BuildContext context) {
    final langCode = context.l10n.localeName;
    final content = question.getLocalizedContent(langCode);
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.interviewQuestions),
        actions: [
          Padding(
            padding: const .symmetric(horizontal: 10),
            child: DifficultyChip(difficultyLevel: question.difficulty),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const .all(16),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 16,
          children: [
            // Question title
            Text.rich(
              TextSpan(
                text: content.question.safeBidi(),
                style: const TextStyle(fontSize: 20, fontWeight: .bold),
                children: [
                  TextSpan(
                    text: "\n- ${question.id}",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: .normal,
                      color: colors.onSurface,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: .infinity,
              padding: const EdgeInsets.all(16),
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
