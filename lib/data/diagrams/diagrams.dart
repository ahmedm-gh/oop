import 'package:flutter/material.dart';
import 'package:loopsbase/core/models/localized_text.dart';

class FactoryMethodDiagramData {
  const FactoryMethodDiagramData.en({
    this.client = "Client",
    this.creator = "Creator",
    this.factoryMethod = "factoryMethod()",
    this.productInterface = "Product",
    this.concreteCreator = "ConcreteCreator",
    this.concreteProduct = "ConcreteProduct",
  });

  const FactoryMethodDiagramData.ar({
    this.client = "العميل",
    this.creator = "المُنشئ",
    this.factoryMethod = "factoryMethod()",
    this.productInterface = "المنتج",
    this.concreteCreator = "المُنشئ المحدد",
    this.concreteProduct = "المنتج المحدد",
  });

  final String client;
  final String creator;
  final String factoryMethod;
  final String productInterface;
  final String concreteCreator;
  final String concreteProduct;
}

class AbstractFactoryDiagramData {
  const AbstractFactoryDiagramData.en({
    this.client = "Client",
    this.abstractFactory = "AbstractFactory",
    this.concreteFactory1 = "ConcreteFactory1",
    this.concreteFactory2 = "ConcreteFactory2",
    this.productA = "ProductA",
    this.productB = "ProductB",
    this.productA1 = "ProductA1",
    this.productA2 = "ProductA2",
    this.productB1 = "ProductB1",
    this.productB2 = "ProductB2",
    this.createProductA = "createProductA()",
    this.createProductB = "createProductB()",
  });

  const AbstractFactoryDiagramData.ar({
    this.client = "العميل",
    this.abstractFactory = "المصنع المجرد",
    this.concreteFactory1 = "المصنع المحدد 1",
    this.concreteFactory2 = "المصنع المحدد 2",
    this.productA = "المنتج أ",
    this.productB = "المنتج ب",
    this.productA1 = "المنتج أ1",
    this.productA2 = "المنتج أ2",
    this.productB1 = "المنتج ب1",
    this.productB2 = "المنتج ب2",
    this.createProductA = "()createProductA",
    this.createProductB = "()createProductB",
  });

  final String client;
  final String abstractFactory;
  final String concreteFactory1;
  final String concreteFactory2;
  final String productA;
  final String productB;
  final String productA1;
  final String productA2;
  final String productB1;
  final String productB2;
  final String createProductA;
  final String createProductB;
}

class BuilderDiagramData {
  const BuilderDiagramData.en({
    this.director = "Director",
    this.builder = "Builder",
    this.concreteBuilder = "ConcreteBuilder",
    this.product = "Product",
    this.construct = "construct()",
    this.buildPart1 = "buildPart1()",
    this.buildPart2 = "buildPart2()",
    this.getResult = "getResult()",
  });

  const BuilderDiagramData.ar({
    this.director = "المدير",
    this.builder = "البناء",
    this.concreteBuilder = "البناء المحدد",
    this.product = "المنتج",
    this.construct = "()construct",
    this.buildPart1 = "()buildPart1",
    this.buildPart2 = "()buildPart2",
    this.getResult = "()getResult",
  });

  final String director;
  final String builder;
  final String concreteBuilder;
  final String product;
  final String construct;
  final String buildPart1;
  final String buildPart2;
  final String getResult;
}

class PrototypeDiagramData {
  const PrototypeDiagramData.en({
    this.client = "Client",
    this.prototype = "Prototype",
    this.concretePrototype1 = "ConcretePrototype1",
    this.concretePrototype2 = "ConcretePrototype2",
    this.clone = "clone()",
  });

  const PrototypeDiagramData.ar({
    this.client = "العميل",
    this.prototype = "النموذج الأولي",
    this.concretePrototype1 = "النموذج المحدد 1",
    this.concretePrototype2 = "النموذج المحدد 2",
    this.clone = "()clone",
  });

  final String client;
  final String prototype;
  final String concretePrototype1;
  final String concretePrototype2;
  final String clone;
}

class SingletonDiagramData {
  const SingletonDiagramData.en({
    this.client = "Client",
    this.singleton = "Singleton",
    this.instance = "- instance: Singleton",
    this.getInstance = "+ getInstance(): Singleton",
    this.constructor = "- Singleton()",
  });

  const SingletonDiagramData.ar({
    this.client = "العميل",
    this.singleton = "المفرد",
    this.instance = "Singleton :instance -",
    this.getInstance = "()Singleton getInstance: +",
    this.constructor = "()Singleton -",
  });

  final String client;
  final String singleton;
  final String instance;
  final String getInstance;
  final String constructor;
}

class ObjectPoolDiagramData {
  const ObjectPoolDiagramData.en({
    this.client = "Client",
    this.pool = "Pool",
    this.reusableObject = "Reusable",
    this.acquire = "acquire()",
    this.release = "release()",
    this.available = "Available",
    this.inUse = "In Use",
  });

  const ObjectPoolDiagramData.ar({
    this.client = "العميل",
    this.pool = "التجمع",
    this.reusableObject = "قابل لإعادة الاستخدام",
    this.acquire = "()acquire",
    this.release = "()release",
    this.available = "متاح",
    this.inUse = "قيد الاستخدام",
  });

