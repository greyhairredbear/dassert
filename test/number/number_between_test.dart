import 'dart:math';

import 'package:dassert/src/internal/should_fail.dart';
import 'package:dassert/src/public/number/number.dart';
import 'package:glados/glados.dart';

import '../util/run_spec.dart';

class _TestSpec extends BaseTestSpec {
  final num input;
  final num lowerBound;
  final num upperBound;

  _TestSpec({
    required String name,
    required this.input,
    required this.lowerBound,
    required this.upperBound,
  }) : super(name);
}

final int64MaxValue = double.maxFinite.toInt();
const minDif = 0.0000001;

// TODO
/// Asserts that the long is included in the given range.
// long.shouldBeInRange(range)

void main() {
  runSpecs(
    'should be between',
    successSpecs: [
      _TestSpec(name: 'equal bounds', input: pi, lowerBound: pi, upperBound: pi),
      _TestSpec(name: 'arbitrary int range', input: 42, lowerBound: 40, upperBound: 50),
      _TestSpec(name: 'arbitrary double range', input: 13.37, lowerBound: 13.3, upperBound: 20.5),
    ],
    failSpecs: [
      _TestSpec(
        name: 'equal bounds',
        input: pi,
        lowerBound: pi - minDif,
        upperBound: pi - minDif,
      ),
      _TestSpec(name: 'arbitrary int range', input: 42, lowerBound: 50, upperBound: 60),
      _TestSpec(name: 'arbitrary double range', input: 13.37, lowerBound: 13.07, upperBound: 13.36),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldBeBetween(spec.lowerBound, spec.upperBound),
  );

  Glados(any.positiveIntOrZero).test(
    'positive ints should be between 0 and maxint',
    (input) {
      input.shouldBeBetween(0, int64MaxValue);
      shouldFail(() => input.shouldBeBetween(-int64MaxValue, -1));
    },
  );

  Glados(any.intInRange(-12345, 67890)).test(
    'ints in range (reverse param order)',
    (input) {
      input.shouldBeBetween(67890, -12345);
      shouldFail(() => input.shouldBeBetween(67891, int64MaxValue));
      shouldFail(() => input.shouldBeBetween(-12346, -int64MaxValue));
    },
  );

  Glados(any.positiveDoubleOrZero).test(
    'positive doubles should be between 0 and maxFinite',
    (input) {
      input.shouldBeBetween(0.0, double.infinity);
      shouldFail(() => input.shouldBeBetween(double.negativeInfinity, 0 - double.minPositive));
    },
  );

  Glados(any.doubleInRange(pi, e)).test(
    'doubles in range (reverse param order)',
    (input) {
      input.shouldBeBetween(e, pi);
      shouldFail(() => input.shouldBeBetween(double.negativeInfinity, e - minDif));
      shouldFail(() => input.shouldBeBetween(pi + minDif, double.infinity));
    },
  );
}
