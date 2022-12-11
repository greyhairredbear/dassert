import 'package:test/expect.dart';

/// Utils for asserting string contains certain values
extension StringContainseMatcher on String {
  /// Asserts that the string includes the given [substring].
  /// The [substring] can be equal to the string.
  /// This matcher is case sensitive.
  /// To make this case insensitive use [shouldContainIgnoringCase]
  void shouldContainSubstring(String substring) {
    // TODO: assertion message might be improved (stringcontainsinorder msg seems pretty specific)
    expect(this, stringContainsInOrder([substring]));
  }

  /// Asserts that the string contains the [substring] ignoring case.
  void shouldContainIgnoringCase(String substring) {
    throw UnimplementedError('todo');
  }
}
