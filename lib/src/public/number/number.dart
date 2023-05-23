import 'package:dassert/src/public/should.dart';
import 'package:test/expect.dart';

/// Wrapper extension class for [num].
extension NumMatchers on num {
  /// Asserts that the number is between x and y, inclusive on both x and y
  num shouldBeBetween(num x, num y) {
    final upperBound = y >= x ? y : x;
    final lowerBound = y <= x ? y : x;
    should(greaterThanOrEqualTo(lowerBound));
    should(lessThanOrEqualTo(upperBound));
    return this;
  }
}