  final String client;
  final String pool;
  final String reusableObject;
  final String acquire;
  final String release;
  final String available;
  final String inUse;
}

class LazyInitializationDiagramData {
  const LazyInitializationDiagramData.en({
    this.client = "Client",
    this.lazyHolder = "LazyHolder",
    this.resource = "Resource",
    this.getResource = "getResource()",
    this.initialized = "initialized?",
    this.yes = "Yes",
    this.no = "No",
    this.create = "Create",
    this.returnCached = "Return cached",
  });

  const LazyInitializationDiagramData.ar({
    this.client = "العميل",
    this.lazyHolder = "الحامل الكسول",
    this.resource = "المورد",
    this.getResource = "()getResource",
    this.initialized = "مُهيأ؟",
    this.yes = "نعم",
    this.no = "لا",
    this.create = "إنشاء",
    this.returnCached = "إرجاع المُخزن",
  });

  final String client;
  final String lazyHolder;
  final String resource;
  final String getResource;
  final String initialized;
  final String yes;
  final String no;
  final String create;
  final String returnCached;
}

class MultitonDiagramData {
  const MultitonDiagramData.en({
    this.client = "Client",
    this.multiton = "Multiton",
    this.instances = "- instances: Map",
    this.getInstance = "getInstance(key)",
    this.instance1 = "Instance 'key1'",
    this.instance2 = "Instance 'key2'",
    this.instance3 = "Instance 'key3'",
  });

  const MultitonDiagramData.ar({
    this.client = "العميل",
    this.multiton = "المتعدد",
    this.instances = "Map :instances -",
    this.getInstance = "(getInstance(key",
    this.instance1 = "'key1' نسخة",
    this.instance2 = "'key2' نسخة",
    this.instance3 = "'key3' نسخة",
  });

  final String client;
  final String multiton;
  final String instances;
  final String getInstance;
  final String instance1;
  final String instance2;
  final String instance3;
}

class FactoryKitDiagramData {
  const FactoryKitDiagramData.en({
    this.client = "Client",
    this.factoryKit = "FactoryKit",
    this.product = "Product",
    this.register = "register(key, factory)",
    this.create = "create(key)",
    this.registry = "Registry",
    this.factory1 = "Factory 1",
    this.factory2 = "Factory 2",
    this.product1 = "Product1",
    this.product2 = "Product2",
  });

  const FactoryKitDiagramData.ar({
    this.client = "العميل",
    this.factoryKit = "مجموعة المصنع",
    this.product = "المنتج",
    this.register = "(register(key, factory",
    this.create = "(create(key",
    this.registry = "السجل",
    this.factory1 = "مصنع 1",
    this.factory2 = "مصنع 2",
    this.product1 = "منتج 1",
    this.product2 = "منتج 2",
  });

  final String client;
  final String factoryKit;
  final String product;
  final String register;
  final String create;
  final String registry;
  final String factory1;
  final String factory2;
  final String product1;
  final String product2;
}

extension ColorToHex on Color {
  /// Converts Color to CSS hex string (e.g., #FF0000)
  /// Uses toARGB32() to replace deprecated .value
  String toCssString() {
    // toARGB32() returns an int (AARRGGBB).
    // We convert to Hex, pad to 8 chars, and substring(2) to strip Alpha (AA)
    // leaving us with RRGGBB.
    return '#${toARGB32().toRadixString(16).padLeft(8, '0').substring(2)}';
  }
}

