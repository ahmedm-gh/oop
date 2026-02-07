/// Flutter Interview Questions - Data Models
/// Models for parsing and working with the interview questions JSON data

import 'dart:convert';
import 'flutter_interview_constants.dart';

/// Main container for the questions dataset
class InterviewQuestionsDataset {
  final DatasetMetadata metadata;
  final List<InterviewQuestion> questions;

  InterviewQuestionsDataset({
    required this.metadata,
    required this.questions,
  });

  factory InterviewQuestionsDataset.fromJson(Map<String, dynamic> json) {
    return InterviewQuestionsDataset(
      metadata: DatasetMetadata.fromJson(json['metadata']),
      questions: (json['questions'] as List)
          .map((q) => InterviewQuestion.fromJson(q))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'metadata': metadata.toJson(),
        'questions': questions.map((q) => q.toJson()).toList(),
      };

  /// Filter questions by difficulty
  List<InterviewQuestion> filterByDifficulty(DifficultyLevel difficulty) {
    return questions
        .where((q) => q.difficulty == difficulty.name)
        .toList();
  }

  /// Filter questions by category
  List<InterviewQuestion> filterByCategory(QuestionCategory category) {
    return questions
        .where((q) => q.category == category.name)
        .toList();
  }

  /// Filter questions by tag
  List<InterviewQuestion> filterByTag(String tag) {
    return questions
        .where((q) => q.tags.contains(tag))
        .toList();
  }

  /// Search questions by keyword
  List<InterviewQuestion> search(String keyword, {Language lang = Language.en}) {
    final lower = keyword.toLowerCase();
    return questions.where((q) {
      final content = lang == Language.en ? q.content.en : q.content.ar;
      return content.question.toLowerCase().contains(lower) ||
          content.answer.toLowerCase().contains(lower) ||
          (content.notes?.toLowerCase().contains(lower) ?? false);
    }).toList();
  }
}

/// Metadata about the dataset
class DatasetMetadata {
  final String version;
  final String lastUpdated;
  final String flutterVersion;
  final String dartVersion;
  final int totalQuestions;
  final List<String> languages;
  final Map<String, String> description;

  DatasetMetadata({
    required this.version,
    required this.lastUpdated,
    required this.flutterVersion,
    required this.dartVersion,
    required this.totalQuestions,
    required this.languages,
    required this.description,
  });

  factory DatasetMetadata.fromJson(Map<String, dynamic> json) {
    return DatasetMetadata(
      version: json['version'],
      lastUpdated: json['lastUpdated'],
      flutterVersion: json['flutterVersion'],
      dartVersion: json['dartVersion'],
      totalQuestions: json['totalQuestions'],
      languages: List<String>.from(json['languages']),
      description: Map<String, String>.from(json['description']),
    );
  }

  Map<String, dynamic> toJson() => {
        'version': version,
        'lastUpdated': lastUpdated,
        'flutterVersion': flutterVersion,
        'dartVersion': dartVersion,
        'totalQuestions': totalQuestions,
        'languages': languages,
        'description': description,
      };
}

/// Individual interview question
class InterviewQuestion {
  final String id;
  final String difficulty;
  final String category;
  final String type;
  final List<String> tags;
  final BilingualContent content;
  final List<String>? pros;
  final List<String>? cons;

  InterviewQuestion({
    required this.id,
    required this.difficulty,
    required this.category,
    required this.type,
    required this.tags,
    required this.content,
    this.pros,
    this.cons,
  });

