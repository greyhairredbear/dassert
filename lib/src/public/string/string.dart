import 'package:characters/characters.dart';
import 'package:dassert/dassert.dart';
import 'package:test/test.dart';

/// Utils for asserting string values
extension StringMatcher on String {
  /// Asserts that the string contains only whitespace, or is empty.
  String shouldBeBlank() => trim().should(isEmpty);

  /// Asserts that the string has length zero.
  String shouldBeEmpty() => should(isEmpty);

  /// Asserts that the string is all in lower case.
  String shouldBeLowerCase() => shouldBe(toLowerCase());

  /// Asserts that the string is all in upper case.
  String shouldBeUpperCase() => shouldBe(toUpperCase());

  /// Asserts that the string is truthy. Truthy is one of the followings: ["true", "yes", "y", "1"]
  String shouldBeTruthy() => should(predicate((String s) => ['true', 'yes', 'y', '1'].contains(s)));

  /// Asserts that the string is falsy. Falsy is one of the followings: ["false", "no", "n", "0"]
  String shouldBeFalsy() => should(predicate((String s) => ['false', 'no', 'n', '0'].contains(s)));

  /// Asserts that the string is equal to [other] ignoring case.
  String shouldBeEqualIgnoringCase(String other) =>
      should(predicate((String s) => s.toLowerCase() == other.toLowerCase()));

  /// Asserts that the string is no shorter than the given [min] length.
  String shouldHaveMinLength(int min) => should(predicate((String s) => s.length >= min));

  /// Asserts that the string is no longer than the given [max] length.
  String shouldHaveMaxLength(int max) => should(predicate((String s) => s.length <= max));

  /// Asserts that the string has the given [length].
  String shouldHaveLength(int length) => should(predicate((String s) => s.length == length));

  /// Asserts that the string contains the given number of lines.
  String shouldHaveLineCount(int count) =>
      // TODO: replace predicate with dartx count once implemented and merged?
      should(predicate((String s) => s.characters.where((c) => c == '\n').length + 1 == count));

  /// Asserts that the string has the same length as [other] string.
  String shouldHaveSameLengthAs(String other) =>
      should(predicate((String s) => s.length == other.length));

  /// Asserts that the string contains an integer and returns it.
  ///
  /// The [radix] must be in the range 2..36. The digits used are
  /// first the decimal digits 0..9, and then the letters 'a'..'z' with
  /// values 10 through 35. Also accepts upper-case letters with the same
  /// values as the lower-case ones.
  ///
  /// If no [radix] is given then it defaults to 10.
  int shouldBeInteger({int radix = 10}) {
    final result = int.tryParse(this, radix: radix);
    if (result == null) {
      fail('"$this" is not an int with radix $radix!');
    }

    return result;
  }
}