abstract class Diagrams {
  static String generateFactoryMethodSvg(String langCode, ColorScheme colors) {
    // 1. Get the text content
    final data = const LocV(
      ar: FactoryMethodDiagramData.ar(),
      en: FactoryMethodDiagramData.en(),
    )(langCode);

    final bool isRtl = langCode == 'ar';

    // 2. Extract Colors from the passed ColorScheme
    final String bgColor = colors.surface.toCssString();
    final String concreteColor = colors.surfaceContainerHighest.toCssString();
    final String lineColor = colors.onSurface.toCssString();
    final String concreteTextColor = colors.onSurfaceVariant.toCssString();

    // 3. Define Styles
    final String boxStyle =
        'fill="$bgColor" stroke="$lineColor" stroke-width="2"';
    final String concreteBoxStyle =
        'fill="$concreteColor" stroke="$lineColor" stroke-width="2"';

    // FIX: Added font-family="sans-serif".
    // Without this, SVGs often default to a font that does not support Arabic glyphs.
    // "sans-serif" triggers the system UI font fallback (like Arial, Roboto, or San Francisco)
    // which includes Arabic support.
    final String titleStyle =
        'font-family="sans-serif" font-size="16" font-weight="bold" fill="$lineColor" text-anchor="middle"';
    final String methodStyle =
        'font-family="sans-serif" font-size="14" fill="$lineColor" text-anchor="middle"';

    // Optional: Add interface specific style
    final String interfaceTagStyle =
        'font-family="sans-serif" font-size="12" fill="$lineColor" text-anchor="middle"';

    return '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="-5 -5 690 290" direction="${isRtl ? 'rtl' : 'ltr'}">
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="9" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="$lineColor" />
    </marker>
  </defs>

  <!-- ROW 1: ABSTRACT / CREATOR -->

  <!-- Client Node -->
  <g transform="translate(0, 20)">
    <rect $boxStyle width="120" height="60" rx="5" />
    <text x="60" y="35" $titleStyle>${data.client}</text>
  </g>

  <!-- Creator Node -->
  <g transform="translate(220, 0)">
    <rect $boxStyle width="200" height="100" rx="5" />
    <text x="100" y="30" $titleStyle>${data.creator}</text>
    <line x1="0" y1="45" x2="200" y2="45" stroke="$lineColor" stroke-width="1" />
    <text x="100" y="75" $methodStyle>${data.factoryMethod}</text>
  </g>

  <!-- Product Interface Node -->
  <g transform="translate(500, 20)">
    <rect $boxStyle width="180" height="60" rx="5" />
    <text x="90" y="25" $interfaceTagStyle>&lt;&lt;Interface&gt;&gt;</text>
    <text x="90" y="45" $titleStyle>${data.productInterface}</text>
  </g>

  <!-- ROW 2: CONCRETE IMPLEMENTATIONS -->

  <!-- Concrete Creator -->
  <g transform="translate(220, 220)">
    <rect $concreteBoxStyle width="200" height="60" rx="5" />
    <text x="100" y="35" $titleStyle fill="$concreteTextColor">${data.concreteCreator}</text>
  </g>

  <!-- Concrete Product -->
  <g transform="translate(500, 220)">
    <rect $concreteBoxStyle width="180" height="60" rx="5" />
    <text x="90" y="35" $titleStyle fill="$concreteTextColor">${data.concreteProduct}</text>
  </g>

  <!-- CONNECTIONS -->
  
  <!-- Horizontal Solid Arrows -->
  <path d="M 120 50 L 220 50" stroke="$lineColor" stroke-width="2" fill="none" marker-end="url(#arrowhead)" />
  <path d="M 420 50 L 500 50" stroke="$lineColor" stroke-width="2" fill="none" marker-end="url(#arrowhead)" />
  
  <!-- Vertical Dashed Arrows -->
  <path d="M 320 100 L 320 210" stroke="$lineColor" stroke-width="2" fill="none" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
  <path d="M 590 80 L 590 210" stroke="$lineColor" stroke-width="2" fill="none" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />

</svg>
''';
  }

  static String generateAbstractFactorySvg(
    String langCode,
    ColorScheme colors,
  ) {
    final data = const LocV(
      ar: AbstractFactoryDiagramData.ar(),
      en: AbstractFactoryDiagramData.en(),
    )(langCode);

    final bool isRtl = langCode == 'ar';
    final String bgColor = colors.surface.toCssString();
    final String concreteColor = colors.surfaceContainerHighest.toCssString();
    final String lineColor = colors.onSurface.toCssString();
    final String concreteTextColor = colors.onSurfaceVariant.toCssString();

    final String boxStyle =
        'fill="$bgColor" stroke="$lineColor" stroke-width="2"';
    final String concreteBoxStyle =
        'fill="$concreteColor" stroke="$lineColor" stroke-width="2"';
    final String titleStyle =
        'font-family="sans-serif" font-size="14" font-weight="bold" fill="$lineColor" text-anchor="middle"';
    final String methodStyle =
        'font-family="sans-serif" font-size="12" fill="$lineColor" text-anchor="middle"';
    final String interfaceStyle =
        'font-family="sans-serif" font-size="10" fill="$lineColor" text-anchor="middle"';

    return '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 780 420" direction="${isRtl ? 'rtl' : 'ltr'}">
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="9" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="$lineColor" />
    </marker>
  </defs>

  <!-- Client -->
  <g transform="translate(20, 90)">
    <rect $boxStyle width="120" height="60" rx="5" />
    <text x="60" y="35" $titleStyle>${data.client}</text>
  </g>

  <!-- Abstract Factory -->
  <g transform="translate(240, 40)">
    <rect $boxStyle width="200" height="160" rx="5" />
    <text x="100" y="25" $interfaceStyle>&lt;&lt;Interface&gt;&gt;</text>
    <text x="100" y="45" $titleStyle>${data.abstractFactory}</text>
    <line x1="0" y1="60" x2="200" y2="60" stroke="$lineColor" stroke-width="1" />
    <text x="100" y="85" $methodStyle>${data.createProductA}</text>
    <text x="100" y="105" $methodStyle>${data.createProductB}</text>
  </g>

  <!-- Product A Interface -->
  <g transform="translate(520, 10)">
    <rect $boxStyle width="120" height="60" rx="5" />
    <text x="60" y="20" $interfaceStyle>&lt;&lt;Interface&gt;&gt;</text>
    <text x="60" y="40" $titleStyle>${data.productA}</text>
  </g>

  <!-- Product B Interface -->
  <g transform="translate(520, 140)">
    <rect $boxStyle width="120" height="60" rx="5" />
    <text x="60" y="20" $interfaceStyle>&lt;&lt;Interface&gt;&gt;</text>
    <text x="60" y="40" $titleStyle>${data.productB}</text>
  </g>

  <!-- Concrete Factory 1 -->
  <g transform="translate(140, 280)">
    <rect $concreteBoxStyle width="160" height="60" rx="5" />
    <text x="80" y="35" $titleStyle fill="$concreteTextColor">${data.concreteFactory1}</text>
  </g>

  <!-- Concrete Factory 2 -->
  <g transform="translate(340, 280)">
    <rect $concreteBoxStyle width="160" height="60" rx="5" />
    <text x="80" y="35" $titleStyle fill="$concreteTextColor">${data.concreteFactory2}</text>
  </g>

  <!-- Product A1 -->
  <g transform="translate(540, 250)">
    <rect $concreteBoxStyle width="100" height="50" rx="5" />
    <text x="50" y="30" $titleStyle fill="$concreteTextColor">${data.productA1}</text>
  </g>

  <!-- Product A2 -->
  <g transform="translate(660, 250)">
    <rect $concreteBoxStyle width="100" height="50" rx="5" />
    <text x="50" y="30" $titleStyle fill="$concreteTextColor">${data.productA2}</text>
  </g>

  <!-- Product B1 -->
  <g transform="translate(540, 330)">
    <rect $concreteBoxStyle width="100" height="50" rx="5" />
    <text x="50" y="30" $titleStyle fill="$concreteTextColor">${data.productB1}</text>
  </g>

  <!-- Product B2 -->
  <g transform="translate(660, 330)">
    <rect $concreteBoxStyle width="100" height="50" rx="5" />
    <text x="50" y="30" $titleStyle fill="$concreteTextColor">${data.productB2}</text>
  </g>

  <!-- Arrows -->
  <path d="M 140 120 L 240 120" stroke="$lineColor" stroke-width="2" marker-end="url(#arrowhead)" />
  <path d="M 440 100 L 520 40" stroke="$lineColor" stroke-width="2" marker-end="url(#arrowhead)" />
  <path d="M 440 120 L 520 170" stroke="$lineColor" stroke-width="2" marker-end="url(#arrowhead)" />
  
  <path d="M 220 200 L 220 280" stroke="$lineColor" stroke-width="2" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
  <path d="M 420 200 L 420 280" stroke="$lineColor" stroke-width="2" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
  
  <path d="M 590 70 L 590 250" stroke="$lineColor" stroke-width="2" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
  <path d="M 710 70 L 710 250" stroke="$lineColor" stroke-width="2" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
  <path d="M 590 200 L 590 330" stroke="$lineColor" stroke-width="2" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
  <path d="M 710 200 L 710 330" stroke="$lineColor" stroke-width="2" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
</svg>
''';
  }