  factory InterviewQuestion.fromJson(Map<String, dynamic> json) {
    return InterviewQuestion(
      id: json['id'],
      difficulty: json['difficulty'],
      category: json['category'],
      type: json['type'],
      tags: List<String>.from(json['tags']),
      content: BilingualContent.fromJson(json['content']),
      pros: json['pros'] != null ? List<String>.from(json['pros']) : null,
      cons: json['cons'] != null ? List<String>.from(json['cons']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'difficulty': difficulty,
        'category': category,
        'type': type,
        'tags': tags,
        'content': content.toJson(),
        if (pros != null) 'pros': pros,
        if (cons != null) 'cons': cons,
      };

  /// Get difficulty level enum
  DifficultyLevel? get difficultyLevel {
    try {
      return DifficultyLevel.values.firstWhere(
        (e) => e.name == difficulty,
      );
    } catch (_) {
      return null;
    }
  }

  /// Get category enum
  QuestionCategory? get categoryEnum {
    try {
      return QuestionCategory.values.firstWhere(
        (e) => e.name == category,
      );
    } catch (_) {
      return null;
    }
  }

  /// Get type enum
  QuestionType? get questionType {
    try {
      return QuestionType.values.firstWhere(
        (e) => e.name == type,
      );
    } catch (_) {
      return null;
    }
  }
}

/// Bilingual content container
class BilingualContent {
  final QuestionContent en;
  final QuestionContent ar;

  BilingualContent({
    required this.en,
    required this.ar,
  });

  factory BilingualContent.fromJson(Map<String, dynamic> json) {
    return BilingualContent(
      en: QuestionContent.fromJson(json['en']),
      ar: QuestionContent.fromJson(json['ar']),
    );
  }

  Map<String, dynamic> toJson() => {
        'en': en.toJson(),
        'ar': ar.toJson(),
      };

  /// Get content for specific language
  QuestionContent getContent(Language language) {
    return language == Language.en ? en : ar;
  }
}

/// Question content in a single language
class QuestionContent {
  final String question;
  final String answer;
  final String? example;
  final String? notes;
  final String? bestUse;

  QuestionContent({
    required this.question,
    required this.answer,
    this.example,
    this.notes,
    this.bestUse,
  });

  factory QuestionContent.fromJson(Map<String, dynamic> json) {
    return QuestionContent(
      question: json['question'],
      answer: json['answer'],
      example: json['example'],
      notes: json['notes'],
      bestUse: json['bestUse'],
    );
  }

  Map<String, dynamic> toJson() => {
        'question': question,
        'answer': answer,
        if (example != null) 'example': example,
        if (notes != null) 'notes': notes,
        if (bestUse != null) 'bestUse': bestUse,
      };
}

/// Helper class for loading questions from JSON file
class QuestionLoader {
  /// Load questions from JSON string
  static InterviewQuestionsDataset fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return InterviewQuestionsDataset.fromJson(json);
  }

  /// Load questions from JSON file
  static Future<InterviewQuestionsDataset> fromJsonFile(String filePath) async {
    // In a real app, you'd use rootBundle or File API
    // This is a placeholder for the implementation
    throw UnimplementedError('Implement file loading based on your platform');
  }

  /// Merge multiple question datasets
  static InterviewQuestionsDataset merge(List<InterviewQuestionsDataset> datasets) {
    if (datasets.isEmpty) {
      throw ArgumentError('Cannot merge empty list of datasets');
    }

    final allQuestions = <InterviewQuestion>[];
    for (final dataset in datasets) {
      allQuestions.addAll(dataset.questions);
    }

    return InterviewQuestionsDataset(
      metadata: datasets.first.metadata,
      questions: allQuestions,
    );
  }
}

/// Statistics helper
class QuestionStatistics {
  final InterviewQuestionsDataset dataset;

  QuestionStatistics(this.dataset);

  /// Get count by difficulty
  Map<DifficultyLevel, int> getCountByDifficulty() {
    final counts = <DifficultyLevel, int>{};
    for (final level in DifficultyLevel.values) {
      counts[level] = dataset.filterByDifficulty(level).length;
    }
    return counts;
  }

  /// Get count by category
  Map<QuestionCategory, int> getCountByCategory() {
    final counts = <QuestionCategory, int>{};
    for (final category in QuestionCategory.values) {
      counts[category] = dataset.filterByCategory(category).length;
    }
    return counts;
  }

  /// Get most common tags
  Map<String, int> getTagFrequency() {
    final frequency = <String, int>{};
    for (final question in dataset.questions) {
      for (final tag in question.tags) {
        frequency[tag] = (frequency[tag] ?? 0) + 1;
      }
    }
    return Map.fromEntries(
      frequency.entries.toList()..sort((a, b) => b.value.compareTo(a.value)),
    );
  }

  /// Get random question
  InterviewQuestion getRandomQuestion({
    DifficultyLevel? difficulty,
    QuestionCategory? category,
  }) {
    var questions = dataset.questions;
    
    if (difficulty != null) {
      questions = dataset.filterByDifficulty(difficulty);
    }
    
    if (category != null) {
      questions = questions
          .where((q) => q.category == category.name)
          .toList();
    }

    if (questions.isEmpty) {
      throw StateError('No questions matching criteria');
    }

    questions.shuffle();
    return questions.first;
  }
}
