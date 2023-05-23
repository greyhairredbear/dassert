import 'package:dassert/dassert.dart';
import 'package:test/test.dart';

/// Wrapper extension class for [int].
extension NumMatchers on int {
  /// Asserts that the integer is even.
  int shouldBeEven() => should(predicate((int n) => n.isEven));

  /// Asserts that the integer is odd.
  int shouldBeOdd() => should(predicate((int n) => n.isOdd));
}
