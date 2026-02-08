import 'dart:ui';

class LocalizedValue<E> {
  const LocalizedValue({required this.en, required this.ar});

  final E en, ar;

  E get(Locale locale) => switch (locale.languageCode) {
    "ar" => ar,
    _ => en,
  };

  E call(Locale locale) => get(locale);

  Map<String, E> toMap() => {"en": en, "ar": ar};

  @override
  int get hashCode => en.hashCode ^ ar.hashCode;

  @override
  bool operator ==(Object other) {
    return other is LocalizedValue && other.en == en && other.ar == ar;
  }
}

class LocalizedString extends LocalizedValue<String> {
  const LocalizedString({required super.en, required super.ar});
}
