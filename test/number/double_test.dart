import 'package:dassert/src/internal/should_fail.dart';
import 'package:dassert/src/public/number/double.dart';
import 'package:glados/glados.dart';

void main() {
  test('positive infinity', () {
    double.infinity.shouldBePositiveInfinity();
    shouldFail(() => double.infinity.shouldBeNegativeInfinity());
    shouldFail(() => double.infinity.shouldBeFinite());
    shouldFail(() => double.infinity.shouldBeNaN());
  });

  test('negative infinity', () {
    double.negativeInfinity.shouldBeNegativeInfinity();
    shouldFail(() => double.negativeInfinity.shouldBePositiveInfinity());
    shouldFail(() => double.negativeInfinity.shouldBeFinite());
    shouldFail(() => double.negativeInfinity.shouldBeNaN());
  });

  test('NaN', () {
    double.nan.shouldBeNaN();
    shouldFail(() => double.nan.shouldBePositiveInfinity());
    shouldFail(() => double.nan.shouldBeNegativeInfinity());
    shouldFail(() => double.nan.shouldBeFinite());
    shouldFail(() => double.nan.shouldNotBeNaN());
  });

  Glados(any.double).test('finiteness', (input) => input.shouldBeFinite());

  Glados3(
    any.doubleInRange(-100000, 10000),
    any.doubleInRange(-2.5, 2.5),
    any.doubleInRange(2.5, 20.0),
  ).test(
    'shouldBeWithTolerance',
    (number, variance, tolerance) {
      (number + variance).shouldBeWithTolerance(number, tolerance);
    },
  );
}
