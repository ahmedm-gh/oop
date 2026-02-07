/// Example Flutter Application using the Interview Questions Dataset
/// This demonstrates various ways to use the questions in a real app

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'flutter_interview_constants.dart';
import 'flutter_interview_models.dart';

void main() {
  runApp(const InterviewQuestionsApp());
}

class InterviewQuestionsApp extends StatelessWidget {
  const InterviewQuestionsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Interview Questions',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InterviewQuestionsDataset? _dataset;
  bool _isLoading = true;
  Language _currentLanguage = Language.en;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/flutter_interview_questions_complete.json',
      );
      final dataset = QuestionLoader.fromJsonString(jsonString);
      setState(() {
        _dataset = dataset;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading questions: $e');
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_dataset == null) {
      return Scaffold(
        body: Center(
          child: Text('Failed to load questions'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Interview Questions'),
        actions: [
          // Language toggle
          IconButton(
            icon: Text(_currentLanguage == Language.en ? 'EN' : 'AR'),
            onPressed: () {
              setState(() {
                _currentLanguage = _currentLanguage == Language.en
                    ? Language.ar
                    : Language.en;
              });
            },
          ),
          // Statistics
          IconButton(
            icon: const Icon(Icons.analytics),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => StatisticsPage(dataset: _dataset!),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter chips
          _buildFilterChips(),
          // Questions list
          Expanded(child: _buildQuestionsList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showRandomQuestion(),
        child: const Icon(Icons.shuffle),
        tooltip: 'Random Question',
      ),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          ...DifficultyLevel.values.map((level) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FilterChip(
                  label: Text(_currentLanguage == Language.en
                      ? level.nameEn
                      : level.nameAr),
                  onSelected: (selected) {
                    if (selected) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuestionsListPage(
                            questions: _dataset!.filterByDifficulty(level),
                            title: level.nameEn,
                            language: _currentLanguage,
                          ),
                        ),
                      );
                    }
                  },
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildQuestionsList() {
    return ListView.builder(
      itemCount: _dataset!.questions.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        final question = _dataset!.questions[index];
        final content = _currentLanguage == Language.en
            ? question.content.en
            : question.content.ar;

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: _getDifficultyColor(question.difficultyLevel),
              child: Text(
                question.id.split('-')[1],
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            title: Text(
              content.question,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${question.difficulty} • ${question.category}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => QuestionDetailPage(
                    question: question,
                    language: _currentLanguage,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showRandomQuestion() {
    final stats = QuestionStatistics(_dataset!);
    final randomQuestion = stats.getRandomQuestion();
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuestionDetailPage(
          question: randomQuestion,
          language: _currentLanguage,
        ),
      ),
    );
  }

  Color _getDifficultyColor(DifficultyLevel? level) {
    switch (level) {
      case DifficultyLevel.basic:
        return Colors.green;
      case DifficultyLevel.intermediate:
        return Colors.orange;
      case DifficultyLevel.advanced:
        return Colors.red;
      case DifficultyLevel.expert:
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}

/// Question Detail Page
class QuestionDetailPage extends StatelessWidget {
  final InterviewQuestion question;
  final Language language;

  const QuestionDetailPage({
    Key? key,
    required this.question,
    required this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = language == Language.en
        ? question.content.en
        : question.content.ar;

    return Scaffold(
      appBar: AppBar(
        title: Text(question.id),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tags
            Wrap(
              spacing: 8,
              children: question.tags.map((tag) => Chip(
                label: Text(tag, style: const TextStyle(fontSize: 12)),
                visualDensity: VisualDensity.compact,
              )).toList(),
            ),
            const SizedBox(height: 16),

            // Question
            Text(
              content.question,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),

            // Answer
            _buildSection(
              context,
              language == Language.en ? 'Answer' : 'الإجابة',
              content.answer,
            ),

            // Example
            if (content.example != null) ...[
              const SizedBox(height: 16),
              _buildCodeSection(
                context,
                language == Language.en ? 'Example' : 'مثال',
                content.example!,
              ),
            ],

            // Notes
            if (content.notes != null) ...[
              const SizedBox(height: 16),
              _buildInfoBox(
                context,
                language == Language.en ? 'Notes' : 'ملاحظات',
                content.notes!,
                Colors.blue,
              ),
            ],

            // Best Use
            if (content.bestUse != null) ...[
              const SizedBox(height: 16),
              _buildInfoBox(
                context,
                language == Language.en ? 'Best Use' : 'أفضل استخدام',
                content.bestUse!,
                Colors.green,
              ),
            ],

            // Pros
            if (question.pros != null) ...[
              const SizedBox(height: 16),
              _buildListSection(
                context,
                language == Language.en ? 'Pros' : 'المزايا',
                question.pros!,
                Colors.green,
              ),
            ],

            // Cons
            if (question.cons != null) ...[
              const SizedBox(height: 16),
              _buildListSection(
                context,
                language == Language.en ? 'Cons' : 'العيوب',
                question.cons!,
                Colors.red,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(content),
      ],
    );
  }

  Widget _buildCodeSection(BuildContext context, String title, String code) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            code,
            style: const TextStyle(
              fontFamily: 'monospace',
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoBox(
    BuildContext context,
    String title,
    String content,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: color, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(content),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListSection(
    BuildContext context,
    String title,
    List<String> items,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
        ),
        const SizedBox(height: 8),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    color == Colors.green ? Icons.check_circle : Icons.cancel,
                    color: color,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Text(item)),
                ],
              ),
            )),
      ],
    );
  }
}

/// Statistics Page
class StatisticsPage extends StatelessWidget {
  final InterviewQuestionsDataset dataset;

  const StatisticsPage({Key? key, required this.dataset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stats = QuestionStatistics(dataset);
    final difficultyCount = stats.getCountByDifficulty();
    final categoryCount = stats.getCountByCategory();

    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'By Difficulty',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          ...difficultyCount.entries.map((entry) => Card(
                child: ListTile(
                  leading: Icon(Icons.bar_chart, color: _getColor(entry.key)),
                  title: Text(entry.key.nameEn),
                  trailing: Text(
                    '${entry.value}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
          const SizedBox(height: 24),
          Text(
            'By Category',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          ...categoryCount.entries
              .where((e) => e.value > 0)
              .map((entry) => Card(
                    child: ListTile(
                      title: Text(entry.key.nameEn),
                      trailing: Text(
                        '${entry.value}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
        ],
      ),
    );
  }

  Color _getColor(DifficultyLevel level) {
    switch (level) {
      case DifficultyLevel.basic:
        return Colors.green;
      case DifficultyLevel.intermediate:
        return Colors.orange;
      case DifficultyLevel.advanced:
        return Colors.red;
      case DifficultyLevel.expert:
        return Colors.purple;
    }
  }
}

/// Questions List Page
class QuestionsListPage extends StatelessWidget {
  final List<InterviewQuestion> questions;
  final String title;
  final Language language;

  const QuestionsListPage({
    Key? key,
    required this.questions,
    required this.title,
    required this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: questions.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final question = questions[index];
          final content = language == Language.en
              ? question.content.en
              : question.content.ar;

          return Card(
            child: ListTile(
              title: Text(content.question),
              subtitle: Text(question.id),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuestionDetailPage(
                      question: question,
                      language: language,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
