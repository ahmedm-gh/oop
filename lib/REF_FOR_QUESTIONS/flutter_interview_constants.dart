/// Flutter Interview Questions - Constants and Enumerations
/// Version: 1.0.0
/// Compatible with: Flutter 3.27+ and Dart 3.6+

/// Difficulty levels for interview questions
enum DifficultyLevel {
  basic,
  intermediate,
  advanced,
  expert,
}

/// Main category tags for filtering questions
enum QuestionCategory {
  basic,
  oop,
  solid,
  designPatterns,
  dataStructures,
  algorithms,
  stateManagement,
  architecture,
  performance,
  testing,
  security,
  deployment,
  animations,
  networking,
  database,
  nativePlatform,
  modernFeatures,
  bestPractices,
}

/// Technical tags for more specific filtering
enum TechnicalTag {
  // Core Flutter
  widgets,
  statefulWidget,
  statelessWidget,
  inheritedWidget,
  buildContext,
  keys,
  lifecycle,
  
  // Dart Fundamentals
  dartBasics,
  asyncAwait,
  futures,
  streams,
  isolates,
  generators,
  mixins,
  extensions,
  nullSafety,
  
  // OOP Concepts
  encapsulation,
  inheritance,
  polymorphism,
  abstraction,
  composition,
  
  // SOLID Principles
  singleResponsibility,
  openClosed,
  liskovSubstitution,
  interfaceSegregation,
  dependencyInversion,
  
  // Design Patterns
  singleton,
  factory,
  builder,
  observer,
  repository,
  bloc,
  mvvm,
  mvc,
  cleanArchitecture,
  
  // State Management
  setState,
  provider,
  riverpod,
  bloc_pattern,
  getx,
  mobx,
  redux,
  cubit,
  
  // Performance
  optimization,
  lazyLoading,
  caching,
  memoryManagement,
  renderingOptimization,
  
  // Modern Features (Flutter 3.x+)
  material3,
  impellerEngine,
  fragmentShaders,
  elementEmbedding,
  platformChannels2,
  nativeAssets,
  
  // Testing
  unitTesting,
  widgetTesting,
  integrationTesting,
  mockito,
  goldenTests,
  
  // Networking
  http,
  dio,
  restApi,
  graphql,
  websockets,
  
  // Database
  sqflite,
  hive,
  isar,
  drift,
  sharedPreferences,
  
  // Platform Integration
  methodChannels,
  eventChannels,
  platformViews,
  ffi,
  
  // Build & Deployment
  flavors,
  codeGeneration,
  ci_cd,
  appSigning,
  
  // Accessibility
  semantics,
  screenReaders,
  a11y,
}

/// Question types
enum QuestionType {
  theoretical,
  practical,
  coding,
  debugging,
  architectural,
  scenario,
}

/// Language codes
enum Language {
  en,
  ar,
}

/// Constants class for string values
class InterviewConstants {
  InterviewConstants._();
  
  // Category display names (English)
  static const Map<QuestionCategory, String> categoryNamesEn = {
    QuestionCategory.basic: 'Basic Concepts',
    QuestionCategory.oop: 'Object-Oriented Programming',
    QuestionCategory.solid: 'SOLID Principles',
    QuestionCategory.designPatterns: 'Design Patterns',
    QuestionCategory.dataStructures: 'Data Structures',
    QuestionCategory.algorithms: 'Algorithms',
    QuestionCategory.stateManagement: 'State Management',
    QuestionCategory.architecture: 'Architecture',
    QuestionCategory.performance: 'Performance Optimization',
    QuestionCategory.testing: 'Testing',
    QuestionCategory.security: 'Security',
    QuestionCategory.deployment: 'Deployment & CI/CD',
    QuestionCategory.animations: 'Animations',
    QuestionCategory.networking: 'Networking',
    QuestionCategory.database: 'Database & Storage',
    QuestionCategory.nativePlatform: 'Native Platform Integration',
    QuestionCategory.modernFeatures: 'Modern Features',
    QuestionCategory.bestPractices: 'Best Practices',
  };
  
