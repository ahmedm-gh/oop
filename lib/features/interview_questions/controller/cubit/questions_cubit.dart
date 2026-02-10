import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuts/data/interview_questions_repository.dart';

import '../../../../core/enums/difficulty_level.dart';
import '../../../../core/models/interview_question.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit()
    : super(
        const QuestionsState(bookmarkedQuestions: {}, questions: questionsData),
      );

  final searchController = TextEditingController();

  void filterQuestions({
    ValueGetter<String?>? query,
    ValueGetter<DifficultyLevel?>? difficulty,
  }) {
    // Determine the target values for filtering.
    // If a getter is provided, use its value (even if null).
    // If not provided (null), preserve the current state.
    final String targetQuery = query != null
        ? (query() ?? '')
        : (state.query ?? '');
    final DifficultyLevel? targetDifficulty = difficulty != null
        ? difficulty()
        : state.difficulty;

    // Always filter starting from the complete dataset (questionsData).
    final filtered = questionsData.where((question) {
      final matchesQuery =
          targetQuery.isEmpty ||
          (question.content.en.question + question.content.ar.question)
              .toLowerCase()
              .contains(targetQuery.toLowerCase());

      final matchesDifficulty =
          targetDifficulty == null || question.difficulty == targetDifficulty;

      return matchesQuery && matchesDifficulty;
    }).toList();

    emit(
      state.copyWith(
        questions: filtered,
        query: () => targetQuery,
        difficulty: () => targetDifficulty,
      ),
    );
  }

  void bookmarkQuestion(String id) {
    emit(
      state.copyWith(bookmarkedQuestions: {...state.bookmarkedQuestions, id}),
    );
  }

  void unbookmarkQuestion(String id) {
    emit(
      state.copyWith(
        bookmarkedQuestions: {...state.bookmarkedQuestions}..remove(id),
      ),
    );
  }

  void toggleBookmark(String id) {
    if (state.bookmarkedQuestions.contains(id)) {
      unbookmarkQuestion(id);
    } else {
      bookmarkQuestion(id);
    }
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
