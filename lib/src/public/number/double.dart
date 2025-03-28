import 'package:dassert/dassert.dart';
import 'package:test/expect.dart';

/// Utils for asserting [double] values
/// in ways which cannot be covered by [NumMatchers].
extension DoubleMatchers on double {
  /// Asserts that the double is equal to the given [value] within a [tolerance] range. This is the recommended way of testing for double equality.
  double shouldBeWithTolerance(double value, double tolerance) => should(closeTo(value, tolerance));

  /// Asserts that the double is positive infinity
  double shouldBePositiveInfinity() => shouldBe(double.infinity);

  /// Asserts that the double is negative infinity
  double shouldBeNegativeInfinity() => shouldBe(double.negativeInfinity);

  /// Asserts that the double is finite, i.e. not positive/negative infinity or NaN
  double shouldBeFinite() =>
      shouldNotBe(double.infinity).shouldNotBe(double.negativeInfinity).shouldNotBeNaN();

  /// Asserts that the double is the Not-a-Number constant NaN
  double shouldBeNaN() => should(isNaN);

  /// Asserts that the double is not the Not-a-Number constant NaN
  double shouldNotBeNaN() => should(isNotNaN);
}
