abstract class CodeExamples {
  // --- CREATIONAL PATTERNS ---
  // Singleton
  static const singletonBad = r"""
class Database {
  // Public constructor - anyone can create new instances!
  Database();
  
  void query(String sql) => print("Executing: $sql");
}

void main() {
  // New instance created every time!
  var s1 = Database(); 
  var s2 = Database();
  print(identical(s1, s2)); // false (Bad! Different instances)
}
""";

  static const singletonGood = r"""
class Database {
  // Private named constructor
  Database._internal();

  // The single instance
  static final Database _instance = Database._internal();

  // Factory constructor returns the same instance
  factory Database() => _instance;

  void query(String sql) => print("Executing: $sql");
}

void main() {
  final s1 = Database();
  final s2 = Database();
  print(identical(s1, s2)); // true (Good! Same instance)
}
""";

  // Factory Method
  static const factoryMethodBad = r"""
class MaterialButton {
  void render() => print("Android UI");
}

class CupertinoButton {
  void render() => print("iOS UI");
}

void main() {
  final platform = "Android";
  
  // Client code depends on concrete classes!
  if (platform == "Android") {
    MaterialButton().render();
  } else if (platform == "iOS") {
    CupertinoButton().render();
  }
}
""";

  static const factoryMethodGood = r"""
abstract class Button {
  void render();
}

class MaterialButton implements Button {
  @override
  void render() => print("Android UI");
}

class CupertinoButton implements Button {
  @override
  void render() => print("iOS UI");
}

abstract class Dialog {
  // The Factory Method
  Button buildButton();

  void display() {
    final button = buildButton();
    button.render();
  }
}

class AndroidDialog extends Dialog {
  @override
  Button buildButton() => MaterialButton();
}

class IOSDialog extends Dialog {
  @override
  Button buildButton() => CupertinoButton();
}

void main() {
  final Dialog dialog = AndroidDialog();
  dialog.display(); // Decoupled!
}
""";

  // Builder
  static const builderBad = r"""
class Pizza {
  final String dough;
  final String sauce;
  final String topping;
  final int size;
  final bool extraCheese;
  
  // Telescoping constructor! Hard to read and maintain.
  Pizza(this.dough, this.sauce, this.topping, this.size, this.extraCheese);
}

void main() {
  // What do these arguments mean?
  final p = Pizza("Thin", "Tomato", "Cheese", 12, true);
  print(p);
}
""";

  static const builderGood = r"""
class Pizza {
  String? dough;
  String? sauce;
  String? topping;
  
  @override
  String toString() => "Pizza(dough: $dough, sauce: $sauce, topping: $topping)";
}

class PizzaBuilder {
  final _pizza = Pizza();
  
  PizzaBuilder setDough(String d) {
    _pizza.dough = d;
    return this;
  }
  
  PizzaBuilder setSauce(String s) {
    _pizza.sauce = s;
    return this;
  }
  
  PizzaBuilder setTopping(String t) {
    _pizza.topping = t;
    return this;
  }
  
  Pizza build() => _pizza;
}

void main() {
  final pizza = PizzaBuilder()
    .setDough("Thin")
    .setSauce("Tomato")
    .setTopping("Pepperoni")
    .build();
  print(pizza);
}
""";

  // Abstract Factory
  static const abstractFactoryGood = r"""
abstract class Button {
  void paint();
}

abstract class Checkbox {
  void paint();
}

class WinButton implements Button {
  @override
  void paint() => print("Render Windows Button");
}

class MacButton implements Button {
  @override
  void paint() => print("Render Mac Button");
}

class WinCheckbox implements Checkbox {
  @override
  void paint() => print("Render Windows Checkbox");
}

class MacCheckbox implements Checkbox {
  @override
  void paint() => print("Render Mac Checkbox");
}

abstract class GUIFactory {
  Button createButton();
  Checkbox createCheckbox();
}

class WinFactory implements GUIFactory {
  @override
  Button createButton() => WinButton();
  
  @override
  Checkbox createCheckbox() => WinCheckbox();
}

class MacFactory implements GUIFactory {
  @override
  Button createButton() => MacButton();
  
  @override
  Checkbox createCheckbox() => MacCheckbox();
}

void main() {
  // Switch to MacFactory easily
  final GUIFactory factory = WinFactory(); 
  final button = factory.createButton();
  final checkbox = factory.createCheckbox();
  button.paint();
  checkbox.paint();
}
""";

