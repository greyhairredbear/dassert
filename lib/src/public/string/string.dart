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
}
