import 'package:characters/characters.dart';
import 'package:dassert/dassert.dart';
import 'package:dassert/src/internal/should_fail.dart';
import 'package:glados/glados.dart';

import '../util/run_spec.dart';
import 'string_test_constants.dart';

class _TestSpec extends BaseTestSpec {
  final String input;
  final String other;

  const _TestSpec({required String name, required this.input, required this.other}) : super(name);
}

void main() {
  runSpecs(
    'should be equal ignoring case',
    successSpecs: [
      _TestSpec(name: 'empty strings', input: emptyString, other: emptyString),
      _TestSpec(name: 'equal strings', input: 'input', other: 'input'),
      _TestSpec(name: 'equal strings with different camel case', input: 'XyZ', other: 'xYz'),
      _TestSpec(name: 'equal strings with different case', input: 'ABC', other: 'abc'),
      _TestSpec(
        name: 'equal strings with different case containing special chars',
        input: 'jkl;',
        other: 'JKL;',
      ),
    ],
    failSpecs: [
      _TestSpec(name: 'not equal strings', input: 'input', other: 'o'),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldBeEqualIgnoringCase(spec.other),
  );

  group('glados: shouldBeEqualIgnoringCase', () {
    Glados(any.letterOrDigits).test(
      'should be equal to self',
      (s) => s.shouldBeEqualIgnoringCase(s),
    );
    Glados(any.letterOrDigits).test(
      'should be invariant to .toLowercase',
      (s) => s.shouldBeEqualIgnoringCase(s.toLowerCase()),
    );
    Glados(any.letterOrDigits).test(
      'should be invariant to .toUppercase',
      (s) => s.shouldBeEqualIgnoringCase(s.toUpperCase()),
    );
    Glados2(any.stringOf('xyzabcdef'), any.stringOf('ghijklmnopqrstuvw')).test(
      'strings from distinct sets should never be equal',
      (first, second) => shouldFail(() => first.shouldBeEqualIgnoringCase(second)),
    );
  });

  runSpecs(
    'shouldHaveSameLength',
    successSpecs: [
      _TestSpec(name: 'empty string', input: emptyString, other: ''),
      _TestSpec(name: '5 char string', input: '12345', other: 'abcde'),
      _TestSpec(name: '3 char string', input: 'abc', other: 'xyz'),
    ],
    failSpecs: [
      _TestSpec(name: 'empty string', input: emptyString, other: '1'),
      _TestSpec(name: '5 char string', input: '12345', other: '1'),
      _TestSpec(name: '3 char string', input: 'abc', other: '10'),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldHaveSameLengthAs(spec.other),
  );

  group('glados: shouldHaveSameLengthAs', () {
    Glados(any.letterOrDigits).test(
      'reversing a string should not affect length',
      (input) => input.characters.toList().reversed.join().shouldHaveSameLengthAs(input),
    );
    Glados2(
      any.listWithLengthInRange(0, 1000, randomChar),
      any.listWithLengthInRange(1000, 2000, randomChar),
    ).test(
      'should fail when asserting for same length on strings with different lengths',
      (shorter, longer) => shouldFail(() => shorter.join().shouldHaveSameLengthAs(longer.join())),
    );
  });
}