  // Prototype
  static const prototypeGood = r"""
class Shape {
  int x;
  int y;
  
  Shape(this.x, this.y);

  // Prototype method
  Shape clone() => Shape(x, y);
}

class Rectangle extends Shape {
  int width;
  int height;
  
  Rectangle(super.x, super.y, this.width, this.height);

  @override
  Rectangle clone() => Rectangle(x, y, width, height);
}

void main() {
  final r1 = Rectangle(10, 20, 100, 200);
  final r2 = r1.clone();
  print("r1: (${r1.x}, ${r1.y}) ${r1.width}x${r1.height}");
  print("r2: (${r2.x}, ${r2.y}) ${r2.width}x${r2.height}");
  print("Are they the same object? ${identical(r1, r2)}"); // false
}
""";

  // --- STRUCTURAL PATTERNS ---
  // Adapter
  static const adapterGood = r"""
class OldPrinter {
  void printSpecial(String msg) => print("Legacy: $msg");
}

abstract class Printer {
  void printMessage(String msg);
}

class PrinterAdapter implements Printer {
  final OldPrinter _old;
  
  PrinterAdapter(this._old);

  @override
  void printMessage(String msg) => _old.printSpecial(msg);
}

void main() {
  final adapter = PrinterAdapter(OldPrinter());
  adapter.printMessage("Hello World");
}
""";

  // Bridge
  static const bridgeGood = r"""
abstract class Device {
  void turnOn();
  void turnOff();
  void setVolume(int percent);
}

class TV implements Device {
  @override
  void turnOn() => print("TV On");
  
  @override
  void turnOff() => print("TV Off");
  
  @override
  void setVolume(int percent) => print("TV Volume: $percent");
}

class Radio implements Device {
  @override
  void turnOn() => print("Radio On");
  
  @override
  void turnOff() => print("Radio Off");
  
  @override
  void setVolume(int percent) => print("Radio Volume: $percent");
}

class RemoteControl {
  final Device device;
  
  RemoteControl(this.device);

  void togglePower() {
    print("Toggling Power");
    device.turnOn();
  }
}

void main() {
  final tv = TV();
  final remote = RemoteControl(tv);
  remote.togglePower();
}
""";

  // Composite
  static const compositeGood = r"""
abstract class Graphic {
  void draw();
}

class Dot implements Graphic {
  @override
  void draw() => print("Draw Dot");
}

class Circle implements Graphic {
  @override
  void draw() => print("Draw Circle");
}

class CompoundGraphic implements Graphic {
  final List<Graphic> children = [];

  void add(Graphic g) => children.add(g);

  @override
  void draw() {
    print("Drawing compound graphic:");
    for (final child in children) {
      child.draw();
    }
  }
}

void main() {
  final group = CompoundGraphic();
  group.add(Dot());
  group.add(Circle());
  group.draw();
}
""";

  // Decorator
  static const decoratorGood = r"""
abstract class DataSource {
  void writeData(String data);
}

class FileDataSource implements DataSource {
  @override
  void writeData(String data) => print("Writing to file: $data");
}

class DataSourceDecorator implements DataSource {
  final DataSource wrappee;
  
  DataSourceDecorator(this.wrappee);

  @override
  void writeData(String data) => wrappee.writeData(data);
}

class EncryptionDecorator extends DataSourceDecorator {
  EncryptionDecorator(super.wrappee);

  @override
  void writeData(String data) {
    super.writeData("Encrypted($data)");
  }
}

class CompressionDecorator extends DataSourceDecorator {
  CompressionDecorator(super.wrappee);

  @override
  void writeData(String data) {
    super.writeData("Compressed($data)");
  }
}

void main() {
  // Can stack decorators
  final source = EncryptionDecorator(
    CompressionDecorator(FileDataSource())
  );
  source.writeData("sensitive_info");
}
""";

