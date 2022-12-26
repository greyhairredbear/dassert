import 'package:test/expect.dart';

/// Utils for asserting string contains certain values
extension StringContainsMatcher on String {
  /// Asserts that the string includes the given [substring].
  /// The [substring] can be equal to the string.
  /// This matcher is case sensitive.
  /// To make this case insensitive use [shouldContainIgnoringCase]
  void shouldContainSubstring(String substring) {
    expect(this, contains(substring));
  }

  /// Asserts that the string contains the [substring] ignoring case.
  void shouldContainIgnoringCase(String substring) {
    expect(
      this,
      TypeMatcher<String>().having(
        (p0) => p0.toLowerCase(),
        'contains ignoring case',
        contains(substring.toLowerCase()),
      ),
    );
  }
}
