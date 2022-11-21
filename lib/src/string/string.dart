import 'package:dassert/dassert.dart';

/// Basic utils for asserting string values
extension StringMatcher on String {
  /// Asserts that the string contains only whitespace, or is empty.
  void shouldBeBlank() {
    trim().isEmpty.shouldBeTrue();
  }
}