  // Facade
  static const facadeGood = r"""
class VideoFile {
  final String filename;
  
  VideoFile(this.filename);
}

class OggCompressionCodec {
  String compress(VideoFile file) => "Ogg compressed ${file.filename}";
}

class MPEG4CompressionCodec {
  String compress(VideoFile file) => "MPEG4 compressed ${file.filename}";
}

class CodecFactory {
  static dynamic getCodec(String format) {
    if (format == "ogg") return OggCompressionCodec();
    return MPEG4CompressionCodec();
  }
}

class AudioMixer {
  void mix(String compressed) => print("Mixing audio: $compressed");
}

// Facade - simplifies complex subsystem
class VideoConverter {
  void convert(String filename, String format) {
    print("VideoConverter: conversion started.");
    final file = VideoFile(filename);
    final codec = CodecFactory.getCodec(format);
    final compressed = codec.compress(file);
    final mixer = AudioMixer();
    mixer.mix(compressed);
    print("VideoConverter: conversion completed.");
  }
}

void main() {
  final converter = VideoConverter();
  converter.convert("vid.mp4", "ogg");
}
""";

  // Proxy
  static const proxyGood = r"""
abstract class ServiceInterface {
  void operation();
}

class RealService implements ServiceInterface {
  @override
  void operation() => print("RealService: Performing heavy operation...");
}

class ProxyService implements ServiceInterface {
  RealService? _realService;

  @override
  void operation() {
    if (_checkAccess()) {
      _realService ??= RealService();
      _realService!.operation();
      _logAccess();
    }
  }

  bool _checkAccess() {
    print("Proxy: Checking access.");
    return true;
  }
  
  void _logAccess() => print("Proxy: Logged access time.");
}

void main() {
  final proxy = ProxyService();
  proxy.operation();
}
""";

  // --- BEHAVIORAL PATTERNS ---
  // Observer
  static const observerGood = r"""
class NewsAgency {
  final List<Function(String)> _subscribers = [];

  void subscribe(Function(String) callback) {
    _subscribers.add(callback);
  }

  void unsubscribe(Function(String) callback) {
    _subscribers.remove(callback);
  }

  void publish(String news) {
    print("NewsAgency: Publishing news...");
    for (final sub in _subscribers) {
      sub(news);
    }
  }
}

void main() {
  final agency = NewsAgency();
  
  agency.subscribe((news) => print("Reader 1 received: $news"));
  agency.subscribe((news) => print("Reader 2 received: $news"));

  agency.publish("Dart is awesome!");
}
""";

  // Strategy
  static const strategyGood = r"""
abstract class Strategy {
  int execute(int a, int b);
}

class AddStrategy implements Strategy {
  @override
  int execute(int a, int b) => a + b;
}

class SubtractStrategy implements Strategy {
  @override
  int execute(int a, int b) => a - b;
}

class MultiplyStrategy implements Strategy {
  @override
  int execute(int a, int b) => a * b;
}

class Context {
  Strategy strategy;
  
  Context(this.strategy);

  void executeStrategy(int a, int b) {
    final result = strategy.execute(a, b);
    print("Result: $result");
  }
}

void main() {
  final ctx = Context(AddStrategy());
  ctx.executeStrategy(5, 3); // 8

  ctx.strategy = MultiplyStrategy();
  ctx.executeStrategy(5, 3); // 15
}
""";

