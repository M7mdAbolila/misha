class AppRegexp {
  static String getAnimalNameFromResult(String text) {
    RegExp regExp =
        RegExp(r'\b(Cat|Turtle|Dog|Deer|Lion)\b', caseSensitive: false);

    Iterable<RegExpMatch> matches = regExp.allMatches(text);

    for (RegExpMatch match in matches) {
      return match.group(0).toString();
    }
    return '';
  }
}