  static String generateBuilderSvg(String langCode, ColorScheme colors) {
    final data = const LocV(
      ar: BuilderDiagramData.ar(),
      en: BuilderDiagramData.en(),
    )(langCode);

    final bool isRtl = langCode == 'ar';
    final String bgColor = colors.surface.toCssString();
    final String concreteColor = colors.surfaceContainerHighest.toCssString();
    final String lineColor = colors.onSurface.toCssString();
    final String concreteTextColor = colors.onSurfaceVariant.toCssString();

    final String boxStyle =
        'fill="$bgColor" stroke="$lineColor" stroke-width="2"';
    final String concreteBoxStyle =
        'fill="$concreteColor" stroke="$lineColor" stroke-width="2"';
    final String titleStyle =
        'font-family="sans-serif" font-size="14" font-weight="bold" fill="$lineColor" text-anchor="middle"';
    final String methodStyle =
        'font-family="sans-serif" font-size="12" fill="$lineColor" text-anchor="middle"';
    final String interfaceStyle =
        'font-family="sans-serif" font-size="10" fill="$lineColor" text-anchor="middle"';

    return '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 620 320" direction="${isRtl ? 'rtl' : 'ltr'}">
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="9" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="$lineColor" />
    </marker>
  </defs>

  <!-- Director -->
  <g transform="translate(20, 60)">
    <rect $boxStyle width="140" height="80" rx="5" />
    <text x="70" y="30" $titleStyle>${data.director}</text>
    <line x1="0" y1="45" x2="140" y2="45" stroke="$lineColor" stroke-width="1" />
    <text x="70" y="65" $methodStyle>${data.construct}</text>
  </g>

  <!-- Builder Interface -->
  <g transform="translate(240, 20)">
    <rect $boxStyle width="160" height="160" rx="5" />
    <text x="80" y="25" $interfaceStyle>&lt;&lt;Interface&gt;&gt;</text>
    <text x="80" y="45" $titleStyle>${data.builder}</text>
    <line x1="0" y1="60" x2="160" y2="60" stroke="$lineColor" stroke-width="1" />
    <text x="80" y="85" $methodStyle>${data.buildPart1}</text>
    <text x="80" y="105" $methodStyle>${data.buildPart2}</text>
    <text x="80" y="125" $methodStyle>${data.getResult}</text>
  </g>

  <!-- Product -->
  <g transform="translate(480, 60)">
    <rect $concreteBoxStyle width="120" height="80" rx="5" />
    <text x="60" y="45" $titleStyle fill="$concreteTextColor">${data.product}</text>
  </g>

  <!-- Concrete Builder -->
  <g transform="translate(240, 240)">
    <rect $concreteBoxStyle width="160" height="60" rx="5" />
    <text x="80" y="35" $titleStyle fill="$concreteTextColor">${data.concreteBuilder}</text>
  </g>

  <!-- Arrows -->
  <path d="M 160 100 L 240 100" stroke="$lineColor" stroke-width="2" marker-end="url(#arrowhead)" />
  <path d="M 400 100 L 480 100" stroke="$lineColor" stroke-width="2" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
  <path d="M 320 180 L 320 240" stroke="$lineColor" stroke-width="2" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
</svg>
''';
  }

  static String generatePrototypeSvg(String langCode, ColorScheme colors) {
    final data = const LocV(
      ar: PrototypeDiagramData.ar(),
      en: PrototypeDiagramData.en(),
    )(langCode);

    final bool isRtl = langCode == 'ar';
    final String bgColor = colors.surface.toCssString();
    final String concreteColor = colors.surfaceContainerHighest.toCssString();
    final String lineColor = colors.onSurface.toCssString();
    final String concreteTextColor = colors.onSurfaceVariant.toCssString();

    final String boxStyle =
        'fill="$bgColor" stroke="$lineColor" stroke-width="2"';
    final String concreteBoxStyle =
        'fill="$concreteColor" stroke="$lineColor" stroke-width="2"';
    final String titleStyle =
        'font-family="sans-serif" font-size="14" font-weight="bold" fill="$lineColor" text-anchor="middle"';
    final String methodStyle =
        'font-family="sans-serif" font-size="12" fill="$lineColor" text-anchor="middle"';
    final String interfaceStyle =
        'font-family="sans-serif" font-size="10" fill="$lineColor" text-anchor="middle"';

    return '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 520 280" direction="${isRtl ? 'rtl' : 'ltr'}">
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="9" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="$lineColor" />
    </marker>
  </defs>

  <!-- Client -->
  <g transform="translate(20, 50)">
    <rect $boxStyle width="120" height="60" rx="5" />
    <text x="60" y="35" $titleStyle>${data.client}</text>
  </g>

  <!-- Prototype Interface -->
  <g transform="translate(220, 30)">
    <rect $boxStyle width="140" height="100" rx="5" />
    <text x="70" y="25" $interfaceStyle>&lt;&lt;Interface&gt;&gt;</text>
    <text x="70" y="45" $titleStyle>${data.prototype}</text>
    <line x1="0" y1="60" x2="140" y2="60" stroke="$lineColor" stroke-width="1" />
    <text x="70" y="85" $methodStyle>${data.clone}</text>
  </g>

  <!-- Concrete Prototype 1 -->
  <g transform="translate(140, 200)">
    <rect $concreteBoxStyle width="160" height="60" rx="5" />
    <text x="80" y="35" $titleStyle fill="$concreteTextColor">${data.concretePrototype1}</text>
  </g>

  <!-- Concrete Prototype 2 -->
  <g transform="translate(340, 200)">
    <rect $concreteBoxStyle width="160" height="60" rx="5" />
    <text x="80" y="35" $titleStyle fill="$concreteTextColor">${data.concretePrototype2}</text>
  </g>

  <!-- Arrows -->
  <path d="M 140 80 L 220 80" stroke="$lineColor" stroke-width="2" marker-end="url(#arrowhead)" />
  <path d="M 220 130 L 220 200" stroke="$lineColor" stroke-width="2" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
  <path d="M 420 130 L 420 200" stroke="$lineColor" stroke-width="2" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
  
  <!-- Clone arrows (curved back) -->
  <path d="M 160 200 Q 120 170 160 140" stroke="$lineColor" stroke-width="2" fill="none" stroke-dasharray="3,3" marker-end="url(#arrowhead)" />
  <path d="M 480 200 Q 520 170 480 140" stroke="$lineColor" stroke-width="2" fill="none" stroke-dasharray="3,3" marker-end="url(#arrowhead)" />
</svg>
''';
  }

