import 'package:dassert/dassert.dart';
import 'package:test/expect.dart';

/// Utils for asserting string contains certain values
extension StringRegexMatcher on String {
  /// Asserts that the string includes the given [regex].
  String shouldContain(Pattern regex) => should(matches(regex));

  /// Asserts that the string fully matches the given [regex].
  String shouldMatch(Pattern regex) => should(predicate(
        (String actual) => regex.matchAsPrefix(this)?.group(0) == this,
        '\'$this\' should match pattern \'$regex\' exactly',
      ));
}
