import 'package:loopsbase/core/models/localized_text.dart';

class FactoryDiagramData {
  const FactoryDiagramData.en({
    this.client = "Client",
    this.creator = "Creator",
    this.factoryMethod = "factoryMethod()",
    this.productInterface = "Product",
    this.concreteCreator = "ConcreteCreator",
    this.concreteProduct = "ConcreteProduct",
  });

  const FactoryDiagramData.ar({
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

abstract class Diagrams {
  static String generateFactorySvg(String langCode) {
    final data = const LocV(
      ar: FactoryDiagramData.ar(),
      en: FactoryDiagramData.en(),
    ).call(langCode);

    // We use Dart's triple-quote syntax for multi-line strings
    return '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 400">
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="9" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="#333333" />
    </marker>
    <filter id="shadow" x="-20%" y="-20%" width="140%" height="140%">
      <feDropShadow dx="2" dy="2" stdDeviation="3" flood-color="#000000" flood-opacity="0.2"/>
    </filter>
  </defs>

  <style>
    .box { fill: #ffffff; stroke: #333333; stroke-width: 2px; rx: 5; filter: url(#shadow); }
    .box-concrete { fill: #f0f4f8; stroke: #2c3e50; stroke-width: 2px; rx: 5; filter: url(#shadow); }
    .title { font-family: sans-serif; font-size: 16px; font-weight: bold; fill: #333333; text-anchor: middle; }
    .method { font-family: monospace; font-size: 14px; fill: #555555; text-anchor: middle; }
    .connector { stroke: #333333; stroke-width: 2px; fill: none; marker-end: url(#arrowhead); }
    .dashed { stroke-dasharray: 5, 5; }
    .divider { stroke: #333333; stroke-width: 1px; }
  </style>

  <!-- Client -->
  <g transform="translate(50, 50)">
    <rect class="box" width="120" height="60" />
    <text x="60" y="35" class="title">${data.client}</text>
  </g>

  <!-- Creator -->
  <g transform="translate(270, 30)">
    <rect class="box" width="200" height="100" />
    <text x="100" y="30" class="title">${data.creator}</text>
    <line x1="0" y1="45" x2="200" y2="45" class="divider" />
    <text x="100" y="75" class="method">${data.factoryMethod}</text>
  </g>

  <!-- Product Interface -->
  <g transform="translate(550, 50)">
    <rect class="box" width="180" height="60" />
    <text x="90" y="35" class="title">&lt;&lt;Interface&gt;&gt;</text>
    <text x="90" y="52" class="title" font-size="14">${data.productInterface}</text>
  </g>

  <!-- Concrete Creator -->
  <g transform="translate(270, 250)">
    <rect class="box-concrete" width="200" height="60" />
    <text x="100" y="35" class="title">${data.concreteCreator}</text>
  </g>

  <!-- Concrete Product -->
  <g transform="translate(550, 250)">
    <rect class="box-concrete" width="180" height="60" />
    <text x="90" y="35" class="title">${data.concreteProduct}</text>
  </g>

  <!-- CONNECTIONS -->
  <path d="M 170 80 L 270 80" class="connector" />
  <path d="M 470 80 L 550 80" class="connector" />
  <path d="M 370 130 L 370 240" class="connector dashed" />
  <path d="M 640 110 L 640 240" class="connector dashed" />
</svg>
''';
  }
}
