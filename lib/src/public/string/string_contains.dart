import 'package:dassert/dassert.dart';
import 'package:test/expect.dart';

/// Utils for asserting string contains certain values
extension StringContainsMatcher on String {
  /// Asserts that the string includes the given [substring].
  /// The [substring] can be equal to the string.
  /// This matcher is case sensitive.
  /// To make this case insensitive use [shouldContainIgnoringCase]
  String shouldContainSubstring(String substring) => should(contains(substring));

  /// Asserts that the string contains the [substring] ignoring case.
  String shouldContainIgnoringCase(String substring) => should(
        TypeMatcher<String>().having(
          (p0) => p0.toLowerCase(),
          'contains ignoring case',
          contains(substring.toLowerCase()),
        ),
      );
}
