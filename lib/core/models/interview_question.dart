/// Interview question model for the Flutter interview questions feature.
library;

import 'package:tuts/core/models/code_block.dart';
import 'package:tuts/core/models/content.dart';
import 'package:tuts/core/models/localized_text.dart';

import '../enums/enums.dart';

/// Represents a single interview question with all its content
class InterviewQuestion {
  const InterviewQuestion({
    required this.id,
    required this.difficulty,
    required this.categories,
    required this.type,
    required this.tags,
    required this.content,
    this.examples,
    this.cons,
    this.pros,
  });

  final String id;
  final DifficultyLevel difficulty;
  final List<QuestionCategory> categories;
  final QuestionType type;
  final List<String>? tags;
  final LocalizedValue<QuestionContent> content;
  final List<StrCodeBlock>? examples;
  final LocalizedValue<List<String>>? pros;
  final LocalizedValue<List<String>>? cons;

  /// Get the localized content based on the current locale
  QuestionContent getLocalizedContent(String languageCode) {
    return languageCode == "ar" ? content.ar : content.en;
  }

  /// Get the localized pros based on the current locale
  List<String>? getLocalizedPros(String languageCode) {
    return languageCode == "ar" ? pros?.ar : pros?.en;
  }

  /// Get the localized cons based on the current locale
  List<String>? getLocalizedCons(String languageCode) {
    return languageCode == "ar" ? cons?.ar : cons?.en;
  }
}

/// Content for a specific language
class QuestionContent {
  const QuestionContent({
    required this.question,
    required this.answer,
    this.notes,
    this.bestUse,
  });

  final String question;
  final List<Content> answer;
  final List<String>? notes;
  final String? bestUse;
}
