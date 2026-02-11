import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuts/core/services/locator.dart';
import 'package:tuts/features/design_patterns/design_patterns_page.dart';
import 'package:tuts/features/design_patterns/pattern_details_page.dart';
import 'package:tuts/features/home/home_page.dart';
import 'package:tuts/features/interview_questions/controller/cubit/questions_cubit.dart';
import 'package:tuts/features/interview_questions/view/interview_questions_page.dart';
import 'package:tuts/features/interview_questions/view/question_details_page.dart';
import 'package:tuts/features/splash/splash_screen.dart';
import 'package:tuts/shared/methods/to_value.dart';

abstract class Routes {
  static const String splash = "/";
  static const String home = "/home";
  static const String designPattern = "/design-pattern";
  static const String designPatternDetails = "/design-pattern-details";

  static const String questionList = "/question-list";
  static const String questionDetails = "/question-details";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    log("$settings", name: "route");
    return switch (settings.name) {
      splash => MaterialPageRoute(builder: (_) => const SplashScreen()),
      home => MaterialPageRoute(builder: (_) => const HomeScreen()),
      designPattern => MaterialPageRoute(
        builder: (_) => const DesignPatternsScreen(),
      ),
      designPatternDetails => MaterialPageRoute(
        builder: (_) {
          return PatternDetailsScreen(
            pattern: toValue<PatternDetailsScreenArguments>(
              settings.arguments,
              const .none(),
            ).pattern,
          );
        },
      ),
      questionList => MaterialPageRoute(
        builder: (_) => BlocProvider<QuestionsCubit>(
          create: (context) => sl(),
          child: const InterviewQuestionsScreen(),
        ),
      ),
      questionDetails => MaterialPageRoute(
        builder: (_) => const QuestionDetailsScreen(question: null),
      ),
      _ => null,
    };
  }
}
