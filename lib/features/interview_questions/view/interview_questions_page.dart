import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopsbase/core/enums/difficulty_level.dart';
import 'package:loopsbase/core/extensions/extensions.dart';
import 'package:loopsbase/core/models/interview_question.dart';
import 'package:loopsbase/features/interview_questions/controller/cubit/questions_cubit.dart';
import 'package:loopsbase/shared/app_widgets.dart';
import 'package:loopsbase/shared/design_layouts.dart';

import 'widgets/question_card.dart';
import 'widgets/question_cards_wrapper.dart';

class InterviewQuestionsScreen extends StatelessWidget {
  const InterviewQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colorScheme;

    final cubit = context.read<QuestionsCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.interviewQuestions),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: .stretch,
        children: [
          // Search & filters area
          Padding(
            padding: const .only(right: 16, left: 16, bottom: 12),
            child: Column(
              mainAxisSize: .min,
              children: [
                // Search bar
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: cubit.searchController,
                        decoration: InputDecoration(
                          hintText: l10n.search,
                          suffixIcon: const Icon(Icons.search_rounded),
                        ),
                        onChanged: (query) =>
                            cubit.filterQuestions(query: () => query),
                      ),
                    ),
                    const SizedBox(width: DL.compactListSeparatorHeight),
                    BlocSelector<QuestionsCubit, QuestionsState, bool>(
                      selector: (state) => state.onlyBookmarked,
                      builder: (context, onlyBookmarked) {
                        return BookmarkIconButton.bookmarks(
                          tooltip: l10n.onlyBookmarked,
                          onPressed: cubit.toggleOnlyBookmarked,
                          isActive: onlyBookmarked,
                          animated: true,
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: DL.compactListSeparatorHeight),

                // Filter chips row
                SizedBox(
                  width: .infinity,
                  child: SingleChildScrollView(
                    scrollDirection: .horizontal,
                    clipBehavior: .none,
                    child:
                        BlocSelector<
                          QuestionsCubit,
                          QuestionsState,
                          DifficultyLevel?
                        >(
                          selector: (state) => state.difficulty,
                          builder: (context, state) {
                            return Row(
                              spacing: 10,
                              children: [
                                AppFilterChip(
                                  label: l10n.allLevels,
                                  selected: state == null,
                                  onSelected: () {
                                    cubit.filterQuestions(
                                      query: () => cubit.searchController.text,
                                      difficulty: () => null,
                                    );
                                  },
                                  animated: true,
                                  color: colors.primary,
                                ),
                                ...DifficultyLevel.values.map(
                                  (level) => AppFilterChip(
                                    label: level.label(l10n),
                                    selected: state == level,
                                    color: level.color,
                                    onSelected: () {
                                      cubit.filterQuestions(
                                        difficulty: () => level,
                                      );
                                    },
                                    animated: true,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                  ),
                ),
              ],
            ),
          ),

          // Results count indicator
          BlocSelector<QuestionsCubit, QuestionsState, int>(
            selector: (state) => state.questions.length,
            builder: (context, count) {
              return Padding(
                padding: const .symmetric(horizontal: 16, vertical: 6),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Row(
                    key: ValueKey(count),
                    children: [
                      Container(
                        padding: const .symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: colors.primary.withValues(alpha: 0.1),
                          borderRadius: .circular(6),
                        ),
                        child: Text(
                          '$count',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: .bold,
                            color: colors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        l10n.interviewQuestions,
                        style: TextStyle(
                          fontSize: 13,
                          color: colors.onSurfaceVariant,
                          fontWeight: .w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const LiteDivider(),

          // Questions list
          Expanded(
            child: BlocSelector<QuestionsCubit, QuestionsState, bool>(
              selector: (state) {
                return state.questions.isEmpty;
              },
              builder: (context, isEmpty) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: isEmpty
                      ? Center(
                          key: const ValueKey('empty'),
                          child: _EmptyState(message: l10n.noResults),
                        )
                      : const _QuestionsList(key: ValueKey('list')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return Column(
      mainAxisSize: .min,
      children: [
        Icon(
          Icons.search_off_rounded,
          size: 56,
          color: colors.onSurfaceVariant.withValues(alpha: 0.4),
        ),
        const SizedBox(height: 12),
        Text(
          message,
          style: TextStyle(
            fontSize: 15,
            color: colors.onSurfaceVariant,
            fontWeight: .w500,
          ),
        ),
      ],
    );
  }
}

class _QuestionsList extends StatelessWidget {
  const _QuestionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionCardsWrapper(
      child:
          BlocSelector<QuestionsCubit, QuestionsState, List<InterviewQuestion>>(
            selector: (state) => state.questions,
            builder: (context, questions) {
              log("questions: ${questions.length}");
              return ListView.separated(
                padding: DL.listPadding,
                itemCount: questions.length,
                itemBuilder: (_, i) {
                  return QuestionCard(question: questions[i]);
                },
                separatorBuilder: (_, i) {
                  return const SizedBox(height: DL.listSeparatorHeight);
                },
              );
            },
          ),
    );
  }
}
