import 'dart:ui';

import 'package:intl/intl.dart' as intl;

extension BidiUtil on String {
  /// Returns estimate direction of the text.
  ///
  /// If the string is empty, returns `null`.
  TextDirection? get textDirection {
    if (isEmpty) return null;
    return intl.Bidi.detectRtlDirectionality(this) ? .rtl : .ltr;
  }

  /// Returns the text with LTR direction.
  String get ltr => isEmpty ? this : "\u2066$this\u2069";

  String safeBidi() {
    return replaceAllMapped(
      RegExp(
        r'\.?[a-zA-Z_][a-zA-Z0-9_]*(?:[\.\s\-\/:]+[a-zA-Z_][a-zA-Z0-9_]*)*(?:\s*\([^)]*\))?'
        r'|\([^)]*\)',
      ),
      (match) {
        final segment = match.group(0) ?? "";
        if (RegExp(r'[a-zA-Z0-9]').hasMatch(segment)) {
          return segment.ltr;
        }
        return segment;
      },
    );
  }
}
