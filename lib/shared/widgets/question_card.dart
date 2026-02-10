import 'package:flutter/material.dart';

import '../../core/extensions/extensions.dart';
import '../../core/models/interview_question.dart';
import '../../features/interview_questions/question_details_page.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({required this.question, super.key});
  final InterviewQuestion question;

  @override
  Widget build(BuildContext context) {
    final langCode = context.l10n.localeName;
    final colors = context.colorScheme;

    final content = question.getLocalizedContent(langCode);

    return Card(
      child: InkWell(
        borderRadius: .circular(10),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (_) => QuestionDetailsPage(question: question),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 10,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: content.question.safeBidi(),
                        children: [
                          TextSpan(
                            text: "\n- ${question.id}",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: .normal,
                              color: colors.secondary,
                            ),
                          ),
                        ],
                      ),
                      style: const TextStyle(fontSize: 16, fontWeight: .w600),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(Icons.chevron_right, color: colors.onSurfaceVariant),
                ],
              ),
              // DifficultyChip(difficultyLevel: question.difficulty),
              ChipTheme(
                data: ChipThemeData(
                  padding: .zero,
                  labelPadding: const .symmetric(horizontal: 10),
                  shape: RoundedRectangleBorder(borderRadius: .circular(5)),
                  color: WidgetStatePropertyAll(colors.surfaceContainerLow),
                  side: .none,
                ),
                child: Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    ...?question.tags
                        ?.take(3)
                        .map(
                          (tag) => Chip(
                            visualDensity: .compact,
                            label: Text(
                              tag,
                              style: TextStyle(
                                fontSize: 12,
                                color: colors.onSurface,
                              ),
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