  // Command
  static const commandGood = r"""
abstract class Command {
  void execute();
}

class SimpleCommand implements Command {
  final String payload;
  
  SimpleCommand(this.payload);
  
  @override
  void execute() => print("SimpleCommand: $payload");
}

class Receiver {
  void doSomething(String a) => print("Receiver: working on ($a)");
  void doSomethingElse(String b) => print("Receiver: also working on ($b)");
}

class ComplexCommand implements Command {
  final Receiver receiver;
  final String a;
  final String b;
  
  ComplexCommand(this.receiver, this.a, this.b);

  @override
  void execute() {
    print("ComplexCommand: delegating to receiver");
    receiver.doSomething(a);
    receiver.doSomethingElse(b);
  }
}

class Invoker {
  Command? _onStart;
  Command? _onFinish;
  
  void setOnStart(Command c) => _onStart = c;
  void setOnFinish(Command c) => _onFinish = c;
  
  void doSomethingImportant() {
    print("Invoker: Starting...");
    _onStart?.execute();
    
    print("Invoker: ...doing something...");
    
    print("Invoker: Finishing...");
    _onFinish?.execute();
  }
}

void main() {
  final invoker = Invoker();
  invoker.setOnStart(SimpleCommand("Say Hi!"));
  
  final receiver = Receiver();
  invoker.setOnFinish(ComplexCommand(receiver, "Send email", "Save report"));
  
  invoker.doSomethingImportant();
}
""";

  // State
  static const stateGood = r"""
abstract class State {
  void handle(Context ctx);
}

class ConcreteStateA implements State {
  @override
  void handle(Context ctx) {
    print("State A: handling request, switching to State B");
    ctx.state = ConcreteStateB();
  }
}

class ConcreteStateB implements State {
  @override
  void handle(Context ctx) {
    print("State B: handling request, switching to State A");
    ctx.state = ConcreteStateA();
  }
}

class Context {
  State state;
  
  Context(this.state);

  void request() {
    state.handle(this);
  }
}

void main() {
  final ctx = Context(ConcreteStateA());
  ctx.request(); // State A switches to B
  ctx.request(); // State B switches to A
  ctx.request(); // State A switches to B
}
""";

  // Chain of Responsibility
  static const chainOfResponsibilityGood = r"""
abstract class Handler {
  Handler? next;
  
  void setNext(Handler h) => next = h;
  void handle(String request);
}

class MonkeyHandler extends Handler {
  @override
  void handle(String request) {
    if (request == "Banana") {
      print("Monkey: I'll eat the $request");
    } else {
      print("Monkey: I can't handle $request");
      next?.handle(request);
    }
  }
}

class SquirrelHandler extends Handler {
  @override
  void handle(String request) {
    if (request == "Nut") {
      print("Squirrel: I'll eat the $request");
    } else {
      print("Squirrel: I can't handle $request");
      next?.handle(request);
    }
  }
}

class DogHandler extends Handler {
  @override
  void handle(String request) {
    if (request == "MeatBall") {
      print("Dog: I'll eat the $request");
    } else {
      print("Dog: I can't handle $request");
      next?.handle(request);
    }
  }
}

void main() {
  final monkey = MonkeyHandler();
  final squirrel = SquirrelHandler();
  final dog = DogHandler();
  
  monkey.setNext(squirrel);
  squirrel.setNext(dog);

  print("Chain: Monkey > Squirrel > Dog\n");
  
  monkey.handle("Nut");
  print("");
  monkey.handle("Banana");
  print("");
  monkey.handle("Coffee");
}
""";

  // Iterator
  static const iteratorGood = r"""
class AlphabeticalOrderIterator implements Iterator<String> {
  final List<String> _collection;
  int _position = -1;
  final bool _reverse;

  AlphabeticalOrderIterator(this._collection, {bool reverse = false})
      : _reverse = reverse {
    if (reverse) {
      _position = _collection.length;
    }
  }

  @override
  String get current => _collection[_position];

  @override
  bool moveNext() {
    if (_reverse) {
      _position--;
      return _position >= 0;
    } else {
      _position++;
      return _position < _collection.length;
    }
  }
}

class WordsCollection extends Iterable<String> {
  final List<String> _items = [];
  
  void add(String item) => _items.add(item);

  @override
  Iterator<String> get iterator => AlphabeticalOrderIterator(_items);
  
  Iterator<String> getReverseIterator() {
    return AlphabeticalOrderIterator(_items, reverse: true);
  }
}

void main() {
  final collection = WordsCollection();
  collection.add("First");
  collection.add("Second");
  collection.add("Third");

  print("Forward iteration:");
  for (final item in collection) {
    print(item);
  }
  
  print("\nReverse iteration:");
  final reverseIterator = collection.getReverseIterator();
  while (reverseIterator.moveNext()) {
    print(reverseIterator.current);
  }
}
""";

