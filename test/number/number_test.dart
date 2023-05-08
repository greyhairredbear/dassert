// class _TestSpec extends BaseTestSpec {
//   final num input;
//   final num lowerBound;
//   final num upperBound;
//
//   _TestSpec({
//     required String name,
//     required this.input,
//     required this.lowerBound,
//     required this.upperBound,
//   }) : super(name);
// }

final int64MaxValue = double.maxFinite.toInt();
const minDif = 0.0000001;

/// Asserts that the long is less than the given value n
// long.shouldBeLessThan(n)

/// Asserts that the long is less or equal to than the given value n
//long.shouldBeLessThanOrEqual(n)

/// Asserts that the long is greater than the given value n
// long.shouldBeGreaterThan(n)

/// Asserts that the long is greater than or equal to the given value n
// long.shouldBeGreaterThanOrEqual(n)

/// Asserts that the long is included in the given range.
// long.shouldBeInRange(range)

/// Asserts that the long is even.
// long.shouldBeEven()

/// Asserts that the long is odd.
// long.shouldBeOdd()

/// Asserts that the long is zero
// long.shouldBeZero()

/// Asserts that the double is equal to the given value within a tolerance range. This is the recommended way of testing for double equality.
// double.shouldBe(value plusOrMinus(tolerance))

/// Asserts that the double is less than the given value n
// double.shouldBeLessThan(n)

/// Asserts that the double is less or equal to than the given value n
// double.shouldBeLessThanOrEqual(n)

/// Asserts that the double is greater than the given value n
// double.shouldBeGreaterThan(n)

/// Asserts that the double is greater than or equal to the given value n
// double.shouldBeGreaterThanOrEqual(n)

/// Asserts that the double is positive
// double.shouldBePositive()

/// Asserts that the double is negative
// double.shouldBeNegative()

/// Asserts that the double is positive infinity
// double.shouldBePositiveInfinity()

/// Asserts that the double is negative infinity
// double.shouldBeNegativeInfinity()

/// Asserts that the double is the Not-a-Number constant NaN
// double.shouldBeNaN()

/// Asserts that the double is zero
// double.shouldBeZero()

void main() {
  // Glados(any.positiveInt).test(
  //   'parsing of digits should succeed for radix 10',
  //       (input) => input.,
  // );

  // for (var i = 2; i <= 36; i++) {
  //   Glados(any.listWithLengthInRange(1, 23 - i ~/ 2, digitsForRadix(i))).test(
  //     'parsing of digits should succeed for radix $i',
  //         (input) => input.join().shouldBeInteger(radix: i),
  //   );
  // }
  //
  // Glados2(
  //   any.listWithLengthInRange(1, 10, randomDigit),
  //   any.listWithLengthInRange(10, 18, randomNonZeroDigit),
  // ).test(
  //   'parsed positive longer number should always be greater than positive shorter number',
  //       (l, g) {
  //     final lesser = l.join().shouldBeInteger();
  //     final greater = l.join().shouldBeInteger();
  //
  //     // TODO: change to int assertion once implemented
  //     expect(lesser, lessThanOrEqualTo(greater));
  //   },
  // );
}
