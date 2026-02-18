import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopsbase/core/services/routes.dart';

import '../../../../core/extensions/extensions.dart';
import '../../../../core/models/interview_question.dart';
import '../../../../shared/widgets/bookmark_button.dart';
import '../../controller/cubit/questions_cubit.dart';
import '../question_details_page.dart';
import '../../../../shared/widgets/difficulty_chip.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({required this.question, super.key});
  final InterviewQuestion question;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colorScheme;

    final content = question.getLocalizedContent(l10n.localeName);

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.questionDetails,
            arguments: QuestionDetailsScreenArguments(question: question),
          );
        },
        child: Padding(
          padding: const .all(16),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 12,
            children: [
              // Header row: difficulty chip + categories + bookmark
              Row(
                crossAxisAlignment: .start,
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      crossAxisAlignment: .center,
                      children: [
                        DifficultyChip(question.difficulty),
                        Text(
                          <String>[
                            question.type.label(l10n),
                            ...question.categories.map((c) => c.label(l10n)),
                          ].join(" • "),
                          maxLines: 1,
                          overflow: .ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: colors.onSurfaceVariant,
                            fontWeight: .w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  BlocSelector<QuestionsCubit, QuestionsState, bool>(
                    selector: (state) {
                      return state.bookmarkedQuestions.contains(question.id);
                    },
                    builder: (context, selected) {
                      return BookmarkIconButton(
                        isActive: selected,
                        onPressed: () {
                          context.read<QuestionsCubit>().toggleBookmark(
                            question.id,
                          );
                        },
                        animated: true,
                      );
                    },
                  ),
                ],
              ),

              // Question text + ID + chevron
              Row(
                crossAxisAlignment: .end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      spacing: 6,
                      children: [
                        Text(
                          content.question.safeBidi(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: .w600,
                            height: 1.35,
                          ),
                        ),
                        // Question ID badge
                        Container(
                          padding: const .symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: colors.surfaceContainerHighest.withValues(
                              alpha: 0.5,
                            ),
                            borderRadius: .circular(4),
                          ),
                          child: Text(
                            question.id,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: .w500,
                              color: colors.onSurfaceVariant,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const .all(4),
                    decoration: BoxDecoration(
                      color: colors.primary.withValues(alpha: 0.08),
                      borderRadius: .circular(8),
                    ),
                    child: Icon(
                      Icons.chevron_right_rounded,
                      size: 20,
                      color: colors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
