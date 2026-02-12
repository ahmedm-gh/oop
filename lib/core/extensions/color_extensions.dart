import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  Color get pairedColor {
    return computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}
