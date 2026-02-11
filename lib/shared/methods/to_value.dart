T toValue<T>(dynamic value, T fallback) {
  if (fallback == null) {
    assert(
      T.toString().contains("?"),
      "ReturnType is required ( $T, fallback is $fallback )",
    );
  }
  return (value is T) && (T.toString() != "dynamic") ? value : fallback;
}
