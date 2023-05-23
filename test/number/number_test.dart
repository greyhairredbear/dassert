import 'dart:math';

import 'package:dassert/src/internal/should_fail.dart';
import 'package:dassert/src/public/number/number.dart';
import 'package:glados/glados.dart';

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
