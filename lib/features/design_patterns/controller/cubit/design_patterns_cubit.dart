import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'design_patterns_state.dart';

class DesignPatternsCubit extends HydratedCubit<DesignPatternsState> {
  DesignPatternsCubit() : super(const DesignPatternsState());

  void toggleBookmark(String patternId) {
    final currentBookmarks = List<String>.from(state.bookmarkedIds);
    if (currentBookmarks.contains(patternId)) {
      currentBookmarks.remove(patternId);
    } else {
      currentBookmarks.add(patternId);
    }
    emit(state.copyWith(bookmarkedIds: currentBookmarks));
  }

  bool isBookmarked(String patternId) {
    return state.bookmarkedIds.contains(patternId);
  }

  @override
  DesignPatternsState? fromJson(Map<String, dynamic> json) {
    return DesignPatternsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(DesignPatternsState state) {
    return state.toMap();
  }

  void toggleCategory(String id) {
    final currentHidden = Set<String>.from(state.hiddenCategories);
    if (currentHidden.contains(id)) {
      currentHidden.remove(id);
    } else {
      currentHidden.add(id);
    }
    emit(state.copyWith(hiddenCategories: {...currentHidden}));
  }

  bool isCategoryHidden(String id) => state.hiddenCategories.contains(id);
}
