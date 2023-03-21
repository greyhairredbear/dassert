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
}
