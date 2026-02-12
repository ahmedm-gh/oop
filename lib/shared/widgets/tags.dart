import 'package:flutter/material.dart';
import 'package:tuts/core/extensions/extensions.dart';

class Tags extends StatelessWidget {
  const Tags({required this.tags, super.key});

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return DefaultTextStyle.merge(
      style: TextStyle(color: colors.primary, fontSize: 12, fontWeight: .bold),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: tags
            .map(
              (tag) => Text(
                "#${tag.replaceAll(" ", "_")}",
                textDirection: tag.getDirection(),
              ),
            )
            .toList(),
      ),
    );
  }
}
