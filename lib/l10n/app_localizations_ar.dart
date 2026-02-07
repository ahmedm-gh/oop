// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'ماستر في هندسة الكائنات (OOP Mastery)';

  @override
  String get home => 'الرئيسية';

  @override
  String get designPatterns => 'أنماط التصميم (Design Patterns)';

  @override
  String get refactoring => 'إعادة هيكلة الكود (Refactoring)';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get lightMode => 'الوضع الفاتح';

  @override
  String get language => 'اللغة';

  @override
  String get creationalPatterns => 'الأنماط الإنشائية (Creational Patterns)';

  @override
  String get creationalPatternsDesc =>
      'تجرد الأنماط الإنشائية عملية إنشاء الكائنات. فهي تساعد في جعل النظام مستقلاً عن كيفية إنشاء كائناته وتكوينها وتمثيلها.';

  @override
  String get factoryMethod => 'طريقة المصنع (Factory Method)';

  @override
  String get factoryMethodDesc =>
      'يوفر واجهة لإنشاء الكائنات في فئة عليا (Superclass)، ولكنه يسمح للفئات الفرعية (Subclasses) بتعديل نوع الكائنات التي سيتم إنشاؤها.';

  @override
  String get abstractFactory => 'المصنع المجرد (Abstract Factory)';

  @override
  String get abstractFactoryDesc =>
      'يتيح لك إنتاج عائلات من الكائنات المرتبطة دون تحديد فئاتها الخرسانية (Concrete Classes).';

  @override
  String get builder => 'البناء (Builder)';

  @override
  String get builderDesc =>
      'يتيح لك بناء كائنات معقدة خطوة بخطوة. يسمح النمط بإنتاج أنواع وتمثيلات مختلفة لكائن باستخدام نفس كود البناء.';

  @override
  String get prototype => 'النموذج الأولي (Prototype)';

  @override
  String get prototypeDesc =>
      'يتيح لك نسخ الكائنات الموجودة دون جعل الكود الخاص بك يعتمد على فئاتها.';

  @override
  String get singleton => 'المفرد (Singleton)';

  @override
  String get singletonDesc =>
      'يضمن وجود مثيل واحد (Instance) فقط للفئة، مع توفير نقطة وصول عالمية لهذا المثيل.';

  @override
  String get structuralPatterns => 'الأنماط الهيكلية (Structural Patterns)';

  @override
  String get structuralPatternsDesc =>
      'تشرح هذه الأنماط كيفية تجميع الكائنات والفئات في هياكل أكبر مع الحفاظ على مرونة وكفاءة هذه الهياكل.';

  @override
  String get adapter => 'المحول (Adapter)';

  @override
  String get adapterDesc =>
      'يسمح للكائنات ذات الواجهات غير المتوافقة بالتعاون.';

  @override
  String get bridge => 'الجسر (Bridge)';

  @override
  String get bridgeDesc =>
      'يتيح لك تقسيم فئة كبيرة أو مجموعة من الفئات المرتبطة ارتباطاً وثيقاً إلى تسلسلين هرميين منفصلين - التجريد (Abstraction) والتنفيذ (Implementation) - واللذين يمكن تطويرهما بشكل مستقل عن بعضهما البعض.';

  @override
  String get composite => 'المركب (Composite)';

  @override
  String get compositeDesc =>
      'يتيح لك تكوين الكائنات في هياكل شجرية ثم العمل مع هذه الهياكل كما لو كانت كائنات فردية.';

  @override
  String get decorator => 'المزخرف (Decorator)';

  @override
  String get decoratorDesc =>
      'يتيح لك إرفاق سلوكيات جديدة للكائنات عن طريق وضع هذه الكائنات داخل كائنات مغلفة خاصة تحتوي على السلوكيات.';

  @override
  String get facade => 'الواجهة (Facade)';

  @override
  String get facadeDesc =>
      'يوفر واجهة مبسطة لمكتبة أو إطار عمل أو أي مجموعة معقدة أخرى من الفئات.';

  @override
  String get flyweight => 'خفيف الوزن (Flyweight)';

  @override
  String get flyweightDesc =>
      'يتيح لك استيعاب المزيد من الكائنات في مساحة الذاكرة (RAM) المتاحة من خلال مشاركة الأجزاء المشتركة من الحالة بين كائنات متعددة بدلاً من الاحتفاظ بجميع البيانات في كل كائن.';

  @override
  String get proxy => 'الوكيل (Proxy)';

  @override
  String get proxyDesc =>
      'يتيح لك توفير بديل أو نائب لكائن آخر. يتحكم الوكيل في الوصول إلى الكائن الأصلي، مما يسمح لك بأداء شيء ما إما قبل أو بعد وصول الطلب إلى الكائن الأصلي.';

  @override
  String get behavioralPatterns => 'الأنماط السلوكية (Behavioral Patterns)';

  @override
  String get behavioralPatternsDesc =>
      'تهتم الأنماط السلوكية بالخوارزميات وتعيين المسؤوليات بين الكائنات.';

  @override
  String get chainOfResponsibility =>
      'سلسلة المسؤولية (Chain of Responsibility)';

  @override
  String get chainOfResponsibilityDesc =>
      'يتيح لك تمرير الطلبات على طول سلسلة من المعالجين. عند استلام طلب، يقرر كل معالج إما معالجة الطلب أو تمريره إلى المعالج التالي في السلسلة.';

  @override
  String get command => 'الأمر (Command)';

  @override
  String get commandDesc =>
      'يحول الطلب إلى كائن مستقل يحتوي على جميع المعلومات حول الطلب. يتيح لك هذا التحويل تمرير الطلبات كوسيطات وظيفة، وتأخير أو جدولة تنفيذ الطلب، ودعم العمليات القابلة للتراجع.';

  @override
  String get iterator => 'المكرر (Iterator)';

  @override
  String get iteratorDesc =>
      'يتيح لك التنقل عبر عناصر المجموعة دون الكشف عن تمثيلها الأساسي (قائمة، مكدس، شجرة، إلخ).';

  @override
  String get interpreter => 'المفسر (Interpreter)';

  @override
  String get interpreterDesc =>
      'يُعطى لغة ما، ويحدد تمثيلاً لقواعدها جنباً إلى جنب مع مفسر يستخدم التمثيل لتفسير الجمل في اللغة.';

  @override
  String get mediator => 'الوسيط (Mediator)';

  @override
  String get mediatorDesc =>
      'يتيح لك تقليل التبعيات الفوضوية بين الكائنات. يقيد النمط الاتصالات المباشرة بين الكائنات ويجبرها على التعاون فقط عبر كائن وسيط.';

  @override
  String get memento => 'التذكار (Memento)';

  @override
  String get mementoDesc =>
      'يتيح لك حفظ واستعادة الحالة السابقة للكائن دون الكشف عن تفاصيل تنفيذه.';

  @override
  String get observer => 'المراقب (Observer)';

  @override
  String get observerDesc =>
      'يتيح لك تحديد آلية اشتراك لتنبيه كائنات متعددة بأي أحداث تقع للكائن الذي يراقبونه.';

  @override
  String get state => 'الحالة (State)';

  @override
  String get stateDesc =>
      'يتيح للكائن تغيير سلوكه عندما تتغير حالته الداخلية. يبدو الأمر كما لو أن الكائن قد غير فئته.';

  @override
  String get strategy => 'الاستراتيجية (Strategy)';

  @override
  String get strategyDesc =>
      'يتيح لك تحديد عائلة من الخوارزميات، ووضع كل منها في فئة منفصلة، وجعل كائناتها قابلة للتبديل.';

  @override
  String get templateMethod => 'طريقة القالب (Template Method)';

  @override
  String get templateMethodDesc =>
      'يحدد هيكل الخوارزمية في الفئة العليا ولكنه يترك للفئات الفرعية تجاوز خطوات محددة من الخوارزمية دون تغيير هيكلها.';

  @override
  String get visitor => 'الزائر (Visitor)';

  @override
  String get visitorDesc =>
      'يتيح لك فصل الخوارزميات عن الكائنات التي تعمل عليها.';

  @override
  String get refactoringCategories =>
      'فئات إعادة الهيكلة (Refactoring Categories)';

  @override
  String get composingMethods => 'تكوين الوظائف (Composing Methods)';

  @override
  String get composingMethodsDesc =>
      'يركز جزء كبير من إعادة الهيكلة على تكوين الوظائف بشكل صحيح. في معظم الحالات، تكون الوظائف الطويلة جداً هي أساس المشاكل.';

  @override
  String get movingFeatures => 'نقل الميزات (Moving Features)';

  @override
  String get movingFeaturesDesc =>
      'توضح هذه التقنيات كيفية نقل الوظائف بأمان بين الفئات، وإنشاء فئات جديدة، وإخفاء تفاصيل التنفيذ.';

  @override
  String get organizingData => 'تنظيم البيانات (Organizing Data)';

  @override
  String get organizingDataDesc =>
      'تساعد هذه التقنيات في التعامل مع البيانات، واستبدال القيم الأولية (Primitives) بوظائف فئات غنية.';

  @override
  String get simplifyingConditionals =>
      'تبسيط الشروط (Simplifying Conditionals)';

  @override
  String get simplifyingConditionalsDesc =>
      'تميل الشروط إلى أن تصبح أكثر تعقيداً في المنطق بمرور الوقت، وتساعد هذه التقنيات في مكافحة ذلك.';

  @override
  String get simplifyingMethodCalls =>
      'تبسيط استدعاءات الوظائف (Simplifying Method Calls)';

  @override
  String get simplifyingMethodCallsDesc =>
      'تجعل هذه التقنيات استدعاءات الوظائف أبسط وأسهل في الفهم.';

  @override
  String get generalization => 'التعميم (Generalization)';

  @override
  String get generalizationDesc =>
      'التعميم يتعلق في المقام الأول بنقل الوظائف على طول التسلسل الهرمي لوراثة الفئات.';

  @override
  String get notes => 'ملاحظات';

  @override
  String get details => 'التفاصيل';

  @override
  String get example => 'مثال كود (Dart Example)';

  @override
  String get goodExample => 'مثال جيد (Good)';

  @override
  String get badExample => 'مثال سيء (Bad)';

  @override
  String get seeMore => 'عرض المزيد';

  @override
  String get reference => 'المرجع';

  @override
  String get references => 'المراجع';

  @override
  String get close => 'إغلاق';

  @override
  String get extractMethod => 'استخراج الوظيفة (Extract Method)';

  @override
  String get inlineMethod => 'تضمين الوظيفة (Inline Method)';

  @override
  String get extractVariable => 'استخراج المتغير (Extract Variable)';

  @override
  String get moveMethod => 'نقل الوظيفة (Move Method)';

  @override
  String get moveField => 'نقل الحقل (Move Field)';

  @override
  String get extractClass => 'استخراج الفئة (Extract Class)';

  @override
  String get selfEncapsulateField =>
      'تغليف الحقل ذاتياً (Self Encapsulate Field)';

  @override
  String get replaceDataValueWithObject =>
      'استبدال قيمة البيانات بكائن (Replace Data Value with Object)';

  @override
  String get refactoringTip =>
      'تساعد هذه التقنية في تبسيط هيكل الكود وتحسين إمكانية صيانته.';

  @override
  String get copied => 'تم النسخ إلى الحافظة!';

  @override
  String get singletonNote =>
      'يجب أن تحتوي الأنماط المفردة (Singletons) على منشئ خاص ونقطة وصول ثابتة للمثيل.';

  @override
  String get factoryMethodNote =>
      'تجنب استخدام \'if-else\' لإنشاء الكائنات؛ استخدم الفئات الفرعية لتقرير النوع الخرساني.';

  @override
  String get builderNote =>
      'تحل أنماط البناء مشكلة \'المنشئ المتداخل\' وتوفر كوداً سهل القراءة.';
}
