part of 'questions_cubit.dart';

final class QuestionsState {
  const QuestionsState({
    required this.bookmarkedQuestions,
    required this.questions,
    this.query,
    this.difficulty,
  });

  final Set<String> bookmarkedQuestions;
  final List<InterviewQuestion> questions;
  final String? query;
  final DifficultyLevel? difficulty;

  QuestionsState copyWith({
    Set<String>? bookmarkedQuestions,
    List<InterviewQuestion>? questions,
    ValueGetter<String?>? query,
    ValueGetter<DifficultyLevel?>? difficulty,
  }) {
    return QuestionsState(
      bookmarkedQuestions: bookmarkedQuestions ?? this.bookmarkedQuestions,
      questions: questions ?? this.questions,
      query: query != null ? query() : this.query,
      difficulty: difficulty != null ? difficulty() : this.difficulty,
    );
  }
}