  static String generateSingletonSvg(String langCode, ColorScheme colors) {
    final data = const LocV(
      ar: SingletonDiagramData.ar(),
      en: SingletonDiagramData.en(),
    )(langCode);

    final bool isRtl = langCode == 'ar';
    final String bgColor = colors.surface.toCssString();
    final String lineColor = colors.onSurface.toCssString();

    final String boxStyle =
        'fill="$bgColor" stroke="$lineColor" stroke-width="2"';
    final String titleStyle =
        'font-family="sans-serif" font-size="14" font-weight="bold" fill="$lineColor" text-anchor="middle"';
    final String methodStyle =
        'font-family="sans-serif" font-size="12" fill="$lineColor" text-anchor="start"';

    return '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 480 200" direction="${isRtl ? 'rtl' : 'ltr'}">
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="9" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="$lineColor" />
    </marker>
  </defs>

  <!-- Client -->
  <g transform="translate(20, 60)">
    <rect $boxStyle width="120" height="60" rx="5" />
    <text x="60" y="35" $titleStyle>${data.client}</text>
  </g>

  <!-- Singleton -->
  <g transform="translate(240, 20)">
    <rect $boxStyle width="220" height="160" rx="5" />
    <text x="110" y="25" $titleStyle>${data.singleton}</text>
    <line x1="0" y1="40" x2="220" y2="40" stroke="$lineColor" stroke-width="1" />
    <text x="10" y="65" $methodStyle>${data.instance}</text>
    <line x1="0" y1="80" x2="220" y2="80" stroke="$lineColor" stroke-width="1" />
    <text x="10" y="105" $methodStyle>${data.constructor}</text>
    <text x="10" y="130" $methodStyle>${data.getInstance}</text>
  </g>

  <!-- Arrows -->
  <path d="M 140 90 L 240 90" stroke="$lineColor" stroke-width="2" marker-end="url(#arrowhead)" />
  
  <!-- Self-reference (instance) -->
  <path d="M 460 60 Q 490 90 460 120" stroke="$lineColor" stroke-width="2" fill="none" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
</svg>
''';
  }

  static String generateObjectPoolSvg(String langCode, ColorScheme colors) {
    final data = const LocV(
      ar: ObjectPoolDiagramData.ar(),
      en: ObjectPoolDiagramData.en(),
    )(langCode);

    final bool isRtl = langCode == 'ar';
    final String bgColor = colors.surface.toCssString();
    final String concreteColor = colors.surfaceContainerHighest.toCssString();
    final String lineColor = colors.onSurface.toCssString();
    final String concreteTextColor = colors.onSurfaceVariant.toCssString();

    final String boxStyle =
        'fill="$bgColor" stroke="$lineColor" stroke-width="2"';
    final String concreteBoxStyle =
        'fill="$concreteColor" stroke="$lineColor" stroke-width="2"';
    final String titleStyle =
        'font-family="sans-serif" font-size="14" font-weight="bold" fill="$lineColor" text-anchor="middle"';
    final String methodStyle =
        'font-family="sans-serif" font-size="12" fill="$lineColor" text-anchor="middle"';
    final String labelStyle =
        'font-family="sans-serif" font-size="11" fill="$lineColor" text-anchor="middle"';

    return '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 540 320" direction="${isRtl ? 'rtl' : 'ltr'}">
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="9" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="$lineColor" />
    </marker>
  </defs>

  <!-- Client -->
  <g transform="translate(20, 90)">
    <rect $boxStyle width="120" height="60" rx="5" />
    <text x="60" y="35" $titleStyle>${data.client}</text>
  </g>

  <!-- Pool -->
  <g transform="translate(220, 50)">
    <rect $boxStyle width="140" height="120" rx="5" />
    <text x="70" y="30" $titleStyle>${data.pool}</text>
    <line x1="0" y1="45" x2="140" y2="45" stroke="$lineColor" stroke-width="1" />
    <text x="70" y="70" $methodStyle>${data.acquire}</text>
    <text x="70" y="90" $methodStyle>${data.release}</text>
  </g>

  <!-- Reusable Objects Container -->
  <g transform="translate(420, 30)">
    <rect $concreteBoxStyle width="100" height="160" rx="5" />
    <text x="50" y="20" $titleStyle fill="$concreteTextColor">${data.reusableObject}</text>
    <line x1="0" y1="35" x2="100" y2="35" stroke="$lineColor" stroke-width="1" />
    
    <!-- Available section -->
    <text x="50" y="55" $labelStyle fill="$concreteTextColor">${data.available}</text>
    <circle cx="50" cy="75" r="8" $concreteBoxStyle />
    <circle cx="30" cy="95" r="8" $concreteBoxStyle />
    <circle cx="70" cy="95" r="8" $concreteBoxStyle />
    
    <line x1="10" y1="115" x2="90" y2="115" stroke="$lineColor" stroke-width="1" stroke-dasharray="3,3" />
    
    <!-- In Use section -->
    <text x="50" y="135" $labelStyle fill="$concreteTextColor">${data.inUse}</text>
    <circle cx="50" cy="155" r="8" fill="${colors.primary.toCssString()}" stroke="$lineColor" stroke-width="2" />
  </g>

  <!-- Arrows -->
  <path d="M 140 120 L 220 120" stroke="$lineColor" stroke-width="2" marker-end="url(#arrowhead)" />
  <path d="M 360 110 L 420 110" stroke="$lineColor" stroke-width="2" marker-end="url(#arrowhead)" />
  
  <!-- Acquire/Release flow -->
  <text x="270" y="30" $labelStyle>${data.acquire}</text>
  <text x="270" y="200" $labelStyle>${data.release}</text>
</svg>
''';
  }

