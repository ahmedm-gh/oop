import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'OOP Mastery'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @designPatterns.
  ///
  /// In en, this message translates to:
  /// **'Design Patterns'**
  String get designPatterns;

  /// No description provided for @refactoring.
  ///
  /// In en, this message translates to:
  /// **'Refactoring'**
  String get refactoring;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @creationalPatterns.
  ///
  /// In en, this message translates to:
  /// **'Creational Patterns'**
  String get creationalPatterns;

  /// No description provided for @creationalPatternsDesc.
  ///
  /// In en, this message translates to:
  /// **'Creational patterns abstract the instantiation process. They help make a system independent of how its objects are created, composed, and represented.'**
  String get creationalPatternsDesc;

  /// No description provided for @factoryMethod.
  ///
  /// In en, this message translates to:
  /// **'Factory Method'**
  String get factoryMethod;

  /// No description provided for @factoryMethodDesc.
  ///
  /// In en, this message translates to:
  /// **'Provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created.'**
  String get factoryMethodDesc;

  /// No description provided for @abstractFactory.
  ///
  /// In en, this message translates to:
  /// **'Abstract Factory'**
  String get abstractFactory;

  /// No description provided for @abstractFactoryDesc.
  ///
  /// In en, this message translates to:
  /// **'Lets you produce families of related objects without specifying their concrete classes.'**
  String get abstractFactoryDesc;

  /// No description provided for @builder.
  ///
  /// In en, this message translates to:
  /// **'Builder'**
  String get builder;

  /// No description provided for @builderDesc.
  ///
  /// In en, this message translates to:
  /// **'Lets you construct complex objects step by step. The pattern allows you to produce different types and representations of an object using the same construction code.'**
  String get builderDesc;

  /// No description provided for @prototype.
  ///
  /// In en, this message translates to:
  /// **'Prototype'**
  String get prototype;

  /// No description provided for @prototypeDesc.
  ///
  /// In en, this message translates to:
  /// **'Lets you copy existing objects without making your code dependent on their classes.'**
  String get prototypeDesc;

  /// No description provided for @singleton.
  ///
  /// In en, this message translates to:
  /// **'Singleton'**
  String get singleton;

  /// No description provided for @singletonDesc.
  ///
  /// In en, this message translates to:
  /// **'Ensures that a class has only one instance, while providing a global access point to this instance.'**
  String get singletonDesc;

  /// No description provided for @structuralPatterns.
  ///
  /// In en, this message translates to:
  /// **'Structural Patterns'**
  String get structuralPatterns;

  /// No description provided for @structuralPatternsDesc.
  ///
  /// In en, this message translates to:
  /// **'These patterns explain how to assemble objects and classes into larger structures while keeping these structures flexible and efficient.'**
  String get structuralPatternsDesc;

  /// No description provided for @adapter.
  ///
  /// In en, this message translates to:
  /// **'Adapter'**
  String get adapter;

  /// No description provided for @adapterDesc.
  ///
  /// In en, this message translates to:
  /// **'Allows objects with incompatible interfaces to collaborate.'**
  String get adapterDesc;

  /// No description provided for @bridge.
  ///
  /// In en, this message translates to:
  /// **'Bridge'**
  String get bridge;

  /// No description provided for @bridgeDesc.
  ///
  /// In en, this message translates to:
  /// **'Lets you split a large class or a set of closely related classes into two separate hierarchies—abstraction and implementation—which can be developed independently of each other.'**
  String get bridgeDesc;

  /// No description provided for @composite.
  ///
  /// In en, this message translates to:
  /// **'Composite'**
  String get composite;

  /// No description provided for @compositeDesc.
  ///
  /// In en, this message translates to:
  /// **'Lets you compose objects into tree structures and then work with these structures as if they were individual objects.'**
  String get compositeDesc;

  /// No description provided for @decorator.
  ///
  /// In en, this message translates to:
  /// **'Decorator'**
  String get decorator;

  /// No description provided for @decoratorDesc.
  ///
  /// In en, this message translates to:
  /// **'Lets you attach new behaviors to objects by placing these objects inside special wrapper objects that contain the behaviors.'**
  String get decoratorDesc;

  /// No description provided for @facade.
  ///
  /// In en, this message translates to:
  /// **'Facade'**
  String get facade;

  /// No description provided for @facadeDesc.
  ///
  /// In en, this message translates to:
  /// **'Provides a simplified interface to a library, a framework, or any other complex set of classes.'**
  String get facadeDesc;

  /// No description provided for @flyweight.
  ///
  /// In en, this message translates to:
  /// **'Flyweight'**
  String get flyweight;

  /// No description provided for @flyweightDesc.
  ///
  /// In en, this message translates to:
  /// **'Lets you fit more objects into the available amount of RAM by sharing common parts of state between multiple objects instead of keeping all of the data in each object.'**
  String get flyweightDesc;

  /// No description provided for @proxy.
  ///
  /// In en, this message translates to:
  /// **'Proxy'**
  String get proxy;

  /// No description provided for @proxyDesc.
  ///
  /// In en, this message translates to:
  /// **'Lets you provide a substitute or placeholder for another object. A proxy controls access to the original object, allowing you to perform something either before or after the request gets through to the original object.'**
  String get proxyDesc;

  /// No description provided for @behavioralPatterns.
  ///
  /// In en, this message translates to:
  /// **'Behavioral Patterns'**
  String get behavioralPatterns;

  /// No description provided for @behavioralPatternsDesc.
  ///
  /// In en, this message translates to:
  /// **'Behavioral patterns are concerned with algorithms and the assignment of responsibilities between objects.'**
  String get behavioralPatternsDesc;

  /// No description provided for @chainOfResponsibility.
  ///
  /// In en, this message translates to:
  /// **'Chain of Responsibility'**
  String get chainOfResponsibility;

  /// No description provided for @chainOfResponsibilityDesc.
  ///
  /// In en, this message translates to:
  /// **'Lets you pass requests along a chain of handlers. Upon receiving a request, each handler decides either to process the request or to pass it to the next handler in the chain.'**
  String get chainOfResponsibilityDesc;

  /// No description provided for @command.
  ///
  /// In en, this message translates to:
  /// **'Command'**
  String get command;

  /// No description provided for @commandDesc.
  ///
  /// In en, this message translates to:
  /// **'Turns a request into a stand-alone object that contains all information about the request. This transformation lets you pass requests as a method arguments, delay or queue a request\'s execution, and support undoable operations.'**
  String get commandDesc;

  /// No description provided for @iterator.
  ///
  /// In en, this message translates to:
  /// **'Iterator'**
  String get iterator;

  /// No description provided for @iteratorDesc.
  ///
  /// In en, this message translates to:
  /// **'Lets you traverse elements of a collection without exposing its underlying representation (list, stack, tree, etc.).'**
  String get iteratorDesc;

  /// No description provided for @interpreter.
  ///
  /// In en, this message translates to:
  /// **'Interpreter'**
  String get interpreter;

  /// No description provided for @interpreterDesc.
  ///
  /// In en, this message translates to:
  /// **'Given a language, defines a representation for its grammar along with an interpreter that uses the representation to interpret sentences in the language.'**
  String get interpreterDesc;

  /// No description provided for @mediator.
  ///
  /// In en, this message translates to:
  /// **'Mediator'**
  String get mediator;

  /// No description provided for @mediatorDesc.
  ///
  /// In en, this message translates to:
  /// **'Lets you reduce chaotic dependencies between objects. The pattern restricts direct communications between the objects and forces them to collaborate only via a mediator object.'**
  String get mediatorDesc;

  /// No description provided for @memento.
  ///
  /// In en, this message translates to:
  /// **'Memento'**
  String get memento;

  /// No description provided for @mementoDesc.
  ///
  /// In en, this message translates to:
  /// **'Lets you save and restore the previous state of an object without revealing the details of its implementation.'**
  String get mementoDesc;

  /// No description provided for @observer.
  ///
  /// In en, this message translates to:
  /// **'Observer'**
  String get observer;

  /// No description provided for @observerDesc.
  ///
  /// In en, this message translates to:
  /// **'Lets you define a subscription mechanism to notify multiple objects about any events that happen to the object they\'re observing.'**
  String get observerDesc;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @stateDesc.
  ///
  /// In en, this message translates to:
  /// **'Lets an object alter its behavior when its internal state changes. It appears as if the object changed its class.'**
  String get stateDesc;

  /// No description provided for @strategy.
  ///
  /// In en, this message translates to:
  /// **'Strategy'**
  String get strategy;

  /// No description provided for @strategyDesc.
  ///
  /// In en, this message translates to:
  /// **'Lets you define a family of algorithms, put each of them into a separate class, and make their objects interchangeable.'**
  String get strategyDesc;

  /// No description provided for @templateMethod.
  ///
  /// In en, this message translates to:
  /// **'Template Method'**
  String get templateMethod;

  /// No description provided for @templateMethodDesc.
  ///
  /// In en, this message translates to:
  /// **'Defines the skeleton of an algorithm in the superclass but lets subclasses override specific steps of the algorithm without changing its structure.'**
  String get templateMethodDesc;

  /// No description provided for @visitor.
  ///
  /// In en, this message translates to:
  /// **'Visitor'**
  String get visitor;

  /// No description provided for @visitorDesc.
  ///
  /// In en, this message translates to:
  /// **'Lets you separate algorithms from the objects on which they operate.'**
  String get visitorDesc;

  /// No description provided for @refactoringCategories.
  ///
  /// In en, this message translates to:
  /// **'Refactoring Categories'**
  String get refactoringCategories;

  /// No description provided for @composingMethods.
  ///
  /// In en, this message translates to:
  /// **'Composing Methods'**
  String get composingMethods;

  /// No description provided for @composingMethodsDesc.
  ///
  /// In en, this message translates to:
  /// **'Much of refactoring is devoted to correctly composing methods. In most cases, excessively long methods are the root of all evil.'**
  String get composingMethodsDesc;

  /// No description provided for @movingFeatures.
  ///
  /// In en, this message translates to:
  /// **'Moving Features'**
  String get movingFeatures;

  /// No description provided for @movingFeaturesDesc.
  ///
  /// In en, this message translates to:
  /// **'These techniques show how to safely move functionality between classes, create new classes, and hide implementation details.'**
  String get movingFeaturesDesc;

  /// No description provided for @organizingData.
  ///
  /// In en, this message translates to:
  /// **'Organizing Data'**
  String get organizingData;

  /// No description provided for @organizingDataDesc.
  ///
  /// In en, this message translates to:
  /// **'These techniques help with data handling, replacing primitives with rich class functionality.'**
  String get organizingDataDesc;

  /// No description provided for @simplifyingConditionals.
  ///
  /// In en, this message translates to:
  /// **'Simplifying Conditionals'**
  String get simplifyingConditionals;

  /// No description provided for @simplifyingConditionalsDesc.
  ///
  /// In en, this message translates to:
  /// **'Conditionals have a tendency to become more complex in logic over time, and these techniques help combat that.'**
  String get simplifyingConditionalsDesc;

  /// No description provided for @simplifyingMethodCalls.
  ///
  /// In en, this message translates to:
  /// **'Simplifying Method Calls'**
  String get simplifyingMethodCalls;

  /// No description provided for @simplifyingMethodCallsDesc.
  ///
  /// In en, this message translates to:
  /// **'These techniques make method calls simpler and easier to understand.'**
  String get simplifyingMethodCallsDesc;

  /// No description provided for @generalization.
  ///
  /// In en, this message translates to:
  /// **'Generalization'**
  String get generalization;

  /// No description provided for @generalizationDesc.
  ///
  /// In en, this message translates to:
  /// **'Generalization is primarily about moving functionality along the class inheritance hierarchy.'**
  String get generalizationDesc;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @example.
  ///
  /// In en, this message translates to:
  /// **'Dart Example'**
  String get example;

  /// No description provided for @goodExample.
  ///
  /// In en, this message translates to:
  /// **'Good Example'**
  String get goodExample;

  /// No description provided for @badExample.
  ///
  /// In en, this message translates to:
  /// **'Bad Example'**
  String get badExample;

  /// No description provided for @seeMore.
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get seeMore;

  /// No description provided for @reference.
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get reference;

  /// No description provided for @references.
  ///
  /// In en, this message translates to:
  /// **'References'**
  String get references;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @extractMethod.
  ///
  /// In en, this message translates to:
  /// **'Extract Method'**
  String get extractMethod;

  /// No description provided for @inlineMethod.
  ///
  /// In en, this message translates to:
  /// **'Inline Method'**
  String get inlineMethod;

  /// No description provided for @extractVariable.
  ///
  /// In en, this message translates to:
  /// **'Extract Variable'**
  String get extractVariable;

  /// No description provided for @moveMethod.
  ///
  /// In en, this message translates to:
  /// **'Move Method'**
  String get moveMethod;

  /// No description provided for @moveField.
  ///
  /// In en, this message translates to:
  /// **'Move Field'**
  String get moveField;

  /// No description provided for @extractClass.
  ///
  /// In en, this message translates to:
  /// **'Extract Class'**
  String get extractClass;

  /// No description provided for @selfEncapsulateField.
  ///
  /// In en, this message translates to:
  /// **'Self Encapsulate Field'**
  String get selfEncapsulateField;

  /// No description provided for @replaceDataValueWithObject.
  ///
  /// In en, this message translates to:
  /// **'Replace Data Value with Object'**
  String get replaceDataValueWithObject;

  /// No description provided for @refactoringTip.
  ///
  /// In en, this message translates to:
  /// **'This technique helps simplify code structure and improve maintainability.'**
  String get refactoringTip;

  /// No description provided for @copied.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard!'**
  String get copied;

  /// No description provided for @singletonNote.
  ///
  /// In en, this message translates to:
  /// **'Singletons should have a private constructor and a static instance accessor.'**
  String get singletonNote;

  /// No description provided for @factoryMethodNote.
  ///
  /// In en, this message translates to:
  /// **'Avoid \'if-else\' ladders for object creation; use sub-classes to decide the concrete type.'**
  String get factoryMethodNote;

  /// No description provided for @builderNote.
  ///
  /// In en, this message translates to:
  /// **'Builders solve the \'Telescoping Constructor\' problem and provide readable code.'**
  String get builderNote;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
