import 'package:flutter/material.dart';
import 'package:tuts/core/enums/difficulty_level.dart';
import 'package:tuts/core/extensions/extensions.dart';
import 'package:tuts/core/models/interview_question.dart';
import 'package:tuts/data/interview_questions_repository.dart';

import '../../shared/widgets/question_card.dart';

class InterviewQuestionsPage extends StatefulWidget {
  const InterviewQuestionsPage({super.key});

  @override
  State<InterviewQuestionsPage> createState() => _InterviewQuestionsPageState();
}

class _InterviewQuestionsPageState extends State<InterviewQuestionsPage> {
  final _searchController = TextEditingController();
  String _searchQuery = '';
  DifficultyLevel? _selectedDifficulty;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<InterviewQuestion> get _filteredQuestions {
    final langCode = context.l10n.localeName;
    var questions = InterviewQuestionsRepository.search(_searchQuery, langCode);
    if (_selectedDifficulty != null) {
      questions = questions
          .where((q) => q.difficulty == _selectedDifficulty)
          .toList();
    }
    return questions;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final questions = _filteredQuestions;
    final colors = context.colorScheme;

    // Group by difficulty
    final grouped = <DifficultyLevel, List<InterviewQuestion>>{};
    for (final q in questions) {
      grouped.putIfAbsent(q.difficulty, () => []).add(q);
    }

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
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: l10n.search,
                    suffixIcon: const Icon(Icons.search_rounded),
                  ),
                  onChanged: (v) => setState(() => _searchQuery = v),
                ),

                const SizedBox(height: 10),

                // Filter chips
                SizedBox(
                  width: .infinity,
                  child: ChipTheme(
                    data: ChipThemeData(
                      padding: .zero,
                      labelPadding: const .symmetric(horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: .circular(15),
                        side: BorderSide(
                          color: colors.outlineVariant.withValues(alpha: 0.35),
                        ),
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: .horizontal,
                      child: Row(
                        spacing: 10,
                        children: [
                          _FilterChip(
                            label: l10n.all,
                            selected: _selectedDifficulty == null,
                            onSelected: () {
                              setState(() => _selectedDifficulty = null);
                            },
                          ),
                          ...DifficultyLevel.values.map(
                            (level) => _FilterChip(
                              label: level.label(l10n),
                              selected: _selectedDifficulty == level,
                              color: level.color,
                              onSelected: () {
                                setState(() {
                                  _selectedDifficulty = level;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Opacity(opacity: 0.4, child: Divider(height: 1, thickness: 1)),

          // Questions list
          Expanded(
            child: questions.isEmpty
                ? Center(child: Text(l10n.noResults))
                : CardTheme(
                    color: colors.surfaceContainerLowest,
                    shape: RoundedRectangleBorder(
                      borderRadius: .circular(16),
                      side: BorderSide(
                        color: colors.outlineVariant.withValues(alpha: 0.35),
                      ),
                    ),
                    elevation: 0,
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: questions.length,
                      itemBuilder: (_, i) {
                        return QuestionCard(question: questions[i]);
                      },
                      separatorBuilder: (_, i) => const SizedBox(height: 10),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onSelected,
    this.color,
  });
  final String label;
  final bool selected;
  final Color? color;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(color: selected ? color?.pairedColor : null),
      ),
      selected: selected,
      onSelected: (_) => onSelected(),
      selectedColor: color,
      showCheckmark: false,
      side: selected ? .none : null,
    );
  }
}
