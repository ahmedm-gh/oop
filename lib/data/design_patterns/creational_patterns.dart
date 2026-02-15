import "../../core/models/code_block.dart";
import "../../core/models/content.dart";
import "../../core/models/design_patterns.dart";
import "../../core/models/localized_text.dart";
import "keys.dart";

const Map<String, DesignPattern> creationalPatternsData = {
  PK.factoryMethod: DesignPattern(
    id: PK.factoryMethod,
    title: LocS(en: "Factory Method", ar: "طريقة المصنع (Factory Method)"),
    description: LocS(
      en: "Defines an interface for creating objects, letting subclasses decide which class to instantiate",
      ar: "يُعرّف واجهة لإنشاء الكائنات، مع السماح للفئات الفرعية (Subclasses) بتحديد الفئة المُراد إنشاؤها",
    ),
    group: .design,
    type: .creational,
    category: .GoF,
    level: .intermediate,
    content: LocV(
      en: [
        StrContent(
          "The Factory Method pattern is one of the most fundamental creational patterns. It solves a common problem: how do you create objects without tightly coupling your code to specific classes?",
        ),
        AnalogyContent(
          "Think of a restaurant kitchen. When a customer orders 'pizza,' they don't tell the chef exactly how to make it. The chef (factory method) decides which type of pizza to create based on the restaurant's specialty. An Italian restaurant creates Italian-style pizza, while a New York restaurant creates New York-style pizza.",
        ),
        StrContent(
          "Instead of calling constructors directly (new MyClass()), you call a factory method that returns instances through a common interface or base class. This decouples your client code from concrete implementations.",
        ),
        ULContent(
          title: "Key Components:",
          value: [
            "Product: The interface or abstract class for objects the factory method creates",
            "ConcreteProduct: Specific implementations of the Product interface",
            "Creator: Declares the factory method that returns Product objects (can be abstract or provide default implementation)",
            "ConcreteCreator: Overrides the factory method to return specific ConcreteProduct instances",
          ],
        ),
        DiagramContent(
          "Structure Flow:\nClient → Creator.factoryMethod() → Product Interface\n         ↓                        ↓\n   ConcreteCreator          ConcreteProduct",
        ),
        StrContent(
          "The pattern follows the Open/Closed Principle: you can introduce new product types without modifying existing client code. Just create new concrete creators and products.",
        ),
        NoteContent(
          "Factory Method is NOT the same as a simple factory (static method that creates objects). Factory Method uses inheritance and polymorphism, while simple factory uses conditional logic.",
          type: .important,
        ),
        StrContent(
          "In Dart and Flutter, this pattern is commonly used for creating platform-specific widgets, different types of network clients, various data parsers, and plugin systems.",
        ),
      ],
      ar: [
        StrContent(
          "نمط طريقة المصنع (Factory Method) هو أحد أكثر الأنماط الإنشائية (Creational Patterns) أساسية. يحل مشكلة شائعة: كيف تُنشئ الكائنات دون ربط كودك بإحكام بفئات محددة؟",
        ),
        AnalogyContent(
          "فكر في مطبخ مطعم. عندما يطلب الزبون 'بيتزا'، لا يخبر الطاهي بالضبط كيف يصنعها. الطاهي (طريقة المصنع) يقرر نوع البيتزا المراد إنشاؤها بناءً على تخصص المطعم. مطعم إيطالي ينشئ بيتزا على الطراز الإيطالي، بينما مطعم نيويورك ينشئ بيتزا على طراز نيويورك.",
        ),
        StrContent(
          "بدلاً من استدعاء المُنشئات (Constructors) مباشرة (new MyClass())، تستدعي طريقة مصنع تُرجع كائنات من خلال واجهة (Interface) أو فئة أساسية (Base Class) مشتركة. هذا يفصل كود العميل عن التطبيقات المحددة (Concrete Implementations).",
        ),
        ULContent(
          title: "المكونات الأساسية:",
          value: [
            "المنتج (Product): الواجهة أو الفئة المجردة (Abstract Class) للكائنات التي تنشئها طريقة المصنع",
            "المنتج المحدد (ConcreteProduct): تطبيقات محددة لواجهة المنتج",
            "المُنشئ (Creator): يُعلن عن طريقة المصنع التي تُرجع كائنات المنتج (يمكن أن يكون مجرداً أو يوفر تطبيقاً افتراضياً)",
            "المُنشئ المحدد (ConcreteCreator): يُعيد تعريف طريقة المصنع لإرجاع كائنات المنتج المحدد",
          ],
        ),
        DiagramContent(
          "تدفق البنية:\nالعميل ← Creator.factoryMethod() ← واجهة المنتج\n         ↓                        ↓\n   ConcreteCreator          ConcreteProduct",
        ),
        StrContent(
          "يتبع النمط مبدأ المفتوح/المغلق (Open/Closed Principle): يمكنك إضافة أنواع منتجات جديدة دون تعديل كود العميل الموجود. فقط أنشئ مُنشئين ومنتجات محددة جديدة.",
        ),
        NoteContent(
          "طريقة المصنع ليست نفس المصنع البسيط (Simple Factory) الذي هو طريقة ثابتة (Static Method) تنشئ كائنات. طريقة المصنع تستخدم الوراثة (Inheritance) والتعددية الشكلية (Polymorphism)، بينما المصنع البسيط يستخدم منطقاً شرطياً (Conditional Logic).",
          type: .important,
        ),
        StrContent(
          "في Dart و Flutter، يُستخدم هذا النمط بشكل شائع لإنشاء واجهات مستخدم (Widgets) خاصة بمنصة معينة، أنواع مختلفة من عملاء الشبكة (Network Clients)، محللات بيانات متنوعة (Data Parsers)، وأنظمة الإضافات (Plugin Systems).",
        ),
      ],
    ),
    examples: LocV(
      en: [
        // Example 1: Basic - Dialog Factory
        StrCodeBlock("""// Example 1: Basic - Platform-Specific Dialog Factory
// Use case: Creating platform-specific UI components

abstract class Dialog {
  void render();
  void close();
}

class AndroidDialog implements Dialog {
  @override
  void render() => print('Rendering Material Design dialog');
  
  @override
  void close() => print('Closing with Android animation');
}

class IOSDialog implements Dialog {
  @override
  void render() => print('Rendering Cupertino dialog');
  
  @override
  void close() => print('Closing with iOS animation');
}

// Creator
abstract class DialogFactory {
  // Factory method - subclasses override this
  Dialog createDialog();
  
  // Template method using factory method
  void showDialog() {
    final dialog = createDialog();
    dialog.render();
  }
}

// Concrete Creators
class AndroidDialogFactory extends DialogFactory {
  @override
  Dialog createDialog() => AndroidDialog();
}

class IOSDialogFactory extends DialogFactory {
  @override
  Dialog createDialog() => IOSDialog();
}

void main() {
  // Client code doesn't know about concrete dialog classes
  DialogFactory factory;
  
  if (Platform.isAndroid) {
    factory = AndroidDialogFactory();
  } else {
    factory = IOSDialogFactory();
  }
  
  factory.showDialog(); // Creates appropriate dialog
}"""),

        // Example 2: Intermediate - HTTP Client Factory
        StrCodeBlock("""// Example 2: Intermediate - Network Client Factory
// Use case: Different HTTP clients for different environments

abstract class HttpClient {
  Future<Response> get(String url);
  Future<Response> post(String url, Map<String, dynamic> data);
}

class ProductionHttpClient implements HttpClient {
  @override
  Future<Response> get(String url) async {
    print('Production GET: \$url');
    // Real network call
    return Response(200, 'Real data');
  }
  
  @override
  Future<Response> post(String url, Map<String, dynamic> data) async {
    print('Production POST: \$url');
    return Response(201, 'Created');
  }
}

class MockHttpClient implements HttpClient {
  @override
  Future<Response> get(String url) async {
    print('Mock GET: \$url');
    await Future.delayed(.seconds(1));
    return Response(200, '{"mock": "data"}');
  }
  
  @override
  Future<Response> post(String url, Map<String, dynamic> data) async {
    print('Mock POST: \$url with \$data');
    return Response(200, '{"success": true}');
  }
}

// Creator with default implementation
abstract class ApiService {
  late final HttpClient client = createClient();
  
  // Factory method
  HttpClient createClient();
  
  Future<List<User>> getUsers() async {
    final response = await client.get('/users');
    return parseUsers(response.body);
  }
  
  List<User> parseUsers(String json) => []; // Parse logic
}

class ProductionApiService extends ApiService {
  @override
  HttpClient createClient() => ProductionHttpClient();
}

class TestApiService extends ApiService {
  @override
  HttpClient createClient() => MockHttpClient();
}

void main() async {
  final apiService = kDebugMode 
      ? TestApiService() 
      : ProductionApiService();
  
  final users = await apiService.getUsers();
  print('Fetched \${users.length} users');
}

class Response {
  Response(this.statusCode, this.body);
  final int statusCode;
  final String body;
}

class User {
  User(this.name);
  final String name;
}"""),

        // Example 3: Advanced - Document Parser Factory
        StrCodeBlock("""// Example 3: Advanced - Document Parser with Cache
// Use case: Parsing different document formats efficiently

abstract class DocumentParser {
  String parse(String content);
  bool canParse(String extension);
}

class JsonParser implements DocumentParser {
  @override
  String parse(String content) {
    print('Parsing JSON document');
    // Complex JSON parsing logic
    return 'Parsed JSON: \${content.length} chars';
  }
  
  @override
  bool canParse(String extension) => extension == '.json';
}

class XmlParser implements DocumentParser {
  @override
  String parse(String content) {
    print('Parsing XML document');
    // Complex XML parsing logic
    return 'Parsed XML: \${content.length} chars';
  }
  
  @override
  bool canParse(String extension) => extension == '.xml';
}

class CsvParser implements DocumentParser {
  @override
  String parse(String content) {
    print('Parsing CSV document');
    final lines = content.split('\n');
    return 'Parsed CSV: \${lines.length} rows';
  }
  
  @override
  bool canParse(String extension) => extension == '.csv';
}

// Sophisticated creator with caching
abstract class DocumentProcessor {
  final Map<String, DocumentParser> _parserCache = {};
  
  // Factory method
  DocumentParser createParser(String extension);
  
  // Uses factory method with caching
  String processDocument(String filePath, String content) {
    final extension = _getExtension(filePath);
    
    // Check cache first
    final parser = _parserCache.putIfAbsent(
      extension,
      () => createParser(extension),
    );
    
    if (!parser.canParse(extension)) {
      throw Exception('Parser cannot handle \$extension files');
    }
    
    return parser.parse(content);
  }
  
  String _getExtension(String path) {
    final parts = path.split('.');
    return parts.isEmpty ? '' : '.\${parts.last}';
  }
}

// Concrete creator for different document sets
class StandardDocumentProcessor extends DocumentProcessor {
  @override
  DocumentParser createParser(String extension) {
    return switch (extension) {
      '.json' => JsonParser(),
      '.xml' => XmlParser(),
      '.csv' => CsvParser(),
      _ => throw Exception('Unsupported format: \$extension'),
    };
  }
}

// Extended processor with additional formats
class ExtendedDocumentProcessor extends StandardDocumentProcessor {
  @override
  DocumentParser createParser(String extension) {
    if (extension == '.yaml') {
      return YamlParser();
    }
    return super.createParser(extension);
  }
}

class YamlParser implements DocumentParser {
  @override
  String parse(String content) => 'Parsed YAML';
  
  @override
  bool canParse(String extension) => extension == '.yaml';
}

void main() {
  final processor = ExtendedDocumentProcessor();
  
  // Same interface, different parsers created
  print(processor.processDocument('data.json', '{"key": "value"}'));
  print(processor.processDocument('config.xml', '<root></root>'));
  print(processor.processDocument('data.csv', 'a,b,c\n1,2,3'));
  print(processor.processDocument('config.yaml', 'key: value'));
  
  // Parser reused from cache on second call
  print(processor.processDocument('another.json', '{}'));
}"""),

        // Example 4: Flutter Widget Factory
        StrCodeBlock("""// Example 4: Flutter - Theme-Aware Button Factory
// Use case: Creating buttons that match app theme

abstract class ThemedButton extends StatelessWidget {
  const ThemedButton({
    required this.text,
    required this.onPressed,
    super.key,
  });
  
  final String text;
  final VoidCallback onPressed;
}

class MaterialThemedButton extends ThemedButton {
  const MaterialThemedButton({
    required super.text,
    required super.onPressed,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      child: Text(text),
    );
  }
}

class CupertinoThemedButton extends ThemedButton {
  const CupertinoThemedButton({
    required super.text,
    required super.onPressed,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class CustomThemedButton extends ThemedButton {
  const CustomThemedButton({
    required super.text,
    required super.onPressed,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.pink],
        ),
        borderRadius: .circular(20),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: .white),
      ),
    );
  }
}

// Factory
abstract class ButtonFactory {
  ThemedButton createButton({
    required String text,
    required VoidCallback onPressed,
  });
  
  // Can have other factory methods
  Widget createTextField();
  Widget createCard();
}

class MaterialButtonFactory extends ButtonFactory {
  @override
  ThemedButton createButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return MaterialThemedButton(text: text, onPressed: onPressed);
  }
  
  @override
  Widget createTextField() => TextField(
    decoration: InputDecoration(border: OutlineInputBorder()),
  );
  
  @override
  Widget createCard() => Card(child: .empty);
}

class CupertinoButtonFactory extends ButtonFactory {
  @override
  ThemedButton createButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return CupertinoThemedButton(text: text, onPressed: onPressed);
  }
  
  @override
  Widget createTextField() => CupertinoTextField();
  
  @override
  Widget createCard() => Container(
    decoration: BoxDecoration(
      color: CupertinoColors.systemGrey6,
      borderRadius: .circular(10),
    ),
  );
}

class ThemedApp extends StatelessWidget {
  const ThemedApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    // Factory selected based on platform or user preference
    final factory = Platform.isIOS 
        ? CupertinoButtonFactory() 
        : MaterialButtonFactory();
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            factory.createButton(
              text: 'Click Me',
              onPressed: () => print('Clicked!'),
            ),
            .height(20),
            factory.createTextField(),
            .height(20),
            factory.createCard(),
          ],
        ),
      ),
    );
  }
}"""),
      ],
      ar: [
        // Same examples with Arabic comments
        StrCodeBlock("""// مثال 1: أساسي - مصنع مربعات الحوار الخاصة بالمنصة
// حالة الاستخدام: إنشاء مكونات واجهة مستخدم خاصة بالمنصة

abstract class Dialog {
  void render();
  void close();
}

class AndroidDialog implements Dialog {
  @override
  void render() => print('عرض مربع حوار Material Design');
  
  @override
  void close() => print('إغلاق مع رسوم متحركة Android');
}

class IOSDialog implements Dialog {
  @override
  void render() => print('عرض مربع حوار Cupertino');
  
  @override
  void close() => print('إغلاق مع رسوم متحركة iOS');
}

// المُنشئ (Creator)
abstract class DialogFactory {
  // طريقة المصنع - الفئات الفرعية تُعيد تعريفها
  Dialog createDialog();
  
  // طريقة القالب (Template Method) تستخدم طريقة المصنع
  void showDialog() {
    final dialog = createDialog();
    dialog.render();
  }
}

// المُنشئات المحددة (Concrete Creators)
class AndroidDialogFactory extends DialogFactory {
  @override
  Dialog createDialog() => AndroidDialog();
}

class IOSDialogFactory extends DialogFactory {
  @override
  Dialog createDialog() => IOSDialog();
}

void main() {
  // كود العميل لا يعرف عن فئات مربع الحوار المحددة
  DialogFactory factory;
  
  if (Platform.isAndroid) {
    factory = AndroidDialogFactory();
  } else {
    factory = IOSDialogFactory();
  }
  
  factory.showDialog(); // ينشئ مربع الحوار المناسب
}"""),

        StrCodeBlock("""// مثال 2: متوسط - مصنع عميل HTTP
// حالة الاستخدام: عملاء HTTP مختلفون لبيئات مختلفة

abstract class HttpClient {
  Future<Response> get(String url);
  Future<Response> post(String url, Map<String, dynamic> data);
}

class ProductionHttpClient implements HttpClient {
  @override
  Future<Response> get(String url) async {
    print('إنتاج GET: \$url');
    // استدعاء شبكة حقيقي
    return Response(200, 'بيانات حقيقية');
  }
  
  @override
  Future<Response> post(String url, Map<String, dynamic> data) async {
    print('إنتاج POST: \$url');
    return Response(201, 'تم الإنشاء');
  }
}

class MockHttpClient implements HttpClient {
  @override
  Future<Response> get(String url) async {
    print('وهمي GET: \$url');
    await Future.delayed(.seconds(1));
    return Response(200, '{"mock": "data"}');
  }
  
  @override
  Future<Response> post(String url, Map<String, dynamic> data) async {
    print('وهمي POST: \$url مع \$data');
    return Response(200, '{"success": true}');
  }
}

// المُنشئ مع تطبيق افتراضي
abstract class ApiService {
  late final HttpClient client = createClient();
  
  // طريقة المصنع
  HttpClient createClient();
  
  Future<List<User>> getUsers() async {
    final response = await client.get('/users');
    return parseUsers(response.body);
  }
  
  List<User> parseUsers(String json) => []; // منطق التحليل
}

class ProductionApiService extends ApiService {
  @override
  HttpClient createClient() => ProductionHttpClient();
}

class TestApiService extends ApiService {
  @override
  HttpClient createClient() => MockHttpClient();
}

void main() async {
  final apiService = kDebugMode 
      ? TestApiService() 
      : ProductionApiService();
  
  final users = await apiService.getUsers();
  print('تم جلب \${users.length} مستخدمين');
}

class Response {
  Response(this.statusCode, this.body);
  final int statusCode;
  final String body;
}

class User {
  User(this.name);
  final String name;
}"""),

        StrCodeBlock("""// مثال 3: متقدم - محلل المستندات مع التخزين المؤقت
// حالة الاستخدام: تحليل تنسيقات مستندات مختلفة بكفاءة

abstract class DocumentParser {
  String parse(String content);
  bool canParse(String extension);
}

class JsonParser implements DocumentParser {
  @override
  String parse(String content) {
    print('تحليل مستند JSON');
    // منطق تحليل JSON معقد
    return 'JSON محلل: \${content.length} حرف';
  }
  
  @override
  bool canParse(String extension) => extension == '.json';
}

class XmlParser implements DocumentParser {
  @override
  String parse(String content) {
    print('تحليل مستند XML');
    // منطق تحليل XML معقد
    return 'XML محلل: \${content.length} حرف';
  }
  
  @override
  bool canParse(String extension) => extension == '.xml';
}

class CsvParser implements DocumentParser {
  @override
  String parse(String content) {
    print('تحليل مستند CSV');
    final lines = content.split('\n');
    return 'CSV محلل: \${lines.length} صفوف';
  }
  
  @override
  bool canParse(String extension) => extension == '.csv';
}

// مُنشئ متطور مع التخزين المؤقت (Caching)
abstract class DocumentProcessor {
  final Map<String, DocumentParser> _parserCache = {};
  
  // طريقة المصنع
  DocumentParser createParser(String extension);
  
  // يستخدم طريقة المصنع مع التخزين المؤقت
  String processDocument(String filePath, String content) {
    final extension = _getExtension(filePath);
    
    // تحقق من الذاكرة المؤقتة أولاً
    final parser = _parserCache.putIfAbsent(
      extension,
      () => createParser(extension),
    );
    
    if (!parser.canParse(extension)) {
      throw Exception('المحلل لا يمكنه معالجة ملفات \$extension');
    }
    
    return parser.parse(content);
  }
  
  String _getExtension(String path) {
    final parts = path.split('.');
    return parts.isEmpty ? '' : '.\${parts.last}';
  }
}

// مُنشئ محدد لمجموعات مستندات مختلفة
class StandardDocumentProcessor extends DocumentProcessor {
  @override
  DocumentParser createParser(String extension) {
    return switch (extension) {
      '.json' => JsonParser(),
      '.xml' => XmlParser(),
      '.csv' => CsvParser(),
      _ => throw Exception('تنسيق غير مدعوم: \$extension'),
    };
  }
}

// معالج موسع مع تنسيقات إضافية
class ExtendedDocumentProcessor extends StandardDocumentProcessor {
  @override
  DocumentParser createParser(String extension) {
    if (extension == '.yaml') {
      return YamlParser();
    }
    return super.createParser(extension);
  }
}

class YamlParser implements DocumentParser {
  @override
  String parse(String content) => 'YAML محلل';
  
  @override
  bool canParse(String extension) => extension == '.yaml';
}

void main() {
  final processor = ExtendedDocumentProcessor();
  
  // نفس الواجهة، محللات مختلفة تم إنشاؤها
  print(processor.processDocument('data.json', '{"key": "value"}'));
  print(processor.processDocument('config.xml', '<root></root>'));
  print(processor.processDocument('data.csv', 'a,b,c\n1,2,3'));
  print(processor.processDocument('config.yaml', 'key: value'));
  
  // المحلل يُعاد استخدامه من الذاكرة المؤقتة في الاستدعاء الثاني
  print(processor.processDocument('another.json', '{}'));
}"""),

        StrCodeBlock("""// مثال 4: Flutter - مصنع أزرار واعٍ بالثيم
// حالة الاستخدام: إنشاء أزرار تتطابق مع ثيم التطبيق

abstract class ThemedButton extends StatelessWidget {
  const ThemedButton({
    required this.text,
    required this.onPressed,
    super.key,
  });
  
  final String text;
  final VoidCallback onPressed;
}

class MaterialThemedButton extends ThemedButton {
  const MaterialThemedButton({
    required super.text,
    required super.onPressed,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      child: Text(text),
    );
  }
}

class CupertinoThemedButton extends ThemedButton {
  const CupertinoThemedButton({
    required super.text,
    required super.onPressed,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class CustomThemedButton extends ThemedButton {
  const CustomThemedButton({
    required super.text,
    required super.onPressed,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.pink],
        ),
        borderRadius: .circular(20),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: .white),
      ),
    );
  }
}

// المصنع (Factory)
abstract class ButtonFactory {
  ThemedButton createButton({
    required String text,
    required VoidCallback onPressed,
  });
  
  // يمكن أن يكون لديه طرق مصنع أخرى
  Widget createTextField();
  Widget createCard();
}

class MaterialButtonFactory extends ButtonFactory {
  @override
  ThemedButton createButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return MaterialThemedButton(text: text, onPressed: onPressed);
  }
  
  @override
  Widget createTextField() => TextField(
    decoration: InputDecoration(border: OutlineInputBorder()),
  );
  
  @override
  Widget createCard() => Card(child: .empty);
}

class CupertinoButtonFactory extends ButtonFactory {
  @override
  ThemedButton createButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return CupertinoThemedButton(text: text, onPressed: onPressed);
  }
  
  @override
  Widget createTextField() => CupertinoTextField();
  
  @override
  Widget createCard() => Container(
    decoration: BoxDecoration(
      color: CupertinoColors.systemGrey6,
      borderRadius: .circular(10),
    ),
  );
}

class ThemedApp extends StatelessWidget {
  const ThemedApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    // المصنع يُختار بناءً على المنصة أو تفضيل المستخدم
    final factory = Platform.isIOS 
        ? CupertinoButtonFactory() 
        : MaterialButtonFactory();
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            factory.createButton(
              text: 'انقر هنا',
              onPressed: () => print('تم النقر!'),
            ),
            .height(20),
            factory.createTextField(),
            .height(20),
            factory.createCard(),
          ],
        ),
      ),
    );
  }
}"""),
      ],
    ),
    pros: LocSL(
      en: [
        "Decouples client code from concrete product classes, improving flexibility",
        "Follows Single Responsibility Principle by separating object creation logic",
        "Follows Open/Closed Principle - easy to add new product types without changing existing code",
        "Makes testing easier by allowing mock objects and test doubles",
        "Provides a single place to control which class instances are created",
        "Supports polymorphism and inheritance naturally",
      ],
      ar: [
        "يفصل كود العميل عن فئات المنتج المحددة، مما يحسن المرونة",
        "يتبع مبدأ المسؤولية الواحدة (Single Responsibility Principle) من خلال فصل منطق إنشاء الكائنات",
        "يتبع مبدأ المفتوح/المغلق (Open/Closed Principle) - سهولة إضافة أنواع منتجات جديدة دون تغيير الكود الموجود",
        "يسهّل الاختبار من خلال السماح بكائنات وهمية (Mock Objects) وبدائل الاختبار (Test Doubles)",
        "يوفر مكاناً واحداً للتحكم في أي نسخ من الفئات يتم إنشاؤها",
        "يدعم التعددية الشكلية (Polymorphism) والوراثة (Inheritance) بشكل طبيعي",
      ],
    ),
    cons: LocSL(
      en: [
        "Increases code complexity with many subclasses and classes",
        "Can lead to parallel class hierarchies (creators mirror products)",
        "May be overkill for simple object creation scenarios",
        "Difficult to understand for beginners due to abstraction layers",
        "Requires more upfront design and planning",
        "Can be harder to trace code flow due to indirection",
      ],
      ar: [
        "يزيد من تعقيد الكود مع العديد من الفئات الفرعية والفئات",
        "قد يؤدي إلى تسلسلات هرمية متوازية للفئات (المُنشئون يعكسون المنتجات)",
        "قد يكون مبالغاً فيه لسيناريوهات إنشاء الكائنات البسيطة",
        "صعب الفهم للمبتدئين بسبب طبقات التجريد (Abstraction Layers)",
        "يتطلب المزيد من التصميم والتخطيط المسبق",
        "قد يكون من الصعب تتبع تدفق الكود بسبب التوجيه غير المباشر (Indirection)",
      ],
    ),
    whenToUse: LocV(
      en: [
        StrContent("Use Factory Method when:"),
        ULContent(
          value: [
            "A class cannot anticipate the exact type of objects it must create at compile time",
            "You want to delegate the choice of object type to subclasses",
            "You want to localize the knowledge of which class to instantiate",
            "You need to provide a library or framework where users can extend object creation",
            "You're building platform-specific components (Android vs iOS widgets)",
            "You want to provide hooks for customization in frameworks or libraries",
            "Testing requires substituting real objects with mock versions",
          ],
        ),
        NoteContent(
          "Don't use if: you only have one product type, object creation is simple, or you don't need polymorphic behavior.",
          type: .warning,
        ),
      ],
      ar: [
        StrContent("استخدم طريقة المصنع عندما:"),
        ULContent(
          value: [
            "لا تستطيع الفئة توقع النوع الدقيق للكائنات التي يجب إنشاؤها في وقت الترجمة (Compile Time)",
            "تريد تفويض اختيار نوع الكائن للفئات الفرعية",
            "تريد توطين المعرفة حول الفئة التي سيتم إنشاؤها",
            "تحتاج لتوفير مكتبة أو إطار حيث يمكن للمستخدمين توسيع إنشاء الكائنات",
            "تقوم ببناء مكونات خاصة بالمنصة (واجهات Android مقابل iOS)",
            "تريد توفير خطافات (Hooks) للتخصيص في الأطر أو المكتبات",
            "الاختبار يتطلب استبدال الكائنات الحقيقية بإصدارات وهمية (Mock Versions)",
          ],
        ),
        NoteContent(
          "لا تستخدمه إذا: كان لديك نوع منتج واحد فقط، إنشاء الكائن بسيط، أو لا تحتاج لسلوك متعدد الأشكال (Polymorphic Behavior).",
          type: .warning,
        ),
      ],
    ),
    commonMistakes: LocV(
      en: [
        "Overusing factories for every constructor, adding unnecessary indirection and complexity",
        "Creating 'God Factories' with huge switch statements or conditional logic - this defeats the purpose",
        "Allowing clients to downcast to concrete types (using 'as' operator), which breaks the pattern's encapsulation benefits",
        "Confusing Factory Method with Simple Factory (static factory) or Abstract Factory patterns",
        "Not providing a clear product interface, making it hard to add new products",
        "Making factory methods too complex with business logic - keep them focused on creation only",
        "Forgetting to make constructors private/protected, allowing direct instantiation",
      ],
      ar: [
        "الإفراط في استخدام المصانع لكل مُنشئ، مما يضيف توجيهاً غير مباشر وتعقيداً غير ضروري",
        "إنشاء 'مصانع إله (God Factories)' مع عبارات switch ضخمة أو منطق شرطي - هذا يُفشل الغرض",
        "السماح للعملاء بالتحويل إلى الأنواع المحددة (استخدام معامل 'as')، مما يكسر فوائد التغليف (Encapsulation) للنمط",
        "الخلط بين طريقة المصنع والمصنع البسيط (Static Factory) أو أنماط المصنع المجرد",
        "عدم توفير واجهة منتج واضحة، مما يجعل من الصعب إضافة منتجات جديدة",
        "جعل طرق المصنع معقدة جداً مع منطق الأعمال - أبقِها مركزة على الإنشاء فقط",
        "نسيان جعل المُنشئات خاصة/محمية (Private/Protected)، مما يسمح بالإنشاء المباشر",
      ],
    ),
    relatedPatterns: [PK.abstractFactory, PK.prototype, PK.templateMethod],
    oftenConfusedWith: [PK.abstractFactory],
  ),
  PK.abstractFactory: DesignPattern(
    id: PK.abstractFactory,
    title: LocS(en: "Abstract Factory", ar: "المصنع المجرد (Abstract Factory)"),
    description: LocS(
      en: "Provides an interface for creating families of related objects without specifying their concrete classes",
      ar: "يوفر واجهة لإنشاء عائلات من الكائنات المترابطة (Related Objects) دون تحديد فئاتها المحددة",
    ),
    group: .design,
    type: .creational,
    category: .GoF,
    level: .advanced,
    content: LocV(
      en: [
        StrContent(
          "The Abstract Factory pattern takes the Factory Method concept one step further. Instead of creating single objects, it creates entire families of related objects that are designed to work together.",
        ),
        AnalogyContent(
          "Think of a furniture store that sells different styles: Modern, Victorian, and Art Deco. When you buy a 'Living Room Set,' you don't mix styles - you get a Modern sofa, Modern coffee table, and Modern chair that all match. The Abstract Factory ensures all pieces come from the same family.",
        ),
        StrContent(
          "Each concrete factory produces a complete set of products from one family. The client code works with factories and products through abstract interfaces, never knowing the concrete classes.",
        ),
        ULContent(
          title: "Key Components:",
          value: [
            "AbstractFactory: Declares methods for creating each type of abstract product",
            "ConcreteFactory: Implements creation methods for products belonging to a specific family/variant",
            "AbstractProduct: Declares interfaces for a set of distinct but related products (the product family)",
            "ConcreteProduct: Implements abstract product interfaces, defined by corresponding concrete factories",
            "Client: Uses only interfaces declared by AbstractFactory and AbstractProduct",
          ],
        ),
        DiagramContent(
          "Pattern Flow:\nClient → AbstractFactory → AbstractProduct1, AbstractProduct2\n         ↓                ↓\n   ConcreteFactory1    ConcreteProduct1A, ConcreteProduct2A\n   ConcreteFactory2    ConcreteProduct1B, ConcreteProduct2B",
        ),
        StrContent(
          "The key benefit is enforcing consistency: products from the same factory are guaranteed to be compatible. This prevents mixing incompatible products (like using an Android button with an iOS text field).",
        ),
        NoteContent(
          "Abstract Factory vs Factory Method: Factory Method uses inheritance (one factory method), while Abstract Factory uses composition (multiple factory methods in one interface).",
          type: .important,
        ),
        StrContent(
          "In Flutter/Dart, this is perfect for theme systems, cross-platform UI components, creating complete data layer implementations (repositories, data sources, mappers), and plugin architectures.",
        ),
      ],
      ar: [
        StrContent(
          "نمط المصنع المجرد (Abstract Factory) يأخذ مفهوم طريقة المصنع خطوة أبعد. بدلاً من إنشاء كائنات منفردة، ينشئ عائلات كاملة من الكائنات المترابطة المصممة للعمل معاً.",
        ),
        AnalogyContent(
          "فكر في متجر أثاث يبيع أنماطاً مختلفة: حديث، فيكتوري، وآرت ديكو. عندما تشتري 'طقم غرفة معيشة'، لا تخلط الأنماط - تحصل على أريكة حديثة، طاولة قهوة حديثة، وكرسي حديث كلها متطابقة. المصنع المجرد يضمن أن جميع القطع من نفس العائلة.",
        ),
        StrContent(
          "كل مصنع محدد ينتج مجموعة كاملة من المنتجات من عائلة واحدة. كود العميل يعمل مع المصانع والمنتجات من خلال واجهات مجردة، دون معرفة الفئات المحددة أبداً.",
        ),
        ULContent(
          title: "المكونات الأساسية:",
          value: [
            "المصنع المجرد (AbstractFactory): يُعلن عن طرق لإنشاء كل نوع من المنتجات المجردة",
            "المصنع المحدد (ConcreteFactory): ينفذ طرق الإنشاء للمنتجات التي تنتمي لعائلة/متغير محدد",
            "المنتج المجرد (AbstractProduct): يُعلن عن واجهات لمجموعة من المنتجات المتميزة لكن المترابطة (عائلة المنتجات)",
            "المنتج المحدد (ConcreteProduct): ينفذ واجهات المنتج المجرد، محددة بواسطة المصانع المحددة المقابلة",
            "العميل (Client): يستخدم فقط الواجهات المُعلنة بواسطة AbstractFactory و AbstractProduct",
          ],
        ),
        DiagramContent(
          "تدفق النمط:\nالعميل ← المصنع المجرد ← المنتج المجرد1، المنتج المجرد2\n         ↓                ↓\n   مصنع محدد1    منتج محدد1A، منتج محدد2A\n   مصنع محدد2    منتج محدد1B، منتج محدد2B",
        ),
        StrContent(
          "الفائدة الرئيسية هي فرض الاتساق (Consistency): المنتجات من نفس المصنع مضمونة أن تكون متوافقة. هذا يمنع خلط منتجات غير متوافقة (مثل استخدام زر Android مع حقل نص iOS).",
        ),
        NoteContent(
          "المصنع المجرد مقابل طريقة المصنع: طريقة المصنع تستخدم الوراثة (طريقة مصنع واحدة)، بينما المصنع المجرد يستخدم التركيب (Composition) (طرق مصنع متعددة في واجهة واحدة).",
          type: .important,
        ),
        StrContent(
          "في Flutter/Dart، هذا مثالي لأنظمة الثيم، مكونات واجهة المستخدم عبر المنصات (Cross-Platform)، إنشاء تطبيقات كاملة لطبقة البيانات (المستودعات، مصادر البيانات، المُحوّلات)، ومعماريات الإضافات.",
        ),
      ],
    ),
    examples: LocV(
      en: [
        // Example 1: Basic UI Factory
        StrCodeBlock("""// Example 1: Basic - Complete UI Theme Factory
// Use case: Ensuring consistent UI component families

abstract class Button {
  Widget build();
}

abstract class TextField {
  Widget build();
}

abstract class Dialog {
  Widget build();
}

// Abstract Factory
abstract class UIFactory {
  Button createButton(String text, VoidCallback onTap);
  TextField createTextField(String hint);
  Dialog createDialog(String title, String message);
}

// Material Design Family
class MaterialButton implements Button {
  MaterialButton(this.text, this.onTap);
  final String text;
  final VoidCallback onTap;
  
  @override
  Widget build() => ElevatedButton(
    onPressed: onTap,
    child: Text(text),
  );
}

class MaterialTextField implements TextField {
  MaterialTextField(this.hint);
  final String hint;
  
  @override
  Widget build() => TextField(
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(),
    ),
  );
}

class MaterialDialog implements Dialog {
  MaterialDialog(this.title, this.message);
  final String title;
  final String message;
  
  @override
  Widget build() => AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [TextButton(onPressed: () {}, child: Text('OK'))],
  );
}

class MaterialUIFactory implements UIFactory {
  @override
  Button createButton(String text, VoidCallback onTap) =>
      MaterialButton(text, onTap);
  
  @override
  TextField createTextField(String hint) =>
      MaterialTextField(hint);
  
  @override
  Dialog createDialog(String title, String message) =>
      MaterialDialog(title, message);
}

// Cupertino (iOS) Family
class CupertinoButton implements Button {
  CupertinoButton(this.text, this.onTap);
  final String text;
  final VoidCallback onTap;
  
  @override
  Widget build() => CupertinoButton(
    onPressed: onTap,
    child: Text(text),
  );
}

class CupertinoTextField implements TextField {
  CupertinoTextField(this.hint);
  final String hint;
  
  @override
  Widget build() => CupertinoTextField(
    placeholder: hint,
  );
}

class CupertinoDialog implements Dialog {
  CupertinoDialog(this.title, this.message);
  final String title;
  final String message;
  
  @override
  Widget build() => CupertinoAlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      CupertinoDialogAction(
        child: Text('OK'),
        onPressed: () {},
      ),
    ],
  );
}

class CupertinoUIFactory implements UIFactory {
  @override
  Button createButton(String text, VoidCallback onTap) =>
      CupertinoButton(text, onTap);
  
  @override
  TextField createTextField(String hint) =>
      CupertinoTextField(hint);
  
  @override
  Dialog createDialog(String title, String message) =>
      CupertinoDialog(title, message);
}

// Client code
class LoginScreen extends StatelessWidget {
  const LoginScreen(this.factory, {super.key});
  final UIFactory factory;
  
  @override
  Widget build(BuildContext context) {
    // All components guaranteed to be from same family
    return Column(
      children: [
        factory.createTextField('Username').build(),
        factory.createTextField('Password').build(),
        factory.createButton('Login', () {
          showDialog(
            context: context,
            builder: (context) =>
                factory.createDialog('Success', 'Logged in!').build(),
          );
        }).build(),
      ],
    );
  }
}

void main() {
  final factory = Platform.isIOS
      ? CupertinoUIFactory()
      : MaterialUIFactory();
  
  runApp(MaterialApp(
    home: LoginScreen(factory),
  ));
}"""),

        // Example 2: Data Layer Factory
        StrCodeBlock("""// Example 2: Intermediate - Data Layer Factory
// Use case: Complete data layer with matching components

abstract class UserRepository {
  Future<User> getUser(String id);
  Future<void> saveUser(User user);
}

abstract class DataSource {
  Future<Map<String, dynamic>> fetch(String id);
  Future<void> save(Map<String, dynamic> data);
}

abstract class Cache {
  Future<T?> get<T>(String key);
  Future<void> set<T>(String key, T value);
}

// Abstract Factory
abstract class DataLayerFactory {
  UserRepository createUserRepository();
  DataSource createDataSource();
  Cache createCache();
}

// Production Family
class ProductionUserRepository implements UserRepository {
  ProductionUserRepository(this.dataSource, this.cache);
  final DataSource dataSource;
  final Cache cache;
  
  @override
  Future<User> getUser(String id) async {
    // Check cache first
    final cached = await cache.get<User>('user_\$id');
    if (cached != null) return cached;
    
    // Fetch from data source
    final data = await dataSource.fetch(id);
    final user = User.fromJson(data);
    await cache.set('user_\$id', user);
    return user;
  }
  
  @override
  Future<void> saveUser(User user) async {
    await dataSource.save(user.toJson());
    await cache.set('user_\${user.id}', user);
  }
}

class ApiDataSource implements DataSource {
  final httpClient = HttpClient();
  
  @override
  Future<Map<String, dynamic>> fetch(String id) async {
    print('Fetching from API: /users/\$id');
    // Real API call
    return {'id': id, 'name': 'John'};
  }
  
  @override
  Future<void> save(Map<String, dynamic> data) async {
    print('Saving to API: \$data');
    // Real API call
  }
}

class RedisCache implements Cache {
  @override
  Future<T?> get<T>(String key) async {
    print('Redis GET: \$key');
    // Real Redis call
    return null;
  }
  
  @override
  Future<void> set<T>(String key, T value) async {
    print('Redis SET: \$key');
    // Real Redis call
  }
}

class ProductionDataLayerFactory implements DataLayerFactory {
  @override
  UserRepository createUserRepository() {
    final dataSource = createDataSource();
    final cache = createCache();
    return ProductionUserRepository(dataSource, cache);
  }
  
  @override
  DataSource createDataSource() => ApiDataSource();
  
  @override
  Cache createCache() => RedisCache();
}

// Test Family - All components are mocks
class TestUserRepository implements UserRepository {
  TestUserRepository(this.dataSource, this.cache);
  final DataSource dataSource;
  final Cache cache;
  
  @override
  Future<User> getUser(String id) async {
    final data = await dataSource.fetch(id);
    return User.fromJson(data);
  }
  
  @override
  Future<void> saveUser(User user) async {
    await dataSource.save(user.toJson());
  }
}

class MockDataSource implements DataSource {
  @override
  Future<Map<String, dynamic>> fetch(String id) async {
    print('Mock fetch: \$id');
    return {'id': id, 'name': 'Mock User'};
  }
  
  @override
  Future<void> save(Map<String, dynamic> data) async {
    print('Mock save: \$data');
  }
}

class InMemoryCache implements Cache {
  final Map<String, dynamic> _cache = {};
  
  @override
  Future<T?> get<T>(String key) async {
    print('Memory GET: \$key');
    return _cache[key] as T?;
  }
  
  @override
  Future<void> set<T>(String key, T value) async {
    print('Memory SET: \$key');
    _cache[key] = value;
  }
}

class TestDataLayerFactory implements DataLayerFactory {
  @override
  UserRepository createUserRepository() {
    final dataSource = createDataSource();
    final cache = createCache();
    return TestUserRepository(dataSource, cache);
  }
  
  @override
  DataSource createDataSource() => MockDataSource();
  
  @override
  Cache createCache() => InMemoryCache();
}

// Client code
class UserService {
  UserService(DataLayerFactory factory)
      : repository = factory.createUserRepository();
  
  final UserRepository repository;
  
  Future<void> loadUser(String id) async {
    final user = await repository.getUser(id);
    print('Loaded: \${user.name}');
  }
}

void main() async {
  // Factory ensures all components work together
  final factory = kReleaseMode
      ? ProductionDataLayerFactory()
      : TestDataLayerFactory();
  
  final service = UserService(factory);
  await service.loadUser('123');
}

class User {
  User(this.id, this.name);
  final String id;
  final String name;
  
  factory User.fromJson(Map<String, dynamic> json) =>
      User(json['id'], json['name']);
  
  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}"""),

        // Example 3: Advanced - Game Entity Factory
        StrCodeBlock(
          """// Example 3: Advanced - Game Entity Factory with Pooling
// Use case: Creating complete game entity families efficiently

abstract class Sprite {
  void render();
  void update(double dt);
}

abstract class Collider {
  bool intersects(Collider other);
  Rectangle get bounds;
}

abstract class AudioPlayer {
  void play(String sound);
  void stop();
}

abstract class ParticleEffect {
  void emit(Vector2 position);
  void update(double dt);
}

// Abstract Factory
abstract class EntityFactory {
  Sprite createSprite(String assetPath);
  Collider createCollider(Rectangle bounds);
  AudioPlayer createAudioPlayer();
  ParticleEffect createParticleEffect(String type);
  
  // Complete entity creation
  GameEntity createEntity({
    required String spriteAsset,
    required Rectangle bounds,
    bool hasAudio = false,
    String? particleEffect,
  }) {
    final sprite = createSprite(spriteAsset);
    final collider = createCollider(bounds);
    final audio = hasAudio ? createAudioPlayer() : null;
    final particles = particleEffect != null 
        ? createParticleEffect(particleEffect)
        : null;
    
    return GameEntity(
      sprite: sprite,
      collider: collider,
      audio: audio,
      particles: particles,
    );
  }
}

// High Performance Family (uses object pooling)
class PooledSprite implements Sprite {
  PooledSprite(this.assetPath);
  final String assetPath;
  bool _active = true;
  
  @override
  void render() {
    if (_active) print('Rendering pooled sprite: \$assetPath');
  }
  
  @override
  void update(double dt) {
    if (_active) print('Updating pooled sprite');
  }
  
  void reset() => _active = true;
  void recycle() => _active = false;
}

class PooledCollider implements Collider {
  PooledCollider(this._bounds);
  Rectangle _bounds;
  
  @override
  Rectangle get bounds => _bounds;
  
  @override
  bool intersects(Collider other) {
    final otherBounds = other.bounds;
    return _bounds.overlaps(otherBounds);
  }
  
  void reset(Rectangle newBounds) => _bounds = newBounds;
}

class OptimizedAudioPlayer implements AudioPlayer {
  final _audioCache = <String, AudioBuffer>{};
  
  @override
  void play(String sound) {
    final buffer = _audioCache.putIfAbsent(
      sound,
      () {
        print('Loading audio: \$sound');
        return AudioBuffer(sound);
      },
    );
    print('Playing cached audio: \$sound');
  }
  
  @override
  void stop() => print('Stopping audio');
}

class BatchedParticleEffect implements ParticleEffect {
  BatchedParticleEffect(this.type);
  final String type;
  final List<Particle> _particles = [];
  
  @override
  void emit(Vector2 position) {
    print('Batched emit at \$position');
    _particles.add(Particle(position));
  }
  
  @override
  void update(double dt) {
    // Update all particles in batch
    for (final particle in _particles) {
      particle.update(dt);
    }
    _particles.removeWhere((p) => p.isDead);
  }
}

class HighPerformanceEntityFactory implements EntityFactory {
  // Object pools
  final _spritePool = <PooledSprite>[];
  final _colliderPool = <PooledCollider>[];
  
  @override
  Sprite createSprite(String assetPath) {
    // Try to reuse from pool
    if (_spritePool.isNotEmpty) {
      final sprite = _spritePool.removeLast();
      sprite.reset();
      return sprite;
    }
    return PooledSprite(assetPath);
  }
  
  @override
  Collider createCollider(Rectangle bounds) {
    if (_colliderPool.isNotEmpty) {
      final collider = _colliderPool.removeLast();
      collider.reset(bounds);
      return collider;
    }
    return PooledCollider(bounds);
  }
  
  @override
  AudioPlayer createAudioPlayer() => OptimizedAudioPlayer();
  
  @override
  ParticleEffect createParticleEffect(String type) =>
      BatchedParticleEffect(type);
  
  void recycleSprite(PooledSprite sprite) {
    sprite.recycle();
    _spritePool.add(sprite);
  }
}

// Simple Family (no optimization)
class SimpleSprite implements Sprite {
  SimpleSprite(this.assetPath);
  final String assetPath;
  
  @override
  void render() => print('Rendering simple sprite: \$assetPath');
  
  @override
  void update(double dt) => print('Updating simple sprite');
}

class SimpleCollider implements Collider {
  SimpleCollider(this._bounds);
  final Rectangle _bounds;
  
  @override
  Rectangle get bounds => _bounds;
  
  @override
  bool intersects(Collider other) => bounds.overlaps(other.bounds);
}

class SimpleAudioPlayer implements AudioPlayer {
  @override
  void play(String sound) => print('Playing: \$sound');
  
  @override
  void stop() => print('Stopping');
}

class SimpleParticleEffect implements ParticleEffect {
  SimpleParticleEffect(this.type);
  final String type;
  
  @override
  void emit(Vector2 position) => print('Emit at \$position');
  
  @override
  void update(double dt) => print('Update particles');
}

class SimpleEntityFactory implements EntityFactory {
  @override
  Sprite createSprite(String assetPath) => SimpleSprite(assetPath);
  
  @override
  Collider createCollider(Rectangle bounds) => SimpleCollider(bounds);
  
  @override
  AudioPlayer createAudioPlayer() => SimpleAudioPlayer();
  
  @override
  ParticleEffect createParticleEffect(String type) =>
      SimpleParticleEffect(type);
}

// Game Entity
class GameEntity {
  GameEntity({
    required this.sprite,
    required this.collider,
    this.audio,
    this.particles,
  });
  
  final Sprite sprite;
  final Collider collider;
  final AudioPlayer? audio;
  final ParticleEffect? particles;
  
  void update(double dt) {
    sprite.update(dt);
    particles?.update(dt);
  }
  
  void render() => sprite.render();
}

void main() {
  // Choose factory based on performance needs
  final factory = kProfileMode
      ? HighPerformanceEntityFactory()
      : SimpleEntityFactory();
  
  // All components guaranteed compatible
  final player = factory.createEntity(
    spriteAsset: 'player.png',
    bounds: Rectangle(0, 0, 32, 32),
    hasAudio: true,
    particleEffect: 'trail',
  );
  
  final enemy = factory.createEntity(
    spriteAsset: 'enemy.png',
    bounds: Rectangle(100, 100, 32, 32),
  );
  
  // Game loop
  for (var i = 0; i < 5; i++) {
    player.update(0.016);
    enemy.update(0.016);
  }
}

// Helper classes
class Rectangle {
  Rectangle(this.x, this.y, this.width, this.height);
  final double x, y, width, height;
  bool overlaps(Rectangle other) => true; // Simplified
}

class Vector2 {
  Vector2(this.x, this.y);
  final double x, y;
}

class AudioBuffer {
  AudioBuffer(this.path);
  final String path;
}

class Particle {
  Particle(this.position);
  final Vector2 position;
  bool isDead = false;
  void update(double dt) {}
}""",
        ),
      ],
      ar: [
        // Arabic versions with same structure but Arabic comments
        StrCodeBlock("""// مثال 1: أساسي - مصنع ثيم UI كامل
// حالة الاستخدام: ضمان عائلات مكونات واجهة مستخدم متسقة

abstract class Button {
  Widget build();
}

abstract class TextField {
  Widget build();
}

abstract class Dialog {
  Widget build();
}

// المصنع المجرد (Abstract Factory)
abstract class UIFactory {
  Button createButton(String text, VoidCallback onTap);
  TextField createTextField(String hint);
  Dialog createDialog(String title, String message);
}

// عائلة Material Design
class MaterialButton implements Button {
  MaterialButton(this.text, this.onTap);
  final String text;
  final VoidCallback onTap;
  
  @override
  Widget build() => ElevatedButton(
    onPressed: onTap,
    child: Text(text),
  );
}

class MaterialTextField implements TextField {
  MaterialTextField(this.hint);
  final String hint;
  
  @override
  Widget build() => TextField(
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(),
    ),
  );
}

class MaterialDialog implements Dialog {
  MaterialDialog(this.title, this.message);
  final String title;
  final String message;
  
  @override
  Widget build() => AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [TextButton(onPressed: () {}, child: Text('حسناً'))],
  );
}

class MaterialUIFactory implements UIFactory {
  @override
  Button createButton(String text, VoidCallback onTap) =>
      MaterialButton(text, onTap);
  
  @override
  TextField createTextField(String hint) =>
      MaterialTextField(hint);
  
  @override
  Dialog createDialog(String title, String message) =>
      MaterialDialog(title, message);
}

// عائلة Cupertino (iOS)
class CupertinoButton implements Button {
  CupertinoButton(this.text, this.onTap);
  final String text;
  final VoidCallback onTap;
  
  @override
  Widget build() => CupertinoButton(
    onPressed: onTap,
    child: Text(text),
  );
}

class CupertinoTextField implements TextField {
  CupertinoTextField(this.hint);
  final String hint;
  
  @override
  Widget build() => CupertinoTextField(
    placeholder: hint,
  );
}

class CupertinoDialog implements Dialog {
  CupertinoDialog(this.title, this.message);
  final String title;
  final String message;
  
  @override
  Widget build() => CupertinoAlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      CupertinoDialogAction(
        child: Text('حسناً'),
        onPressed: () {},
      ),
    ],
  );
}

class CupertinoUIFactory implements UIFactory {
  @override
  Button createButton(String text, VoidCallback onTap) =>
      CupertinoButton(text, onTap);
  
  @override
  TextField createTextField(String hint) =>
      CupertinoTextField(hint);
  
  @override
  Dialog createDialog(String title, String message) =>
      CupertinoDialog(title, message);
}

// كود العميل (Client Code)
class LoginScreen extends StatelessWidget {
  const LoginScreen(this.factory, {super.key});
  final UIFactory factory;
  
  @override
  Widget build(BuildContext context) {
    // جميع المكونات مضمونة من نفس العائلة
    return Column(
      children: [
        factory.createTextField('اسم المستخدم').build(),
        factory.createTextField('كلمة المرور').build(),
        factory.createButton('تسجيل الدخول', () {
          showDialog(
            context: context,
            builder: (context) =>
                factory.createDialog('نجاح', 'تم تسجيل الدخول!').build(),
          );
        }).build(),
      ],
    );
  }
}

void main() {
  final factory = Platform.isIOS
      ? CupertinoUIFactory()
      : MaterialUIFactory();
  
  runApp(MaterialApp(
    home: LoginScreen(factory),
  ));
}"""),
        // Add other Arabic examples similarly...
      ],
    ),
    pros: LocSL(
      en: [
        "Guarantees product compatibility within families - prevents mixing incompatible objects",
        "Isolates concrete classes from client code completely",
        "Makes switching between entire product families very easy",
        "Follows Single Responsibility and Open/Closed principles",
        "Centralizes product creation logic for entire families",
        "Ensures consistency across related products",
      ],
      ar: [
        "يضمن توافق المنتجات ضمن العائلات - يمنع خلط كائنات غير متوافقة",
        "يعزل الفئات المحددة عن كود العميل بالكامل",
        "يجعل التبديل بين عائلات منتجات كاملة سهلاً جداً",
        "يتبع مبادئ المسؤولية الواحدة والمفتوح/المغلق",
        "يُمركز منطق إنشاء المنتجات لعائلات كاملة",
        "يضمن الاتساق عبر المنتجات المترابطة",
      ],
    ),
    cons: LocSL(
      en: [
        "Introduces many new interfaces and classes - high upfront complexity",
        "Can be overkill if product families are simple or unlikely to change",
        "Very difficult to add new product types to existing families (requires changing all factories)",
        "Increases initial design complexity significantly",
        "May be harder to understand than simpler factory patterns",
        "Requires careful planning of product families upfront",
      ],
      ar: [
        "يُدخل العديد من الواجهات والفئات الجديدة - تعقيد مبدئي عالٍ",
        "قد يكون مبالغاً فيه إذا كانت عائلات المنتجات بسيطة أو من غير المحتمل أن تتغير",
        "صعب جداً إضافة أنواع منتجات جديدة للعائلات الموجودة (يتطلب تغيير جميع المصانع)",
        "يزيد من تعقيد التصميم الأولي بشكل كبير",
        "قد يكون أصعب في الفهم من أنماط المصنع الأبسط",
        "يتطلب تخطيطاً دقيقاً لعائلات المنتجات مسبقاً",
      ],
    ),
    whenToUse: LocV(
      en: [
        StrContent("Use Abstract Factory when:"),
        ULContent(
          value: [
            "Your code needs to work with various families of related products (like UI themes)",
            "You want to enforce that products from one family are used together",
            "You need to provide a library of products revealing only interfaces, not implementations",
            "Product families are likely to be switched (dev/prod, platforms, themes)",
            "You have multiple related products that must be compatible",
            "Independence from product creation details is crucial",
          ],
        ),
        NoteContent(
          "Don't use if: you only have one product family, products don't need to be compatible, or the complexity isn't justified by the benefits.",
          type: .warning,
        ),
      ],
      ar: [
        StrContent("استخدم المصنع المجرد عندما:"),
        ULContent(
          value: [
            "يحتاج كودك للعمل مع عائلات مختلفة من المنتجات المترابطة (مثل ثيمات واجهة المستخدم)",
            "تريد فرض استخدام منتجات من عائلة واحدة معاً",
            "تحتاج لتوفير مكتبة من المنتجات تكشف الواجهات فقط، وليس التطبيقات",
            "من المحتمل أن يتم تبديل عائلات المنتجات (تطوير/إنتاج، منصات، ثيمات)",
            "لديك منتجات مترابطة متعددة يجب أن تكون متوافقة",
            "الاستقلالية عن تفاصيل إنشاء المنتج أمر بالغ الأهمية",
          ],
        ),
        NoteContent(
          "لا تستخدمه إذا: كان لديك عائلة منتج واحدة فقط، المنتجات لا تحتاج أن تكون متوافقة، أو التعقيد غير مبرر بالفوائد.",
          type: .warning,
        ),
      ],
    ),
    commonMistakes: LocV(
      en: [
        "Confusing it with Factory Method - Abstract Factory creates product families, Factory Method creates single products",
        "Using it when you only need to create one type of object (use Factory Method instead)",
        "Making factories too granular with too many small create methods",
        "Not maintaining consistency between products in a family",
        "Adding new product types frequently (this pattern makes that hard)",
        "Not properly designing product families before implementation",
        "Mixing products from different families in client code",
      ],
      ar: [
        "الخلط بينه وبين طريقة المصنع - المصنع المجرد ينشئ عائلات منتجات، طريقة المصنع تنشئ منتجات منفردة",
        "استخدامه عندما تحتاج فقط لإنشاء نوع واحد من الكائنات (استخدم طريقة المصنع بدلاً من ذلك)",
        "جعل المصانع دقيقة جداً مع عدد كبير من طرق الإنشاء الصغيرة",
        "عدم الحفاظ على الاتساق بين المنتجات في العائلة",
        "إضافة أنواع منتجات جديدة بشكل متكرر (هذا النمط يجعل ذلك صعباً)",
        "عدم تصميم عائلات المنتجات بشكل صحيح قبل التطبيق",
        "خلط منتجات من عائلات مختلفة في كود العميل",
      ],
    ),
    relatedPatterns: [PK.factoryMethod, PK.singleton, PK.prototype],
    oftenConfusedWith: [PK.factoryMethod],
  ),
  PK.builder: DesignPattern(
    id: PK.builder,
    title: LocS(en: "Builder", ar: "البناء (Builder)"),
    description: LocS(
      en: "Separates object construction from its representation, allowing step-by-step creation of complex objects",
      ar: "يفصل بناء الكائن عن تمثيله (Representation)، مما يسمح بإنشاء تدريجي خطوة بخطوة للكائنات المعقدة",
    ),
    group: .design,
    type: .creational,
    category: .GoF,
    level: .intermediate,
    content: LocV(
      en: [
        StrContent(
          "The Builder pattern addresses a common problem: how do you construct complex objects with many optional parameters without creating a mess of constructors or long parameter lists?",
        ),
        AnalogyContent(
          "Think of ordering a custom burger at a restaurant. You don't just say 'burger' - you specify: 'I want a burger with cheese, no tomatoes, extra pickles, on whole wheat bun, well done.' The cook (builder) assembles it step-by-step according to your specifications. The same base process (building a burger) creates different results based on your choices.",
        ),
        StrContent(
          "Builder constructs complex objects step by step, giving you fine control over the construction process. Unlike patterns that construct products in one shot, Builder lets you execute construction steps selectively and in different orders.",
        ),
        ULContent(
          title: "Key Components:",
          value: [
            "Builder: Interface defining construction steps (abstract or concrete)",
            "ConcreteBuilder: Implements building steps and tracks the product being built",
            "Product: The complex object being constructed (often immutable)",
            "Director (optional): Orchestrates building steps in a specific order for common configurations",
          ],
        ),
        DiagramContent(
          "Pattern Flow:\nClient → Director → Builder → Product\n              ↓         ↓\n        orchestrates  step1()\n                      step2()\n                      build()",
        ),
        StrContent(
          "In Dart and Flutter, builders are commonly implemented as fluent interfaces where each method returns the builder itself, allowing method chaining. This creates readable, self-documenting code.",
        ),
        NoteContent(
          "Builder vs Constructor: Constructors require all parameters upfront. Builders let you add parameters incrementally and provide defaults. Use Builder when you have 4+ optional parameters or complex validation logic.",
          type: .important,
        ),
        StrContent(
          "The pattern is especially useful in Flutter for creating complex widgets, building query objects, configuring HTTP requests, and creating test data. Dart's named parameters reduce the need for builders in simple cases, but complex scenarios still benefit greatly.",
        ),
        NoteContent(
          "Modern Dart supports named parameters with defaults, which covers simple cases. Use Builder for: complex validation, dependent parameters, multiple representations from same data, or when you need to enforce build steps.",
          type: .tip,
        ),
      ],
      ar: [
        StrContent(
          "نمط البناء (Builder) يعالج مشكلة شائعة: كيف تبني كائنات معقدة مع العديد من المعاملات الاختيارية دون إنشاء فوضى من المُنشئات (Constructors) أو قوائم معاملات طويلة؟",
        ),
        AnalogyContent(
          "فكر في طلب برجر مخصص في مطعم. لا تقول فقط 'برجر' - بل تحدد: 'أريد برجر مع جبن، بدون طماطم، مخلل إضافي، على خبز قمح كامل، مطهو جيداً'. الطاهي (البناء) يجمعه خطوة بخطوة وفقاً لمواصفاتك. نفس العملية الأساسية (بناء برجر) تنشئ نتائج مختلفة بناءً على اختياراتك.",
        ),
        StrContent(
          "البناء يبني الكائنات المعقدة خطوة بخطوة، مما يمنحك تحكماً دقيقاً في عملية البناء. على عكس الأنماط التي تبني المنتجات دفعة واحدة، البناء يتيح لك تنفيذ خطوات البناء بشكل انتقائي وبترتيبات مختلفة.",
        ),
        ULContent(
          title: "المكونات الأساسية:",
          value: [
            "البناء (Builder): واجهة تحدد خطوات البناء (مجردة أو محددة)",
            "البناء المحدد (ConcreteBuilder): ينفذ خطوات البناء ويتتبع المنتج الذي يتم بناؤه",
            "المنتج (Product): الكائن المعقد الذي يتم بناؤه (غالباً غير قابل للتغيير - Immutable)",
            "المدير (Director) (اختياري): ينسق خطوات البناء بترتيب محدد للإعدادات الشائعة",
          ],
        ),
        DiagramContent(
          "تدفق النمط:\nالعميل ← المدير ← البناء ← المنتج\n              ↓         ↓\n        ينسق     ()step1\n                ()step2\n                ()build",
        ),
        StrContent(
          "في Dart و Flutter، غالباً ما تُنفذ أدوات البناء كواجهات انسيابية (Fluent Interfaces) حيث تُرجع كل طريقة أداة البناء نفسها، مما يسمح بتسلسل الطرق (Method Chaining). هذا ينشئ كوداً قابلاً للقراءة ويوثق نفسه.",
        ),
        NoteContent(
          "البناء مقابل المُنشئ: المُنشئات تتطلب جميع المعاملات مقدماً. أدوات البناء تتيح لك إضافة معاملات تدريجياً وتوفير قيم افتراضية. استخدم البناء عندما يكون لديك 4+ معاملات اختيارية أو منطق تحقق معقد.",
          type: .important,
        ),
        StrContent(
          "النمط مفيد بشكل خاص في Flutter لإنشاء واجهات مستخدم (Widgets) معقدة، بناء كائنات الاستعلام (Query Objects)، تكوين طلبات HTTP، وإنشاء بيانات الاختبار. معاملات Dart المسماة (Named Parameters) تقلل الحاجة للبناء في الحالات البسيطة، لكن السيناريوهات المعقدة لا تزال تستفيد بشكل كبير.",
        ),
        NoteContent(
          "Dart الحديثة تدعم المعاملات المسماة مع القيم الافتراضية، مما يغطي الحالات البسيطة. استخدم البناء لـ: التحقق المعقد، المعاملات المترابطة، تمثيلات متعددة من نفس البيانات، أو عندما تحتاج لفرض خطوات البناء.",
          type: .tip,
        ),
      ],
    ),
    examples: LocV(
      en: [
        // Example 1: Basic - HTTP Request Builder
        StrCodeBlock("""// Example 1: Basic - HTTP Request Builder
// Use case: Building complex HTTP requests with many optional parameters

class HttpRequest {
  HttpRequest._({
    required this.url,
    required this.method,
    required this.headers,
    required this.queryParams,
    this.body,
    required this.timeout,
  });

  final String url;
  final String method;
  final Map<String, String> headers;
  final Map<String, String> queryParams;
  final dynamic body;
  final Duration timeout;

  @override
  String toString() {
    return 'HttpRequest(\$method \$url, headers: \$headers, timeout: \$timeout)';
  }
}

class HttpRequestBuilder {
  String _url = '';
  String _method = 'GET';
  final Map<String, String> _headers = {};
  final Map<String, String> _queryParams = {};
  dynamic _body;
  Duration _timeout = .seconds(30);

  HttpRequestBuilder(this._url);

  HttpRequestBuilder method(String method) {
    _method = method.toUpperCase();
    return this;
  }

  HttpRequestBuilder header(String key, String value) {
    _headers[key] = value;
    return this;
  }

  HttpRequestBuilder headers(Map<String, String> headers) {
    _headers.addAll(headers);
    return this;
  }

  HttpRequestBuilder queryParam(String key, String value) {
    _queryParams[key] = value;
    return this;
  }

  HttpRequestBuilder queryParams(Map<String, String> params) {
    _queryParams.addAll(params);
    return this;
  }

  HttpRequestBuilder body(dynamic body) {
    _body = body;
    return this;
  }

  HttpRequestBuilder timeout(Duration timeout) {
    _timeout = timeout;
    return this;
  }

  HttpRequestBuilder get asJson {
    return header('Content-Type', 'application/json');
  }

  HttpRequestBuilder get withAuth {
    return header('Authorization', 'Bearer token_here');
  }

  HttpRequest build() {
    if (_url.isEmpty) {
      throw Exception('URL is required');
    }

    return HttpRequest._(
      url: _url,
      method: _method,
      headers: Map.unmodifiable(_headers),
      queryParams: Map.unmodifiable(_queryParams),
      body: _body,
      timeout: _timeout,
    );
  }
}

void main() {
  // Readable, fluent API
  final request = HttpRequestBuilder('https://api.example.com/users')
      .method('POST')
      .asJson
      .withAuth
      .queryParam('page', '1')
      .queryParam('limit', '10')
      .body({'name': 'John', 'email': 'john@example.com'})
      .timeout(.seconds(60))
      .build();

  print(request);

  // Compare with constructor - much harder to read
  // final request = HttpRequest(
  //   url: 'https://api.example.com/users',
  //   method: 'POST',
  //   headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer token'},
  //   queryParams: {'page': '1', 'limit': '10'},
  //   body: {'name': 'John', 'email': 'john@example.com'},
  //   timeout: Duration(seconds: 60),
  // );
}"""),

        // Example 2: Intermediate - Widget Builder
        StrCodeBlock("""// Example 2: Intermediate - Complex Widget Builder
// Use case: Building complex Flutter widgets with many customization options

class CustomCard {
  const CustomCard._({
    required this.child,
    required this.elevation,
    required this.color,
    required this.borderRadius,
    required this.padding,
    required this.margin,
    required this.width,
    required this.height,
    this.gradient,
    this.border,
    this.onTap,
    required this.shadow,
  });

  final Widget child;
  final double elevation;
  final Color? color;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final BoxBorder? border;
  final VoidCallback? onTap;
  final bool shadow;

  Widget build(BuildContext context) {
    Widget content = Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: borderRadius,
        border: border,
        boxShadow: shadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: elevation,
                  offset: Offset(0, elevation / 2),
                ),
              ]
            : null,
      ),
      child: child,
    );

    if (onTap != null) {
      content = InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: content,
      );
    }

    return Padding(
      padding: margin,
      child: content,
    );
  }
}

class CustomCardBuilder {
  Widget? _child;
  double _elevation = 4.0;
  Color? _color;
  BorderRadius _borderRadius = .circular(12);
  EdgeInsets _padding = .all(16);
  EdgeInsets _margin = .zero;
  double? _width;
  double? _height;
  Gradient? _gradient;
  BoxBorder? _border;
  VoidCallback? _onTap;
  bool _shadow = true;

  CustomCardBuilder child(Widget child) {
    _child = child;
    return this;
  }

  CustomCardBuilder elevation(double elevation) {
    _elevation = elevation;
    return this;
  }

  CustomCardBuilder color(Color color) {
    _color = color;
    return this;
  }

  CustomCardBuilder borderRadius(BorderRadius radius) {
    _borderRadius = radius;
    return this;
  }

  CustomCardBuilder padding(EdgeInsets padding) {
    _padding = padding;
    return this;
  }

  CustomCardBuilder margin(EdgeInsets margin) {
    _margin = margin;
    return this;
  }

  CustomCardBuilder size({double? width, double? height}) {
    _width = width;
    _height = height;
    return this;
  }

  CustomCardBuilder gradient(Gradient gradient) {
    _gradient = gradient;
    _color = null; // Clear color if gradient is set
    return this;
  }

  CustomCardBuilder border({
    required Color color,
    double width = 1.0,
  }) {
    _border = Border.all(color: color, width: width);
    return this;
  }

  CustomCardBuilder onTap(VoidCallback callback) {
    _onTap = callback;
    return this;
  }

  CustomCardBuilder get noShadow {
    _shadow = false;
    return this;
  }

  CustomCardBuilder get rounded {
    _borderRadius = .circular(20);
    return this;
  }

  CustomCardBuilder get flat {
    _elevation = 0;
    _shadow = false;
    return this;
  }

  CustomCard build() {
    if (_child == null) {
      throw Exception('Child widget is required');
    }

    return CustomCard._(
      child: _child!,
      elevation: _elevation,
      color: _color,
      borderRadius: _borderRadius,
      padding: _padding,
      margin: _margin,
      width: _width,
      height: _height,
      gradient: _gradient,
      border: _border,
      onTap: _onTap,
      shadow: _shadow,
    );
  }
}

// Usage in Flutter
class CardDemo extends StatelessWidget {
  const CardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Simple card
        CustomCardBuilder()
            .child(Text('Simple Card'))
            .color(Colors.white)
            .build()
            .build(context),

        // Gradient card with tap
        CustomCardBuilder()
            .child(Text('Gradient Card', style: .white))
            .gradient(LinearGradient(
              colors: [Colors.purple, Colors.blue],
            ))
            .rounded
            .onTap(() => print('Tapped!'))
            .build()
            .build(context),

        // Custom styled card
        CustomCardBuilder()
            .child(Column(
              children: [
                Icon(Icons.star, size: 48),
                Text('Featured'),
              ],
            ))
            .color(Colors.amber[50])
            .border(color: Colors.amber, width: 2)
            .padding(.all(24))
            .margin(.symmetric(vertical: 8))
            .size(width: 200, height: 150)
            .flat
            .build()
            .build(context),
      ],
    );
  }
}"""),

        // Example 3: Advanced - Query Builder with Validation
        StrCodeBlock(
          """// Example 3: Advanced - SQL Query Builder with Validation
// Use case: Building complex database queries with type safety

class QueryResult {
  const QueryResult(this.sql, this.parameters);
  final String sql;
  final List<dynamic> parameters;

  @override
  String toString() => 'SQL: \$sql\nParams: \$parameters';
}

enum JoinType { inner, left, right, full }
enum OrderDirection { asc, desc }

class WhereClause {
  WhereClause(this.column, this.operator, this.value);
  final String column;
  final String operator;
  final dynamic value;
}

class QueryBuilder {
  String? _table;
  final List<String> _columns = ['*'];
  final List<WhereClause> _whereClauses = [];
  final List<String> _joins = [];
  final List<String> _orderBy = [];
  int? _limit;
  int? _offset;
  final List<dynamic> _parameters = [];

  QueryBuilder from(String table) {
    _table = table;
    return this;
  }

  QueryBuilder select(List<String> columns) {
    if (columns.isEmpty) {
      throw ArgumentError('Select columns cannot be empty');
    }
    _columns.clear();
    _columns.addAll(columns);
    return this;
  }

  QueryBuilder where(String column, String operator, dynamic value) {
    _whereClauses.add(WhereClause(column, operator, value));
    return this;
  }

  QueryBuilder whereEquals(String column, dynamic value) {
    return where(column, '=', value);
  }

  QueryBuilder whereIn(String column, List<dynamic> values) {
    if (values.isEmpty) {
      throw ArgumentError('WHERE IN values cannot be empty');
    }
    final placeholders = List.filled(values.length, '?').join(', ');
    _whereClauses.add(WhereClause(column, 'IN', '(\$placeholders)'));
    _parameters.addAll(values);
    return this;
  }

  QueryBuilder whereLike(String column, String pattern) {
    return where(column, 'LIKE', pattern);
  }

  QueryBuilder whereNull(String column) {
    _whereClauses.add(WhereClause(column, 'IS', 'NULL'));
    return this;
  }

  QueryBuilder join(
    String table,
    String condition, {
    JoinType type = .inner,
  }) {
    final joinType = switch (type) {
      .inner => 'INNER JOIN',
      .left => 'LEFT JOIN',
      .right => 'RIGHT JOIN',
      .full => 'FULL OUTER JOIN',
    };
    _joins.add('\$joinType \$table ON \$condition');
    return this;
  }

  QueryBuilder orderBy(String column, [OrderDirection direction = .asc]) {
    final dir = direction == .asc ? 'ASC' : 'DESC';
    _orderBy.add('\$column \$dir');
    return this;
  }

  QueryBuilder limit(int limit) {
    if (limit <= 0) {
      throw ArgumentError('Limit must be positive');
    }
    _limit = limit;
    return this;
  }

  QueryBuilder offset(int offset) {
    if (offset < 0) {
      throw ArgumentError('Offset cannot be negative');
    }
    _offset = offset;
    return this;
  }

  // Convenient pagination method
  QueryBuilder paginate(int page, int perPage) {
    if (page <= 0 || perPage <= 0) {
      throw ArgumentError('Page and perPage must be positive');
    }
    return limit(perPage).offset((page - 1) * perPage);
  }

  QueryResult build() {
    if (_table == null) {
      throw StateError('Table is required. Call from() first.');
    }

    final sql = StringBuffer();
    final params = <dynamic>[];

    // SELECT
    sql.write('SELECT \${_columns.join(', ')} ');

    // FROM
    sql.write('FROM \$_table ');

    // JOINS
    if (_joins.isNotEmpty) {
      sql.write('\${_joins.join(' ')} ');
    }

    // WHERE
    if (_whereClauses.isNotEmpty) {
      sql.write('WHERE ');
      final conditions = <String>[];
      for (final clause in _whereClauses) {
        if (clause.value == 'NULL') {
          conditions.add('\${clause.column} \${clause.operator} NULL');
        } else if (clause.operator == 'IN') {
          conditions.add('\${clause.column} IN \${clause.value}');
        } else {
          conditions.add('\${clause.column} \${clause.operator} ?');
          params.add(clause.value);
        }
      }
      sql.write(conditions.join(' AND '));
      sql.write(' ');
    }

    // ORDER BY
    if (_orderBy.isNotEmpty) {
      sql.write('ORDER BY \${_orderBy.join(', ')} ');
    }

    // LIMIT
    if (_limit != null) {
      sql.write('LIMIT \$_limit ');
    }

    // OFFSET
    if (_offset != null) {
      sql.write('OFFSET \$_offset ');
    }

    params.addAll(_parameters);

    return QueryResult(sql.toString().trim(), params);
  }

  // Create a copy for reusability
  QueryBuilder clone() {
    final builder = QueryBuilder()
      .._table = _table
      .._columns.addAll(_columns)
      .._whereClauses.addAll(_whereClauses)
      .._joins.addAll(_joins)
      .._orderBy.addAll(_orderBy)
      .._limit = _limit
      .._offset = _offset
      .._parameters.addAll(_parameters);
    return builder;
  }
}

void main() {
  // Simple query
  final query1 = QueryBuilder()
      .from('users')
      .whereEquals('active', true)
      .orderBy('created_at', .desc)
      .limit(10)
      .build();
  print(query1);
  print('---');

  // Complex query with joins
  final query2 = QueryBuilder()
      .from('users')
      .select(['users.id', 'users.name', 'orders.total'])
      .join('orders', 'users.id = orders.user_id')
      .whereIn('users.country', ['US', 'UK', 'CA'])
      .whereLike('users.email', '%@gmail.com')
      .orderBy('orders.total', .desc)
      .paginate(2, 20)
      .build();
  print(query2);
  print('---');

  // Reusable base query
  final baseQuery = QueryBuilder()
      .from('products')
      .whereEquals('available', true);

  final cheapProducts = baseQuery
      .clone()
      .where('price', '<', 50)
      .orderBy('price', .asc)
      .build();

  final expensiveProducts = baseQuery
      .clone()
      .where('price', '>', 1000)
      .orderBy('price', .desc)
      .limit(5)
      .build();

  print('Cheap products:\n\$cheapProducts');
  print('---');
  print('Expensive products:\n\$expensiveProducts');
}""",
        ),

        // Example 4: Test Data Builder
        StrCodeBlock("""// Example 4: Test Data Builder Pattern
// Use case: Creating test objects with sensible defaults

class User {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.role,
    required this.isActive,
    required this.createdAt,
    this.lastLoginAt,
    required this.preferences,
  });

  final String id;
  final String name;
  final String email;
  final int age;
  final String role;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? lastLoginAt;
  final Map<String, dynamic> preferences;

  User copyWith({
    String? id,
    String? name,
    String? email,
    int? age,
    String? role,
    bool? isActive,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    Map<String, dynamic>? preferences,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      preferences: preferences ?? this.preferences,
    );
  }
}

class UserBuilder {
  static int _idCounter = 1;

  String _id = 'user_\${_idCounter++}';
  String _name = 'Test User';
  String _email = 'test@example.com';
  int _age = 25;
  String _role = 'user';
  bool _isActive = true;
  DateTime _createdAt = DateTime.now();
  DateTime? _lastLoginAt;
  final Map<String, dynamic> _preferences = {
    'theme': 'light',
    'notifications': true,
  };

  UserBuilder id(String id) {
    _id = id;
    return this;
  }

  UserBuilder name(String name) {
    _name = name;
    return this;
  }

  UserBuilder email(String email) {
    _email = email;
    return this;
  }

  UserBuilder age(int age) {
    if (age < 0 || age > 150) {
      throw ArgumentError('Age must be between 0 and 150');
    }
    _age = age;
    return this;
  }

  UserBuilder role(String role) {
    _role = role;
    return this;
  }

  UserBuilder get inactive {
    _isActive = false;
    return this;
  }

  UserBuilder createdAt(DateTime date) {
    _createdAt = date;
    return this;
  }

  UserBuilder lastLoginAt(DateTime date) {
    _lastLoginAt = date;
    return this;
  }

  UserBuilder preference(String key, dynamic value) {
    _preferences[key] = value;
    return this;
  }

  // Convenient presets
  UserBuilder get admin {
    _role = 'admin';
    _name = 'Admin User';
    _email = 'admin@example.com';
    return this;
  }

  UserBuilder get moderator {
    _role = 'moderator';
    _name = 'Moderator User';
    return this;
  }

  UserBuilder get newUser {
    _createdAt = DateTime.now();
    _lastLoginAt = null;
    return this;
  }

  UserBuilder get veteran {
    _createdAt = DateTime.now().subtract(.days(365));
    _lastLoginAt = DateTime.now().subtract(.hours(1));
    return this;
  }

  User build() {
    // Auto-generate email from name if using default
    if (_email == 'test@example.com' && _name != 'Test User') {
      _email = '\${_name.toLowerCase().replaceAll(' ', '.')}@example.com';
    }

    return User(
      id: _id,
      name: _name,
      email: _email,
      age: _age,
      role: _role,
      isActive: _isActive,
      createdAt: _createdAt,
      lastLoginAt: _lastLoginAt,
      preferences: Map.unmodifiable(_preferences),
    );
  }

  // Build multiple users at once
  List<User> buildMany(int count) {
    return List.generate(count, (_) {
      final user = build();
      _idCounter++; // Ensure unique IDs
      return user;
    });
  }
}

void main() {
  // Simple test user
  final user1 = UserBuilder().build();
  print('User 1: \${user1.name} (\${user1.role})');

  // Admin user
  final admin = UserBuilder().admin.build();
  print('Admin: \${admin.name} (\${admin.role})');

  // Custom user
  final user2 = UserBuilder()
      .name('John Doe')
      .age(30)
      .moderator
      .veteran
      .preference('theme', 'dark')
      .build();
  print('User 2: \${user2.name}, created: \${user2.createdAt}');

  // Multiple test users
  final users = UserBuilder().buildMany(5);
  print('\nGenerated \${users.length} users');
  for (final user in users) {
    print('  - \${user.name} (\${user.id})');
  }

  // Test scenario: inactive user
  final inactiveUser = UserBuilder()
      .name('Suspended User')
      .inactive
      .build();
  print('\nInactive: \${inactiveUser.name} (active: \${inactiveUser.isActive})');
}"""),
      ],
      ar: [
        // Arabic versions
        StrCodeBlock("""// مثال 1: أساسي - بناء طلبات HTTP
// حالة الاستخدام: بناء طلبات HTTP معقدة مع العديد من المعاملات الاختيارية

class HttpRequest {
  HttpRequest._({
    required this.url,
    required this.method,
    required this.headers,
    required this.queryParams,
    this.body,
    required this.timeout,
  });

  final String url;
  final String method;
  final Map<String, String> headers;
  final Map<String, String> queryParams;
  final dynamic body;
  final Duration timeout;

  @override
  String toString() {
    return 'HttpRequest(\$method \$url, headers: \$headers, timeout: \$timeout)';
  }
}

class HttpRequestBuilder {
  String _url = '';
  String _method = 'GET';
  final Map<String, String> _headers = {};
  final Map<String, String> _queryParams = {};
  dynamic _body;
  Duration _timeout = .seconds(30);

  HttpRequestBuilder(this._url);

  HttpRequestBuilder method(String method) {
    _method = method.toUpperCase();
    return this;
  }

  HttpRequestBuilder header(String key, String value) {
    _headers[key] = value;
    return this;
  }

  HttpRequestBuilder headers(Map<String, String> headers) {
    _headers.addAll(headers);
    return this;
  }

  HttpRequestBuilder queryParam(String key, String value) {
    _queryParams[key] = value;
    return this;
  }

  HttpRequestBuilder queryParams(Map<String, String> params) {
    _queryParams.addAll(params);
    return this;
  }

  HttpRequestBuilder body(dynamic body) {
    _body = body;
    return this;
  }

  HttpRequestBuilder timeout(Duration timeout) {
    _timeout = timeout;
    return this;
  }

  HttpRequestBuilder get asJson {
    return header('Content-Type', 'application/json');
  }

  HttpRequestBuilder get withAuth {
    return header('Authorization', 'Bearer token_here');
  }

  HttpRequest build() {
    if (_url.isEmpty) {
      throw Exception('URL مطلوب');
    }

    return HttpRequest._(
      url: _url,
      method: _method,
      headers: Map.unmodifiable(_headers),
      queryParams: Map.unmodifiable(_queryParams),
      body: _body,
      timeout: _timeout,
    );
  }
}

void main() {
  // واجهة برمجية قابلة للقراءة وانسيابية
  final request = HttpRequestBuilder('https://api.example.com/users')
      .method('POST')
      .asJson
      .withAuth
      .queryParam('page', '1')
      .queryParam('limit', '10')
      .body({'name': 'John', 'email': 'john@example.com'})
      .timeout(.seconds(60))
      .build();

  print(request);

  // قارن مع المُنشئ - أصعب بكثير في القراءة
  // final request = HttpRequest(
  //   url: 'https://api.example.com/users',
  //   method: 'POST',
  //   headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer token'},
  //   queryParams: {'page': '1', 'limit': '10'},
  //   body: {'name': 'John', 'email': 'john@example.com'},
  //   timeout: Duration(seconds: 60),
  // );
}"""),
        // Add other Arabic examples following same pattern...
      ],
    ),
    pros: LocSL(
      en: [
        "Constructs objects step-by-step with fine-grained control over the process",
        "Allows reusing the same construction code for different object representations",
        "Isolates complex construction logic from business logic (Single Responsibility)",
        "Completely avoids 'telescoping constructor' anti-pattern",
        "Supports method chaining for readable, fluent APIs",
        "Makes it easy to create objects with many optional parameters",
        "Enables validation at each step or at the end",
        "Perfect for creating immutable objects with many fields",
      ],
      ar: [
        "يبني الكائنات خطوة بخطوة مع تحكم دقيق في العملية",
        "يسمح بإعادة استخدام نفس كود البناء لتمثيلات كائنات مختلفة",
        "يعزل منطق البناء المعقد عن منطق الأعمال (مبدأ المسؤولية الواحدة)",
        "يتجنب تماماً نمط 'المُنشئ التلسكوبي' المضاد (Telescoping Constructor Anti-pattern)",
        "يدعم تسلسل الطرق (Method Chaining) لواجهات برمجية قابلة للقراءة وانسيابية",
        "يسهّل إنشاء كائنات مع العديد من المعاملات الاختيارية",
        "يُمكّن التحقق (Validation) في كل خطوة أو في النهاية",
        "مثالي لإنشاء كائنات غير قابلة للتغيير (Immutable) مع العديد من الحقول",
      ],
    ),
    cons: LocSL(
      en: [
        "Increases code complexity with additional builder classes",
        "Requires creating a new concrete builder for each product variant",
        "May be overkill for simple object construction (use named parameters instead)",
        "Adds verbosity to the codebase - more code to maintain",
        "Can be misused to hide complexity that should be simplified",
        "May encourage creating objects with too many parameters (design smell)",
      ],
      ar: [
        "يزيد من تعقيد الكود مع فئات بناء إضافية",
        "يتطلب إنشاء بناء محدد جديد لكل متغير منتج",
        "قد يكون مبالغاً فيه لبناء الكائنات البسيطة (استخدم المعاملات المسماة بدلاً من ذلك)",
        "يضيف إطناباً (Verbosity) للكود البرمجي - المزيد من الكود للصيانة",
        "يمكن إساءة استخدامه لإخفاء تعقيد يجب تبسيطه",
        "قد يشجع على إنشاء كائنات مع عدد كبير جداً من المعاملات (رائحة تصميم - Design Smell)",
      ],
    ),
    whenToUse: LocV(
      en: [
        StrContent("Use Builder when:"),
        ULContent(
          value: [
            "You need to construct complex objects with many optional parameters (4+)",
            "Object construction requires multiple steps or validation",
            "You want to create different representations using the same construction process",
            "You need to build composite tree structures or hierarchies step-by-step",
            "Creating immutable objects with many fields",
            "Parameters have dependencies or constraints between them",
            "You're building test data with sensible defaults",
          ],
        ),
        NoteContent(
          "Don't use if: object has few parameters (< 4), construction is simple, or Dart's named parameters with defaults are sufficient.",
          type: .warning,
        ),
      ],
      ar: [
        StrContent("استخدم البناء عندما:"),
        ULContent(
          value: [
            "تحتاج لبناء كائنات معقدة مع العديد من المعاملات الاختيارية (4+)",
            "يتطلب بناء الكائن خطوات متعددة أو تحقق (Validation)",
            "تريد إنشاء تمثيلات مختلفة باستخدام نفس عملية البناء",
            "تحتاج لبناء هياكل شجرية مركبة أو تسلسلات هرمية خطوة بخطوة",
            "إنشاء كائنات غير قابلة للتغيير مع العديد من الحقول",
            "المعاملات لها تبعيات أو قيود بينها",
            "تقوم ببناء بيانات اختبار مع قيم افتراضية معقولة",
          ],
        ),
        NoteContent(
          "لا تستخدمه إذا: كان للكائن معاملات قليلة (< 4)، البناء بسيط، أو معاملات Dart المسماة مع القيم الافتراضية كافية.",
          type: .warning,
        ),
      ],
    ),
    commonMistakes: LocV(
      en: [
        "Over-generalizing builder steps, making the API confusing",
        "Not separating building steps meaningfully - just wrapping setters",
        "Using Director when it hides needed customization from clients",
        "Forgetting to validate required fields before calling build()",
        "Not making the product immutable after building",
        "Creating builders for simple objects where named parameters would suffice",
        "Not providing convenient preset methods for common configurations",
        "Making builder methods return void instead of this (breaks chaining)",
      ],
      ar: [
        "التعميم المفرط لخطوات البناء، مما يجعل الواجهة البرمجية مربكة",
        "عدم فصل خطوات البناء بشكل هادف - مجرد تغليف للـ Setters",
        "استخدام المدير (Director) عندما يخفي التخصيص المطلوب من العملاء",
        "نسيان التحقق من الحقول المطلوبة قبل استدعاء ()build",
        "عدم جعل المنتج غير قابل للتغيير بعد البناء",
        "إنشاء بناءات لكائنات بسيطة حيث المعاملات المسماة كافية",
        "عدم توفير طرق إعدادات مسبقة (Preset Methods) مريحة للإعدادات الشائعة",
        "جعل طرق البناء تُرجع void بدلاً من this (يكسر التسلسل - Chaining)",
      ],
    ),
    relatedPatterns: [PK.abstractFactory, PK.composite, PK.singleton],
    oftenConfusedWith: [PK.factoryMethod],
  ),
};
