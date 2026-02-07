import "package:flutter/material.dart";
import "package:oop_tut/core/extensions.dart";
import "package:oop_tut/l10n/app_localizations.dart";
import "package:oop_tut/shared/widgets/app_widgets.dart";
import "package:oop_tut/core/design_patterns_data.dart";

class PatternDetailsPage extends StatelessWidget {
  final String patternKey;
  final String patternName;

  const PatternDetailsPage({
    super.key,
    required this.patternKey,
    required this.patternName,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final description = _getPatternDescription(l10n, patternKey);
    final data = DesignPatternData.getCode(patternKey);
    final textTheme = context.textTheme;
    final String? note = _getNote(l10n, data["noteKey"]);

    return Scaffold(
      appBar: AppBar(title: Text(patternName)),
      body: SingleChildScrollView(
        padding: const .all(16),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Text(
              l10n.details,
              style: textTheme.titleLarge?.copyWith(fontWeight: .bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textDirection: BidiUtil.getDirection(description),
            ),
            const SizedBox(height: 24),

            // Bad Example
            if (data["bad"] != null) ...[
              Text(
                l10n.badExample,
                style: textTheme.titleMedium?.copyWith(
                  color: Colors.red,
                  fontWeight: .bold,
                ),
              ),
              CodeBlock(code: data["bad"]!, isBad: true),
              const SizedBox(height: 16),
            ],

            // Good Example
            if (data["good"] != null) ...[
              Text(
                l10n.goodExample,
                style: textTheme.titleMedium?.copyWith(
                  color: Colors.green,
                  fontWeight: .bold,
                ),
              ),
              CodeBlock(code: data["good"]!),
              const SizedBox(height: 16),
            ],

            if (note != null) NotesWidget(note: note),

            if (data["refs"] != null) ...[
              const SizedBox(height: 24),
              ReferenceWidget(urls: List<String>.from(data["refs"])),
            ],
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  String? _getNote(AppLocalizations l10n, String? key) {
    if (key == null) return null;
    return switch (key) {
      "singletonNote" => l10n.singletonNote,
      "factoryMethodNote" => l10n.factoryMethodNote,
      "builderNote" => l10n.builderNote,
      _ => null,
    };
  }

  String _getPatternDescription(AppLocalizations l10n, String key) {
    return switch (key) {
      "factoryMethod" => l10n.factoryMethodDesc,
      "abstractFactory" => l10n.abstractFactoryDesc,
      "builder" => l10n.builderDesc,
      "prototype" => l10n.prototypeDesc,
      "singleton" => l10n.singletonDesc,
      "adapter" => l10n.adapterDesc,
      "bridge" => l10n.bridgeDesc,
      "composite" => l10n.compositeDesc,
      "decorator" => l10n.decoratorDesc,
      "facade" => l10n.facadeDesc,
      "flyweight" => l10n.flyweightDesc,
      "proxy" => l10n.proxyDesc,
      "chainOfResponsibility" => l10n.chainOfResponsibilityDesc,
      "command" => l10n.commandDesc,
      "iterator" => l10n.iteratorDesc,
      "interpreter" => l10n.interpreterDesc,
      "mediator" => l10n.mediatorDesc,
      "memento" => l10n.mementoDesc,
      "observer" => l10n.observerDesc,
      "state" => l10n.stateDesc,
      "strategy" => l10n.strategyDesc,
      "templateMethod" => l10n.templateMethodDesc,
      "visitor" => l10n.visitorDesc,
      _ => l10n.seeMore,
    };
  }
}
