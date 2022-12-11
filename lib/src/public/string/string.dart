import 'package:test/test.dart';

/// Utils for asserting string values
extension StringMatcher on String {
  /// Asserts that the string contains only whitespace, or is empty.
  void shouldBeBlank() {
    expect(trim(), isEmpty);
  }

  /// Asserts that the string has length zero.
  void shouldBeEmpty() {
    expect(this, isEmpty);
  }

  /// Asserts that the string is all in lower case.
  void shouldBeLowerCase() {
    expect(this, toLowerCase());
  }

  /// Asserts that the string is all in upper case.
  void shouldBeUpperCase() {
    expect(this, toUpperCase());
  }
}