  // Category display names (Arabic)
  static const Map<QuestionCategory, String> categoryNamesAr = {
    QuestionCategory.basic: 'المفاهيم الأساسية',
    QuestionCategory.oop: 'البرمجة كائنية التوجه',
    QuestionCategory.solid: 'مبادئ SOLID',
    QuestionCategory.designPatterns: 'أنماط التصميم',
    QuestionCategory.dataStructures: 'هياكل البيانات',
    QuestionCategory.algorithms: 'الخوارزميات',
    QuestionCategory.stateManagement: 'إدارة الحالة',
    QuestionCategory.architecture: 'البنية المعمارية',
    QuestionCategory.performance: 'تحسين الأداء',
    QuestionCategory.testing: 'الاختبار',
    QuestionCategory.security: 'الأمان',
    QuestionCategory.deployment: 'النشر والتكامل المستمر',
    QuestionCategory.animations: 'الرسوم المتحركة',
    QuestionCategory.networking: 'الشبكات',
    QuestionCategory.database: 'قواعد البيانات والتخزين',
    QuestionCategory.nativePlatform: 'التكامل مع المنصة الأصلية',
    QuestionCategory.modernFeatures: 'الميزات الحديثة',
    QuestionCategory.bestPractices: 'أفضل الممارسات',
  };
  
  // Difficulty level names (English)
  static const Map<DifficultyLevel, String> difficultyNamesEn = {
    DifficultyLevel.basic: 'Basic',
    DifficultyLevel.intermediate: 'Intermediate',
    DifficultyLevel.advanced: 'Advanced',
    DifficultyLevel.expert: 'Expert',
  };
  
  // Difficulty level names (Arabic)
  static const Map<DifficultyLevel, String> difficultyNamesAr = {
    DifficultyLevel.basic: 'أساسي',
    DifficultyLevel.intermediate: 'متوسط',
    DifficultyLevel.advanced: 'متقدم',
    DifficultyLevel.expert: 'خبير',
  };
  
  // Question type names (English)
  static const Map<QuestionType, String> questionTypeNamesEn = {
    QuestionType.theoretical: 'Theoretical',
    QuestionType.practical: 'Practical',
    QuestionType.coding: 'Coding',
    QuestionType.debugging: 'Debugging',
    QuestionType.architectural: 'Architectural',
    QuestionType.scenario: 'Scenario-Based',
  };
  
  // Question type names (Arabic)
  static const Map<QuestionType, String> questionTypeNamesAr = {
    QuestionType.theoretical: 'نظري',
    QuestionType.practical: 'عملي',
    QuestionType.coding: 'برمجة',
    QuestionType.debugging: 'تصحيح الأخطاء',
    QuestionType.architectural: 'معماري',
    QuestionType.scenario: 'قائم على السيناريو',
  };
  
  // Metadata
  static const String version = '1.0.0';
  static const String flutterVersion = '3.27+';
  static const String dartVersion = '3.6+';
  static const String lastUpdated = '2026-02-07';
}

/// Extension methods for enums
extension DifficultyLevelExtension on DifficultyLevel {
  String get nameEn => InterviewConstants.difficultyNamesEn[this] ?? '';
  String get nameAr => InterviewConstants.difficultyNamesAr[this] ?? '';
  
  int get level {
    switch (this) {
      case DifficultyLevel.basic:
        return 1;
      case DifficultyLevel.intermediate:
        return 2;
      case DifficultyLevel.advanced:
        return 3;
      case DifficultyLevel.expert:
        return 4;
    }
  }
}

extension QuestionCategoryExtension on QuestionCategory {
  String get nameEn => InterviewConstants.categoryNamesEn[this] ?? '';
  String get nameAr => InterviewConstants.categoryNamesAr[this] ?? '';
}

extension QuestionTypeExtension on QuestionType {
  String get nameEn => InterviewConstants.questionTypeNamesEn[this] ?? '';
  String get nameAr => InterviewConstants.questionTypeNamesAr[this] ?? '';
}