  // --- REFACTORING TECHNIQUES ---

  // Extract Method
  static const extractMethodBefore = r"""
void printInvoice(List<double> prices) {
  print("*****************");
  print("**** Invoice ****");
  print("*****************");

  double total = 0;
  for (var price in prices) {
    total += price;
  }

  print("Total: \$$total");
}

void main() {
  printInvoice([10.0, 20.0, 30.0]);
}
""";

  static const extractMethodAfter = r"""
void printInvoice(List<double> prices) {
  _printBanner();
  final total = _calculateTotal(prices);
  _printDetails(total);
}

void _printBanner() {
  print("*****************");
  print("**** Invoice ****");
  print("*****************");
}

double _calculateTotal(List<double> prices) {
  double total = 0;
  for (final price in prices) {
    total += price;
  }
  return total;
}

void _printDetails(double total) {
  print("Total: \$$total");
}

void main() {
  printInvoice([10.0, 20.0, 30.0]);
}
""";

  // Inline Method
  static const inlineMethodBefore = r"""
class Rating {
  int numberOfLateDeliveries;

  Rating(this.numberOfLateDeliveries);

  bool get isMoreThanFiveLateDeliveries => numberOfLateDeliveries > 5;

  int getRating() {
    return isMoreThanFiveLateDeliveries ? 2 : 1;
  }
}

void main() {
  final rating = Rating(7);
  print("Rating: ${rating.getRating()}");
}
""";

  static const inlineMethodAfter = r"""
class Rating {
  int numberOfLateDeliveries;

  Rating(this.numberOfLateDeliveries);

  int getRating() {
    return numberOfLateDeliveries > 5 ? 2 : 1;
  }
}

void main() {
  final rating = Rating(7);
  print("Rating: ${rating.getRating()}");
}
""";

  // Extract Variable
  static const extractVariableBefore = r"""
bool wasInitialized() => true;

void render(String platform, String browser, int resize) {
  if ((platform.toUpperCase().contains("MAC") &&
          browser.toUpperCase().contains("IE") &&
          wasInitialized() &&
          resize > 0)) {
    print("Rendering for Mac IE");
  }
}

void main() {
  render("MAC OS", "IE 11", 100);
}
""";

  static const extractVariableAfter = r"""
bool wasInitialized() => true;

void render(String platform, String browser, int resize) {
  final isMacOs = platform.toUpperCase().contains("MAC");
  final isIE = browser.toUpperCase().contains("IE");
  final wasResized = resize > 0;

  if (isMacOs && isIE && wasInitialized() && wasResized) {
    print("Rendering for Mac IE");
  }
}

void main() {
  render("MAC OS", "IE 11", 100);
}
""";

  // Move Method
  static const moveMethodBefore = r"""
class AccountType {
  bool isPremium;
  
  AccountType(this.isPremium);
}

class Account {
  AccountType type;
  int daysOverdrawn;
  
  Account(this.type, this.daysOverdrawn);
  
  double overdraftCharge() {
    if (type.isPremium) {
      double result = 10;
      if (daysOverdrawn > 7) {
        result += (daysOverdrawn - 7) * 0.85;
      }
      return result;
    }
    return daysOverdrawn * 1.75;
  }
}

void main() {
  final account = Account(AccountType(true), 10);
  print("Overdraft charge: \$${account.overdraftCharge()}");
}
""";

  static const moveMethodAfter = r"""
class AccountType {
  bool isPremium;
  
  AccountType(this.isPremium);
  
  double overdraftCharge(int daysOverdrawn) {
    if (isPremium) {
      double result = 10;
      if (daysOverdrawn > 7) {
        result += (daysOverdrawn - 7) * 0.85;
      }
      return result;
    }
    return daysOverdrawn * 1.75;
  }
}

class Account {
  AccountType type;
  int daysOverdrawn;
  
  Account(this.type, this.daysOverdrawn);
  
  double overdraftCharge() {
    return type.overdraftCharge(daysOverdrawn);
  }
}

void main() {
  final account = Account(AccountType(true), 10);
  print("Overdraft charge: \$${account.overdraftCharge()}");
}
""";