  static String generateLazyInitializationSvg(
    String langCode,
    ColorScheme colors,
  ) {
    final data = const LocV(
      ar: LazyInitializationDiagramData.ar(),
      en: LazyInitializationDiagramData.en(),
    )(langCode);

    final bool isRtl = langCode == 'ar';
    final String bgColor = colors.surface.toCssString();
    final String concreteColor = colors.surfaceContainerHighest.toCssString();
    final String lineColor = colors.onSurface.toCssString();
    final String concreteTextColor = colors.onSurfaceVariant.toCssString();

    final String boxStyle =
        'fill="$bgColor" stroke="$lineColor" stroke-width="2"';
    final String concreteBoxStyle =
        'fill="$concreteColor" stroke="$lineColor" stroke-width="2"';
    final String decisionStyle =
        'fill="${colors.primaryContainer.toCssString()}" stroke="$lineColor" stroke-width="2"';
    final String titleStyle =
        'font-family="sans-serif" font-size="14" font-weight="bold" fill="$lineColor" text-anchor="middle"';
    final String methodStyle =
        'font-family="sans-serif" font-size="12" fill="$lineColor" text-anchor="middle"';
    final String labelStyle =
        'font-family="sans-serif" font-size="11" fill="$lineColor" text-anchor="middle"';

    return '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 580 340" direction="${isRtl ? 'rtl' : 'ltr'}">
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="9" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="$lineColor" />
    </marker>
  </defs>

  <!-- Client -->
  <g transform="translate(20, 90)">
    <rect $boxStyle width="120" height="60" rx="5" />
    <text x="60" y="35" $titleStyle>${data.client}</text>
  </g>

  <!-- Lazy Holder -->
  <g transform="translate(200, 70)">
    <rect $boxStyle width="140" height="100" rx="5" />
    <text x="70" y="30" $titleStyle>${data.lazyHolder}</text>
    <line x1="0" y1="45" x2="140" y2="45" stroke="$lineColor" stroke-width="1" />
    <text x="70" y="70" $methodStyle>${data.getResource}</text>
  </g>

  <!-- Decision Diamond -->
  <g transform="translate(270, 230)">
    <path d="M 0 -30 L 35 0 L 0 30 L -35 0 Z" $decisionStyle />
    <text x="0" y="5" $labelStyle>${data.initialized}</text>
  </g>

  <!-- Yes path - Return cached -->
  <g transform="translate(420, 210)">
    <rect $concreteBoxStyle width="140" height="60" rx="5" />
    <text x="70" y="35" $methodStyle fill="$concreteTextColor">${data.returnCached}</text>
  </g>

  <!-- No path - Create -->
  <g transform="translate(180, 290)">
    <rect $concreteBoxStyle width="100" height="40" rx="5" />
    <text x="50" y="25" $methodStyle fill="$concreteTextColor">${data.create}</text>
  </g>

  <!-- Resource -->
  <g transform="translate(430, 80)">
    <rect $concreteBoxStyle width="120" height="60" rx="5" />
    <text x="60" y="35" $titleStyle fill="$concreteTextColor">${data.resource}</text>
  </g>

  <!-- Arrows -->
  <path d="M 140 120 L 200 120" stroke="$lineColor" stroke-width="2" marker-end="url(#arrowhead)" />
  <path d="M 270 170 L 270 200" stroke="$lineColor" stroke-width="2" marker-end="url(#arrowhead)" />
  
  <!-- Yes branch -->
  <path d="M 305 230 L 420 240" stroke="$lineColor" stroke-width="2" marker-end="url(#arrowhead)" />
  <text x="340" y="225" $labelStyle>${data.yes}</text>
  
  <!-- No branch -->
  <path d="M 270 260 L 270 290 L 230 290" stroke="$lineColor" stroke-width="2" marker-end="url(#arrowhead)" />
  <text x="250" y="285" $labelStyle>${data.no}</text>
  
  <!-- Create to cache -->
  <path d="M 230 310 L 230 270 L 420 270" stroke="$lineColor" stroke-width="2" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
  
  <!-- Resource reference -->
  <path d="M 340 120 L 430 120" stroke="$lineColor" stroke-width="2" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
</svg>
''';
  }

  static String generateMultitonSvg(String langCode, ColorScheme colors) {
    final data = const LocV(
      ar: MultitonDiagramData.ar(),
      en: MultitonDiagramData.en(),
    )(langCode);

    final bool isRtl = langCode == 'ar';
    final String bgColor = colors.surface.toCssString();
    final String concreteColor = colors.surfaceContainerHighest.toCssString();
    final String lineColor = colors.onSurface.toCssString();
    final String concreteTextColor = colors.onSurfaceVariant.toCssString();

    final String boxStyle =
        'fill="$bgColor" stroke="$lineColor" stroke-width="2"';
    final String concreteBoxStyle =
        'fill="$concreteColor" stroke="$lineColor" stroke-width="2"';
    final String titleStyle =
        'font-family="sans-serif" font-size="14" font-weight="bold" fill="$lineColor" text-anchor="middle"';
    final String methodStyle =
        'font-family="sans-serif" font-size="12" fill="$lineColor" text-anchor="start"';
    final String instanceStyle =
        'font-family="sans-serif" font-size="11" fill="$concreteTextColor" text-anchor="middle"';

    return '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 580 280" direction="${isRtl ? 'rtl' : 'ltr'}">
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="9" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="$lineColor" />
    </marker>
  </defs>

  <!-- Client -->
  <g transform="translate(20, 70)">
    <rect $boxStyle width="120" height="60" rx="5" />
    <text x="60" y="35" $titleStyle>${data.client}</text>
  </g>

  <!-- Multiton -->
  <g transform="translate(200, 40)">
    <rect $boxStyle width="180" height="120" rx="5" />
    <text x="90" y="25" $titleStyle>${data.multiton}</text>
    <line x1="0" y1="40" x2="180" y2="40" stroke="$lineColor" stroke-width="1" />
    <text x="10" y="65" $methodStyle>${data.instances}</text>
    <line x1="0" y1="80" x2="180" y2="80" stroke="$lineColor" stroke-width="1" />
    <text x="10" y="105" $methodStyle>${data.getInstance}</text>
  </g>

  <!-- Instance Registry -->
  <g transform="translate(440, 20)">
    <rect $concreteBoxStyle width="120" height="180" rx="5" />
    <text x="60" y="25" $titleStyle fill="$concreteTextColor">Registry</text>
    <line x1="0" y1="40" x2="120" y2="40" stroke="$lineColor" stroke-width="1" />
    
    <rect x="10" y="50" width="100" height="35" $concreteBoxStyle rx="3" />
    <text x="60" y="70" $instanceStyle>${data.instance1}</text>
    
    <rect x="10" y="95" width="100" height="35" $concreteBoxStyle rx="3" />
    <text x="60" y="115" $instanceStyle>${data.instance2}</text>
    
    <rect x="10" y="140" width="100" height="35" $concreteBoxStyle rx="3" />
    <text x="60" y="160" $instanceStyle>${data.instance3}</text>
  </g>

  <!-- Arrows -->
  <path d="M 140 100 L 200 100" stroke="$lineColor" stroke-width="2" marker-end="url(#arrowhead)" />
  <path d="M 380 100 L 440 100" stroke="$lineColor" stroke-width="2" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
</svg>
''';
  }

