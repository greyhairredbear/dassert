import 'package:test/test.dart';

/// Basic utils for asserting string values
extension StringMatcher on String {
  /// Asserts that the string contains only whitespace, or is empty.
  void shouldBeBlank() {
    expect(trim(), isEmpty);
  }

  /// Asserts that the string has length zero.
  void shouldBeEmpty() {
    expect(this, isEmpty);
  }
}
