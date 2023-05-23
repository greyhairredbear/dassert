import 'package:characters/characters.dart';
import 'package:dassert/dassert.dart';
import 'package:dassert/src/public/number/number.dart';
import 'package:glados/glados.dart';

import '../util/run_spec.dart';
import 'string_test_constants.dart';

class _TestSpec extends BaseTestSpec {
  final String input;
  final int? expectedOutput;

  _TestSpec({required String name, required this.input, this.expectedOutput}) : super(name);
}

Shrinkable<String> Function(Random r, int i) digitsForRadix(int radix) {
  return any.choose('0123456789abcdefghijklmnopqrstuvwxyz'.characters.take(radix).toList());
}

void main() {
  runSpecs(
    'should be int radix 10',
    successSpecs: [
      _TestSpec(name: 'one-digit positive', input: '1', expectedOutput: 1),
      _TestSpec(
        name: 'one-digit positive with sign',
        input: '+1',
        expectedOutput: 1,
      ),
      _TestSpec(name: 'one-digit negative', input: '-2', expectedOutput: -2),
    ],
    failSpecs: [
      _TestSpec(name: 'letter', input: 'i'),
      _TestSpec(name: 'incorrectly expected result', input: '1', expectedOutput: 2),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldBeInteger().shouldBe(spec.expectedOutput!),
  );

  Glados(any.listWithLengthInRange(1, 18, randomDigit)).test(
    'parsing of digits should succeed for radix 10',
    (input) => input.join().shouldBeInteger(),
  );

  for (var i = 2; i <= 36; i++) {
    Glados(any.listWithLengthInRange(1, 23 - i ~/ 2, digitsForRadix(i))).test(
      'parsing of digits should succeed for radix $i',
      (input) => input.join().shouldBeInteger(radix: i),
    );
  }

  Glados2(
    any.listWithLengthInRange(1, 10, randomDigit),
    any.listWithLengthInRange(10, 18, randomNonZeroDigit),
  ).test(
    'parsed positive longer number should always be greater than positive shorter number',
    (l, g) {
      final lesser = l.join().shouldBeInteger();
      final greater = l.join().shouldBeInteger();

      lesser.shouldBeLessThanOrEqual(greater);
    },
  );
}