  static String generateFactoryKitSvg(String langCode, ColorScheme colors) {
    final data = const LocV(
      ar: FactoryKitDiagramData.ar(),
      en: FactoryKitDiagramData.en(),
    )(langCode);

    final bool isRtl = langCode == 'ar';
    final String bgColor = colors.surface.toCssString();
    final String concreteColor = colors.surfaceContainerHighest.toCssString();
    final String lineColor = colors.onSurface.toCssString();
    final String concreteTextColor = colors.onSurfaceVariant.toCssString();

    final String boxStyle =
        'fill="$bgColor" stroke="$lineColor" stroke-width="2"';
    final String concreteBoxStyle =
        'fill="$concreteColor" stroke="$lineColor" stroke-width="2"';
    final String registryStyle =
        'fill="${colors.primaryContainer.toCssString()}" stroke="$lineColor" stroke-width="2"';
    final String titleStyle =
        'font-family="sans-serif" font-size="14" font-weight="bold" fill="$lineColor" text-anchor="middle"';
    final String methodStyle =
        'font-family="sans-serif" font-size="12" fill="$lineColor" text-anchor="middle"';
    final String labelStyle =
        'font-family="sans-serif" font-size="11" fill="$lineColor" text-anchor="middle"';
    final String interfaceStyle =
        'font-family="sans-serif" font-size="10" fill="$lineColor" text-anchor="middle"';

    return '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 680 340" direction="${isRtl ? 'rtl' : 'ltr'}">
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="9" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="$lineColor" />
    </marker>
  </defs>

  <!-- Client -->
  <g transform="translate(20, 90)">
    <rect $boxStyle width="120" height="60" rx="5" />
    <text x="60" y="35" $titleStyle>${data.client}</text>
  </g>

  <!-- Factory Kit -->
  <g transform="translate(200, 50)">
    <rect $boxStyle width="180" height="140" rx="5" />
    <text x="90" y="30" $titleStyle>${data.factoryKit}</text>
    <line x1="0" y1="45" x2="180" y2="45" stroke="$lineColor" stroke-width="1" />
    <text x="90" y="70" $methodStyle>${data.register}</text>
    <text x="90" y="90" $methodStyle>${data.create}</text>
  </g>

  <!-- Registry -->
  <g transform="translate(220, 250)">
    <rect $registryStyle width="140" height="70" rx="5" />
    <text x="70" y="25" $titleStyle>${data.registry}</text>
    <text x="70" y="45" $labelStyle>${data.factory1}</text>
    <text x="70" y="60" $labelStyle>${data.factory2}</text>
  </g>

  <!-- Product Interface -->
  <g transform="translate(460, 80)">
    <rect $boxStyle width="120" height="60" rx="5" />
    <text x="60" y="20" $interfaceStyle>&lt;&lt;Interface&gt;&gt;</text>
    <text x="60" y="40" $titleStyle>${data.product}</text>
  </g>

  <!-- Product 1 -->
  <g transform="translate(440, 200)">
    <rect $concreteBoxStyle width="80" height="50" rx="5" />
    <text x="40" y="30" $titleStyle fill="$concreteTextColor">${data.product1}</text>
  </g>

  <!-- Product 2 -->
  <g transform="translate(560, 200)">
    <rect $concreteBoxStyle width="80" height="50" rx="5" />
    <text x="40" y="30" $titleStyle fill="$concreteTextColor">${data.product2}</text>
  </g>

  <!-- Arrows -->
  <path d="M 140 120 L 200 120" stroke="$lineColor" stroke-width="2" marker-end="url(#arrowhead)" />
  <path d="M 290 190 L 290 250" stroke="$lineColor" stroke-width="2" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
  <path d="M 380 110 L 460 110" stroke="$lineColor" stroke-width="2" marker-end="url(#arrowhead)" />
  
  <!-- Registry to products -->
  <path d="M 280 250 L 280 220 L 440 220" stroke="$lineColor" stroke-width="2" stroke-dasharray="3,3" marker-end="url(#arrowhead)" />
  <path d="M 300 250 L 300 230 L 560 230" stroke="$lineColor" stroke-width="2" stroke-dasharray="3,3" marker-end="url(#arrowhead)" />
  
  <!-- Product implementations -->
  <path d="M 480 140 L 480 200" stroke="$lineColor" stroke-width="2" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
  <path d="M 600 140 L 600 200" stroke="$lineColor" stroke-width="2" stroke-dasharray="5,5" marker-end="url(#arrowhead)" />
</svg>
''';
  }
}
