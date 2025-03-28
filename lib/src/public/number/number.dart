import 'package:dassert/src/public/should.dart';
import 'package:test/expect.dart';

/// Utils for asserting [num] values.
extension NumMatchers on num {
  /// Asserts that the number is less than the given value [n]
  num shouldBeLessThan(num n) => should(lessThan(n));

  /// Asserts that the number is less than or equal to the given value [n]
  num shouldBeLessThanOrEqual(num n) => should(lessThanOrEqualTo(n));

  /// Asserts that the number is greater than the given value [n]
  num shouldBeGreaterThan(num n) => should(greaterThan(n));

  /// Asserts that the number is greater than or equal to the given value [n]
  num shouldBeGreaterThanOrEqual(num n) => should(greaterThanOrEqualTo(n));

  /// Asserts that the number is zero
  num shouldBeZero() => should(isZero);

  /// Asserts that the number is not zero
  num shouldNotBeZero() => should(isNonZero);

  /// Asserts that the number is positive
  num shouldBePositive() => should(isPositive);

  /// Asserts that the number is non-positive (i.e. <= 0)
  num shouldBeNonPositive() => should(isNonPositive);

  /// Asserts that the number is negative
  num shouldBeNegative() => should(isNegative);

  /// Asserts that the number is non-negative (i.e. >= 0)
  num shouldBeNonNegative() => should(isNonNegative);

  /// Asserts that the number is between x and y, inclusive on both x and y
  num shouldBeBetween(num x, num y) {
    final upperBound = y >= x ? y : x;
    final lowerBound = y <= x ? y : x;
    should(greaterThanOrEqualTo(lowerBound));
    should(lessThanOrEqualTo(upperBound));
    return this;
  }
}
