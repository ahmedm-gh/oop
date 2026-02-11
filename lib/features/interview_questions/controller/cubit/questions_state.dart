part of 'questions_cubit.dart';

final class QuestionsState {
  const QuestionsState({
    required this.bookmarkedQuestions,
    required this.questions,
    this.query,
    this.difficulty,
    this.onlyBookmarked = false,
  });

  factory QuestionsState.fromJson(Map<String, dynamic> json) {
    return QuestionsState(
      bookmarkedQuestions: toValue<Iterable<String>>(
        json["bookmarkedQuestions"],
        const {},
      ).toSet(),
      questions: questionsData,
    );
  }

  final Set<String> bookmarkedQuestions;
  final List<InterviewQuestion> questions;
  final String? query;
  final DifficultyLevel? difficulty;
  final bool onlyBookmarked;

  QuestionsState copyWith({
    Set<String>? bookmarkedQuestions,
    List<InterviewQuestion>? questions,
    ValueGetter<String?>? query,
    ValueGetter<DifficultyLevel?>? difficulty,
    ValueGetter<bool>? onlyBookmarked,
  }) {
    return QuestionsState(
      bookmarkedQuestions: bookmarkedQuestions ?? this.bookmarkedQuestions,
      questions: questions ?? this.questions,
      query: query != null ? query() : this.query,
      difficulty: difficulty != null ? difficulty() : this.difficulty,
      onlyBookmarked: onlyBookmarked != null
          ? onlyBookmarked()
          : this.onlyBookmarked,
    );
  }

  Map<String, dynamic> toJson() {
    return {"bookmarkedQuestions": bookmarkedQuestions.toList()};
  }
}
