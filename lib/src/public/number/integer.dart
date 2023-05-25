import 'package:dassert/dassert.dart';
import 'package:test/test.dart';

/// Utils for asserting [int] values
/// in ways which cannot be covered by [NumMatchers].
extension IntMatchers on int {
  /// Asserts that the integer is even.
  int shouldBeEven() => should(predicate((int n) => n.isEven));

  /// Asserts that the integer is odd.
  int shouldBeOdd() => should(predicate((int n) => n.isOdd));
}
