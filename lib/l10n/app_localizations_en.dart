// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'OOP Mastery';

  @override
  String get home => 'Home';

  @override
  String get designPatterns => 'Design Patterns';

  @override
  String get refactoring => 'Refactoring';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get language => 'Language';

  @override
  String get creationalPatterns => 'Creational Patterns';

  @override
  String get creationalPatternsDesc =>
      'Creational patterns abstract the instantiation process. They help make a system independent of how its objects are created, composed, and represented.';

  @override
  String get factoryMethod => 'Factory Method';

  @override
  String get factoryMethodDesc =>
      'Provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created.';

  @override
  String get abstractFactory => 'Abstract Factory';

  @override
  String get abstractFactoryDesc =>
      'Lets you produce families of related objects without specifying their concrete classes.';

  @override
  String get builder => 'Builder';

  @override
  String get builderDesc =>
      'Lets you construct complex objects step by step. The pattern allows you to produce different types and representations of an object using the same construction code.';

  @override
  String get prototype => 'Prototype';

  @override
  String get prototypeDesc =>
      'Lets you copy existing objects without making your code dependent on their classes.';

  @override
  String get singleton => 'Singleton';

  @override
  String get singletonDesc =>
      'Ensures that a class has only one instance, while providing a global access point to this instance.';

  @override
  String get structuralPatterns => 'Structural Patterns';

  @override
  String get structuralPatternsDesc =>
      'These patterns explain how to assemble objects and classes into larger structures while keeping these structures flexible and efficient.';

  @override
  String get adapter => 'Adapter';

  @override
  String get adapterDesc =>
      'Allows objects with incompatible interfaces to collaborate.';

  @override
  String get bridge => 'Bridge';

  @override
  String get bridgeDesc =>
      'Lets you split a large class or a set of closely related classes into two separate hierarchies—abstraction and implementation—which can be developed independently of each other.';

  @override
  String get composite => 'Composite';

  @override
  String get compositeDesc =>
      'Lets you compose objects into tree structures and then work with these structures as if they were individual objects.';

  @override
  String get decorator => 'Decorator';

  @override
  String get decoratorDesc =>
      'Lets you attach new behaviors to objects by placing these objects inside special wrapper objects that contain the behaviors.';

  @override
  String get facade => 'Facade';

  @override
  String get facadeDesc =>
      'Provides a simplified interface to a library, a framework, or any other complex set of classes.';

  @override
  String get flyweight => 'Flyweight';

  @override
  String get flyweightDesc =>
      'Lets you fit more objects into the available amount of RAM by sharing common parts of state between multiple objects instead of keeping all of the data in each object.';

  @override
  String get proxy => 'Proxy';

  @override
  String get proxyDesc =>
      'Lets you provide a substitute or placeholder for another object. A proxy controls access to the original object, allowing you to perform something either before or after the request gets through to the original object.';

  @override
  String get behavioralPatterns => 'Behavioral Patterns';

  @override
  String get behavioralPatternsDesc =>
      'Behavioral patterns are concerned with algorithms and the assignment of responsibilities between objects.';

  @override
  String get chainOfResponsibility => 'Chain of Responsibility';

  @override
  String get chainOfResponsibilityDesc =>
      'Lets you pass requests along a chain of handlers. Upon receiving a request, each handler decides either to process the request or to pass it to the next handler in the chain.';

  @override
  String get command => 'Command';

  @override
  String get commandDesc =>
      'Turns a request into a stand-alone object that contains all information about the request. This transformation lets you pass requests as a method arguments, delay or queue a request\'s execution, and support undoable operations.';

  @override
  String get iterator => 'Iterator';

  @override
  String get iteratorDesc =>
      'Lets you traverse elements of a collection without exposing its underlying representation (list, stack, tree, etc.).';

  @override
  String get interpreter => 'Interpreter';

  @override
  String get interpreterDesc =>
      'Given a language, defines a representation for its grammar along with an interpreter that uses the representation to interpret sentences in the language.';

  @override
  String get mediator => 'Mediator';

  @override
  String get mediatorDesc =>
      'Lets you reduce chaotic dependencies between objects. The pattern restricts direct communications between the objects and forces them to collaborate only via a mediator object.';

  @override
  String get memento => 'Memento';

  @override
  String get mementoDesc =>
      'Lets you save and restore the previous state of an object without revealing the details of its implementation.';

  @override
  String get observer => 'Observer';

  @override
  String get observerDesc =>
      'Lets you define a subscription mechanism to notify multiple objects about any events that happen to the object they\'re observing.';

  @override
  String get state => 'State';

  @override
  String get stateDesc =>
      'Lets an object alter its behavior when its internal state changes. It appears as if the object changed its class.';

  @override
  String get strategy => 'Strategy';

  @override
  String get strategyDesc =>
      'Lets you define a family of algorithms, put each of them into a separate class, and make their objects interchangeable.';

  @override
  String get templateMethod => 'Template Method';

  @override
  String get templateMethodDesc =>
      'Defines the skeleton of an algorithm in the superclass but lets subclasses override specific steps of the algorithm without changing its structure.';

  @override
  String get visitor => 'Visitor';

  @override
  String get visitorDesc =>
      'Lets you separate algorithms from the objects on which they operate.';

  @override
  String get refactoringCategories => 'Refactoring Categories';

  @override
  String get composingMethods => 'Composing Methods';

  @override
  String get composingMethodsDesc =>
      'Much of refactoring is devoted to correctly composing methods. In most cases, excessively long methods are the root of all evil.';

  @override
  String get movingFeatures => 'Moving Features';

  @override
  String get movingFeaturesDesc =>
      'These techniques show how to safely move functionality between classes, create new classes, and hide implementation details.';

  @override
  String get organizingData => 'Organizing Data';

  @override
  String get organizingDataDesc =>
      'These techniques help with data handling, replacing primitives with rich class functionality.';

  @override
  String get simplifyingConditionals => 'Simplifying Conditionals';

  @override
  String get simplifyingConditionalsDesc =>
      'Conditionals have a tendency to become more complex in logic over time, and these techniques help combat that.';

  @override
  String get simplifyingMethodCalls => 'Simplifying Method Calls';

  @override
  String get simplifyingMethodCallsDesc =>
      'These techniques make method calls simpler and easier to understand.';

  @override
  String get generalization => 'Generalization';

  @override
  String get generalizationDesc =>
      'Generalization is primarily about moving functionality along the class inheritance hierarchy.';

  @override
  String get notes => 'Notes';

  @override
  String get details => 'Details';

  @override
  String get example => 'Dart Example';

  @override
  String get goodExample => 'Good Example';

  @override
  String get badExample => 'Bad Example';

  @override
  String get seeMore => 'See More';

  @override
  String get reference => 'Reference';

  @override
  String get references => 'References';

  @override
  String get close => 'Close';

  @override
  String get extractMethod => 'Extract Method';

  @override
  String get inlineMethod => 'Inline Method';

  @override
  String get extractVariable => 'Extract Variable';

  @override
  String get moveMethod => 'Move Method';

  @override
  String get moveField => 'Move Field';

  @override
  String get extractClass => 'Extract Class';

  @override
  String get selfEncapsulateField => 'Self Encapsulate Field';

  @override
  String get replaceDataValueWithObject => 'Replace Data Value with Object';

  @override
  String get refactoringTip =>
      'This technique helps simplify code structure and improve maintainability.';

  @override
  String get copied => 'Copied to clipboard!';

  @override
  String get singletonNote =>
      'Singletons should have a private constructor and a static instance accessor.';

  @override
  String get factoryMethodNote =>
      'Avoid \'if-else\' ladders for object creation; use sub-classes to decide the concrete type.';

  @override
  String get builderNote =>
      'Builders solve the \'Telescoping Constructor\' problem and provide readable code.';
}
