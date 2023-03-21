import 'package:dassert/dassert.dart';
import 'package:dassert/src/internal/should_fail.dart';
import 'package:glados/glados.dart';

import '../util/run_spec.dart';

class _TestSpec extends BaseTestSpec {
  final String input;
  final String other;

  const _TestSpec({required String name, required this.input, required this.other}) : super(name);
}

void main() {
  runSpecs(
    'should be equal ignoring case',
    successSpecs: [
      _TestSpec(name: 'empty strings', input: '', other: ''),
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
}
