import 'dart:math';

import 'package:dassert/src/internal/should_fail.dart';
import 'package:dassert/src/public/number/number.dart';
import 'package:glados/glados.dart';

final int64MaxValue = double.maxFinite.toInt();
const minDif = 0.0000001;

/// Asserts that the long is even.
// long.shouldBeEven()

/// Asserts that the long is odd.
// long.shouldBeOdd()

/// Asserts that the double is equal to the given value within a tolerance range. This is the recommended way of testing for double equality.
// double.shouldBe(value plusOrMinus(tolerance))

/// Asserts that the double is positive infinity
// double.shouldBePositiveInfinity()

/// Asserts that the double is negative infinity
// double.shouldBeNegativeInfinity()

/// Asserts that the double is the Not-a-Number constant NaN
// double.shouldBeNaN()

void main() {
  Glados(any.positiveInt).test('Positive ints', _assertPositiveNumberProperties);
  Glados(any.positiveDouble).test('Positive doubles', _assertPositiveNumberProperties);

  Glados(any.negativeInt).test('Negative ints', _assertNegativeNumberProperties);
  Glados(any.negativeDouble).test('Negative doubles', _assertNegativeNumberProperties);

  Glados2(any.intInRange(-42, 42), any.intInRange(42, 2903))
      .test('Int comparison', _assertNumberOrdering);

  Glados2(any.doubleInRange(-1337.1337, -10), any.doubleInRange(-10, pi + e + sqrt2))
      .test('Double comparison', _assertNumberOrdering);

  test('Zero', () {
    0.shouldBeZero();
    0.shouldBeNonPositive();
    0.shouldBeNonNegative();
    shouldFail(() => 0.shouldNotBeZero());
    0.0.shouldBeZero();
    0.0.shouldBeNonPositive();
    0.0.shouldBeNonNegative();
    shouldFail(() => 0.0.shouldNotBeZero());
  });

  test('Equality', () {
    42.shouldBeLessThanOrEqual(42);
    -1.shouldBeGreaterThanOrEqual(-1);
    pi.shouldBeLessThanOrEqual(pi);
    e.shouldBeGreaterThanOrEqual(e);
  });
}

void _assertPositiveNumberProperties(num positiveNumber) {
  positiveNumber.shouldNotBeZero();
  positiveNumber.shouldBePositive();
  positiveNumber.shouldBeGreaterThan(0);
  positiveNumber.shouldBeNonNegative();
  shouldFail(() => positiveNumber.shouldBeZero());
  shouldFail(() => positiveNumber.shouldBeNegative());
  shouldFail(() => positiveNumber.shouldBeNonPositive());
}

void _assertNegativeNumberProperties(num negativeNumber) {
  negativeNumber.shouldNotBeZero();
  negativeNumber.shouldBeNegative();
  negativeNumber.shouldBeLessThan(0);
  negativeNumber.shouldBeNonPositive();
  shouldFail(() => negativeNumber.shouldBeZero());
  shouldFail(() => negativeNumber.shouldBePositive());
  shouldFail(() => negativeNumber.shouldBeNonNegative());
}

void _assertNumberOrdering(num lesser, num greater) {
  lesser.shouldBeLessThan(greater);
  shouldFail(() => greater.shouldBeLessThan(lesser));
  lesser.shouldBeLessThanOrEqual(greater);
  shouldFail(() => greater.shouldBeLessThanOrEqual(lesser));

  greater.shouldBeGreaterThan(lesser);
  shouldFail(() => lesser.shouldBeGreaterThan(greater));
  greater.shouldBeGreaterThanOrEqual(lesser);
  shouldFail(() => lesser.shouldBeGreaterThanOrEqual(greater));
}
