import 'package:dassert/dassert.dart';
import 'package:dassert/src/internal/should_fail.dart';
import 'package:glados/glados.dart';

import '../util/run_spec.dart';
import 'string_test_constants.dart';

class _TestSpec extends BaseTestSpec {
  final String input;
  final int length;

  _TestSpec({required String name, required this.input, required this.length}) : super(name);
}

const _minChars = 30;
const _maxChars = 1000;
final _smallerNumbers = any.intInRange(0, _minChars + 1);
final _largerNumbers = any.intInRange(_maxChars, _maxChars * 5);
final _randomCharList = any.listWithLengthInRange(_minChars, _maxChars, randomChar);

void main() {
  runSpecs(
    'shouldHaveLength',
    successSpecs: [
      _TestSpec(name: 'empty string', input: emptyString, length: 0),
      _TestSpec(name: '5 char string', input: '12345', length: 5),
      _TestSpec(name: '3 char string', input: 'abc', length: 3),
    ],
    failSpecs: [
      _TestSpec(name: 'empty string', input: emptyString, length: 1),
      _TestSpec(name: '5 char string', input: '12345', length: 1),
      _TestSpec(name: '3 char string', input: 'abc', length: 10),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldHaveLength(spec.length),
  );

  group('glados: shouldHaveLength', () {
    Glados(any.letterOrDigits).test(
      'a string concatenated with an empty string should retain its length',
      (input) => (emptyString + input + emptyString).shouldHaveLength(input.length),
    );
    Glados2(any.letterOrDigits, any.letterOrDigits).test(
      'two concatenated strings should always have the sum of their lengths',
      (s1, s2) => (s1 + s2).shouldHaveLength(s1.length + s2.length),
    );
  });

  group('glados: shouldHaveLineCount', () {
    Glados(any.positiveInt).test(
      'a string concatenated with an empty string should retain its line count',
      (input) => (emptyString + '\n12' * input + emptyString).shouldHaveLineCount(1 + input),
    );
    Glados2(any.positiveInt, any.positiveInt).test(
      'two concatenated strings should have the sum of their lines',
      (n1, n2) => (('ab\n' * n1) + ('\ncd\n' * n2)).shouldHaveLineCount(1 + n1 + 2 * n2),
    );
  });
  runSpecs(
    'shouldHaveLineCount',
    successSpecs: [
      _TestSpec(name: 'empty string', input: emptyString, length: 1),
      _TestSpec(name: 'one line string', input: 'one line \n', length: 2),
      _TestSpec(name: '4 line string', input: '1\n2\n3\n', length: 4),
    ],
    failSpecs: [
      _TestSpec(name: 'empty string', input: emptyString, length: 0),
      _TestSpec(name: 'one line string', input: 'one line \n', length: 3),
      _TestSpec(name: '4 line string', input: '1\n2\n3\n', length: 3),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldHaveLineCount(spec.length),
  );

  runSpecs(
    'shouldHaveMinLength',
    successSpecs: [
      _TestSpec(name: 'empty string', input: emptyString, length: 0),
      _TestSpec(name: '5 char string', input: '12345', length: 5),
      _TestSpec(name: '3 char string', input: 'abc', length: 1),
    ],
    failSpecs: [
      _TestSpec(name: 'empty string', input: emptyString, length: 1),
      _TestSpec(name: '5 char string', input: '12345', length: 6),
      _TestSpec(name: '3 char string', input: 'abc', length: 10),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldHaveMinLength(spec.length),
  );

  group('glados: shouldHaveMinLength', () {
    Glados(any.nonEmptyLetterOrDigits).test(
      'non empty strings should have min length of 1',
      (s) => s.shouldHaveMinLength(1),
    );
    Glados2(_randomCharList, _smallerNumbers).test(
      'should pass for correct min lengths',
      (input, minLength) => input.join().shouldHaveMinLength(minLength),
    );
    Glados2(_randomCharList, _largerNumbers).test(
      'should fail for too large min lengths',
      (input, tooLargeMinLength) =>
          shouldFail(() => input.join().shouldHaveMinLength(tooLargeMinLength)),
    );
  });

  runSpecs(
    'shouldHaveMaxLength',
    successSpecs: [
      _TestSpec(name: 'empty string', input: emptyString, length: 0),
      _TestSpec(name: '5 char string', input: '12345', length: 5),
      _TestSpec(name: '3 char string', input: 'abc', length: 4),
    ],
    failSpecs: [
      _TestSpec(name: 'empty string', input: emptyString, length: -1),
      _TestSpec(name: '5 char string', input: '12345', length: 4),
      _TestSpec(name: '3 char string', input: 'abc', length: 0),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldHaveMaxLength(spec.length),
  );

  group('glados: shouldHaveMaxLength', () {
    Glados2(_randomCharList, _largerNumbers).test(
      'should pass for correct min lengths',
      (input, maxLength) => input.join().shouldHaveMaxLength(maxLength),
    );
    Glados2(_randomCharList, _smallerNumbers).test(
      'should fail for too small max lengths',
      (input, tooSmallMaxLength) =>
          shouldFail(() => input.join().shouldHaveMaxLength(tooSmallMaxLength)),
    );
  });
}
