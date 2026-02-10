import 'package:get_it/get_it.dart';

import '../../features/interview_questions/controller/cubit/questions_cubit.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerFactory<QuestionsCubit>(QuestionsCubit.new);
}
