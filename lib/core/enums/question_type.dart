import '../../l10n/app_localizations.dart';

enum QuestionType {
  theoretical,
  practical;

  bool get isTheoretical => this == .theoretical;
  bool get isPractical => this == .practical;

  String label(AppLocalizations l10n) {
    return switch (this) {
      .theoretical => l10n.theoretical,
      .practical => l10n.practical,
    };
  }
}
