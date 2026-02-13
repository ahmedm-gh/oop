import 'package:flutter/material.dart';

/// Design Layouts
abstract class DL {
  // Values
  static const double listPaddingValue = 16;

  // Edge Insets
  static const EdgeInsets pagePadding = .all(16);

  static const EdgeInsets listPadding = .all(listPaddingValue);
  static const EdgeInsets listHorizontalBottomPadding = .only(
    left: listPaddingValue,
    right: listPaddingValue,
    bottom: listPaddingValue,
  );

  static const EdgeInsets inListCardPadding = .all(16);
  static const EdgeInsets inListCardMargin = .all(16);

  // Radius
  static const BorderRadius inListCardBorderRadius = .all(.circular(16));

  static const BorderRadius inCardRadius = .all(.circular(6));

  // Separator
  static const double listSeparatorHeight = listPaddingValue;
  static const double compactListSeparatorHeight = listPaddingValue / 2;
}
