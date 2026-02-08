import 'package:tuts/core/enums/code_quality.dart';

class StrCodeBlock {
  const StrCodeBlock(this.value, {this.codeQuality = .normal});

  const StrCodeBlock.good(this.value) : codeQuality = .good;

  const StrCodeBlock.bad(this.value) : codeQuality = .bad;

  final String value;
  final CodeQuality codeQuality;

  static const empty = StrCodeBlock("");

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    return other is StrCodeBlock && other.value == value;
  }
}
