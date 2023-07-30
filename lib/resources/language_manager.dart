// ignore_for_file: constant_identifier_names

enum LanguageType {
  ENGLISH,
  JAPANESE,
}

const String ENGLISH = "en";
const String JAPANESE = "ja";

extension LanguageTypeExtention on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.JAPANESE:
        return JAPANESE;
      default:
        return ENGLISH;
    }
  }
}