  // Move Field
  static const moveFieldBefore = r"""
class Account {
  double interestRate;

  Account(this.interestRate);

  double interestForAmount_days(double amount, int days) {
    return interestRate * amount * days / 365;
  }
}

void main() {
  final account = Account(0.05);
  print("Interest: \$${account.interestForAmount_days(1000, 30)}");
}
""";

  static const moveFieldAfter = r"""
class AccountType {
  double interestRate;
  
  AccountType(this.interestRate);
}

class Account {
  AccountType type;

  Account(this.type);

  double interestForAmount_days(double amount, int days) {
    return type.interestRate * amount * days / 365;
  }
}

void main() {
  final accountType = AccountType(0.05);
  final account = Account(accountType);
  print("Interest: \$${account.interestForAmount_days(1000, 30)}");
}
""";

  // Extract Class
  static const extractClassBefore = r"""
class Person {
  String name;
  String officeAreaCode;
  String officeNumber;

  Person(this.name, this.officeAreaCode, this.officeNumber);

  String getTelephoneNumber() {
    return "($officeAreaCode) $officeNumber";
  }
}

void main() {
  final person = Person("John Doe", "555", "1234");
  print("${person.name}'s phone: ${person.getTelephoneNumber()}");
}
""";

  static const extractClassAfter = r"""
class TelephoneNumber {
  String areaCode;
  String number;

  TelephoneNumber(this.areaCode, this.number);

  @override
  String toString() => "($areaCode) $number";
}

class Person {
  String name;
  TelephoneNumber officeTelephone;

  Person(this.name, this.officeTelephone);

  String getTelephoneNumber() => officeTelephone.toString();
}

void main() {
  final phone = TelephoneNumber("555", "1234");
  final person = Person("John Doe", phone);
  print("${person.name}'s phone: ${person.getTelephoneNumber()}");
}
""";

  // Self Encapsulate Field
  static const selfEncapsulateFieldBefore = r"""
class Range {
  int low;
  int high;
  
  Range(this.low, this.high);
  
  bool includes(int arg) {
    return arg >= low && arg <= high;
  }
}

void main() {
  final range = Range(1, 10);
  print("5 in range? ${range.includes(5)}");
  print("15 in range? ${range.includes(15)}");
}
""";

  static const selfEncapsulateFieldAfter = r"""
class Range {
  int _low;
  int _high;

  Range(this._low, this._high);

  int get low => _low;
  int get high => _high;
  
  set low(int value) => _low = value;
  set high(int value) => _high = value;

  bool includes(int arg) {
    return arg >= low && arg <= high;
  }
}

void main() {
  final range = Range(1, 10);
  print("5 in range? ${range.includes(5)}");
  print("15 in range? ${range.includes(15)}");
}
""";

  // Replace Data Value with Object
  static const replaceDataValueWithObjectBefore = r"""
class Order {
  String customer;

  Order(this.customer);
}

// Client code
int numberOfOrdersFor(List<Order> orders, String customer) {
  return orders.where((o) => o.customer == customer).length;
}

void main() {
  final orders = [
    Order("John"),
    Order("Jane"),
    Order("John"),
  ];
  
  print("Orders for John: ${numberOfOrdersFor(orders, "John")}");
}
""";

  static const replaceDataValueWithObjectAfter = r"""
class Customer {
  final String name;
  
  const Customer(this.name);
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Customer && name == other.name;
  
  @override
  int get hashCode => name.hashCode;
}

class Order {
  final Customer customer;
  
  const Order(this.customer);
}

// Client code
int numberOfOrdersFor(List<Order> orders, Customer customer) {
  return orders.where((o) => o.customer == customer).length;
}

void main() {
  const john = Customer("John");
  const jane = Customer("Jane");
  
  final orders = [
    Order(john),
    Order(jane),
    Order(john),
  ];
  
  print("Orders for John: ${numberOfOrdersFor(orders, john)}");
}
""";
}
