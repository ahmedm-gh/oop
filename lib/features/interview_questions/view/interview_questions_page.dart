import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuts/core/enums/difficulty_level.dart';
import 'package:tuts/core/extensions/extensions.dart';
import 'package:tuts/core/models/interview_question.dart';
import 'package:tuts/features/interview_questions/controller/cubit/questions_cubit.dart';
import 'package:tuts/shared/widgets/filter_chip.dart';

import 'widgets/question_card.dart';

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
          // Search bar
          Padding(
            padding: const .only(right: 16, left: 16, bottom: 16),
            child: Column(
              children: [
                TextField(
                  controller: cubit.searchController,
                  decoration: InputDecoration(
                    hintText: l10n.search,
                    suffixIcon: const Icon(Icons.search_rounded),
                  ),
                  onChanged: (query) =>
                      cubit.filterQuestions(query: () => query),
                ),

                const SizedBox(height: 10),

                // Filter chips
                SizedBox(
                  width: .infinity,
                  child: SingleChildScrollView(
                    scrollDirection: .horizontal,
                    child:
                        BlocSelector<
                          QuestionsCubit,
                          QuestionsState,
                          DifficultyLevel?
                        >(
                          selector: (state) => state.difficulty,
                          builder: (context, difficulty) {
                            return Row(
                              spacing: 10,
                              children: [
                                AppFilterChip(
                                  label: l10n.all,
                                  selected: difficulty == null,
                                  onSelected: () {
                                    cubit.filterQuestions(
                                      query: () => cubit.searchController.text,
                                      difficulty: () => null,
                                    );
                                  },
                                  animated: true,
                                ),
                                ...DifficultyLevel.values.map(
                                  (level) => AppFilterChip(
                                    label: level.label(l10n),
                                    selected: difficulty == level,
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

          const Opacity(opacity: 0.4, child: Divider(height: 1, thickness: 1)),

          // Questions list
          Expanded(
            child: BlocSelector<QuestionsCubit, QuestionsState, bool>(
              selector: (state) {
                return state.questions.isEmpty;
              },
              builder: (context, isEmpty) {
                return isEmpty
                    ? Center(child: Text(l10n.noResults))
                    : CardTheme(
                        color: colors.surfaceContainerLowest,
                        shape: RoundedRectangleBorder(
                          borderRadius: .circular(16),
                          side: BorderSide(
                            color: colors.outlineVariant.withValues(
                              alpha: 0.35,
                            ),
                          ),
                        ),
                        elevation: 0,
                        child:
                            BlocSelector<
                              QuestionsCubit,
                              QuestionsState,
                              List<InterviewQuestion>
                            >(
                              selector: (state) {
                                return state.questions;
                              },
                              builder: (context, questions) {
                                return ListView.separated(
                                  padding: const EdgeInsets.all(16),
                                  itemCount: questions.length,
                                  itemBuilder: (_, i) {
                                    return QuestionCard(question: questions[i]);
                                  },
                                  separatorBuilder: (_, i) {
                                    return const SizedBox(height: 10);
                                  },
                                );
                              },
                            ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
