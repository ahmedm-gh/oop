import 'package:flutter/material.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    required this.child,
    this.padding = const .symmetric(horizontal: 7.5, vertical: 2.5),
    super.key,
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Chip(padding: padding, label: child);
  }
}
