import 'package:dassert/dassert.dart';
import 'package:dassert/src/internal/should_fail.dart';
import 'package:test/test.dart';

import '../util/run_spec.dart';

class _TestSpec extends BaseTestSpec {
  final String input;
  final String containedString;

  _TestSpec({required String name, required this.input, required this.containedString})
      : super(name);
}

void main() {
  final nonMatchingCaseSpec = _TestSpec(
    name: 'fail if string not matching case is contained',
    input: 'cAmEl',
    containedString: 'camel',
  );

  final stringContainsSuccessSpecs = [
    _TestSpec(
      name: 'empty string should be contained in empty string',
      input: '',
      containedString: '',
    ),
    _TestSpec(
      name: 'empty string should be contained in arbitrary string',
      input: 'abcde123',
      containedString: '',
    ),
    _TestSpec(
      name: 'string should contain itself',
      input: 'deadBEEF',
      containedString: 'deadBEEF',
    ),
    _TestSpec(name: 'should contain prefix', input: 'testString', containedString: 'test'),
    _TestSpec(name: 'should contain postfix', input: 'testString', containedString: 'String'),
    _TestSpec(name: 'should contain middle', input: 'test', containedString: 'es'),
    _TestSpec(name: 'should contain case sensitive', input: 'TeSt', containedString: 'eS'),
  ];
  final stringContainsFailSpecs = [
    _TestSpec(
      name: 'fail if string is not contained',
      input: '1234',
      containedString: 'substring',
    ),
    _TestSpec(
      name: 'should fail if string is contained in reverse order',
      input: 'dc',
      containedString: 'cd',
    ),
  ];

  group('should contain substring', () {
    for (final spec in stringContainsSuccessSpecs) {
      test(spec.name, () => spec.input.shouldContainSubstring(spec.containedString));
    }
    for (final spec in stringContainsFailSpecs + [nonMatchingCaseSpec]) {
      test(
        spec.name,
        () => shouldFail(() => spec.input.shouldContainSubstring(spec.containedString)),
      );
    }
  });

  group('should contain substring ignoring case', () {
    for (final spec in stringContainsSuccessSpecs + [nonMatchingCaseSpec]) {
      test(spec.name, () => spec.input.shouldContainIgnoringCase(spec.containedString));
    }
    for (final spec in stringContainsFailSpecs) {
      test(
        spec.name,
        () => shouldFail(() => spec.input.shouldContainIgnoringCase(spec.containedString)),
      );
    }
  });

  group('should contain substring exactly once', () {
    final successSpecs = [
      _TestSpec(name: 'contained once at start', input: 'lorem ipsum', containedString: 'lore'),
      _TestSpec(name: 'contained once at end', input: 'hello there!', containedString: 'here!'),
      _TestSpec(name: 'contained once at middle', input: 'lorem ipsum', containedString: 'm i'),
      _TestSpec(name: 'matches completely', input: 'matches!!11!', containedString: 'matches!!11!'),
    ];
    final failSpecs = [
      _TestSpec(
        name: 'fail when not contained',
        input: 'input',
        containedString: 'containedString',
      ),
      _TestSpec(
        name: 'fail when contained multiple times',
        input: 'first, second first',
        containedString: 'first',
      ),
      _TestSpec(name: 'overlapping double match', input: 'HarHarHar', containedString: 'HarHar'),
    ];

    for (final spec in successSpecs) {
      test(spec.name, () => spec.input.shouldContainExactlyOnce(spec.containedString));
    }
    for (final spec in failSpecs) {
      test(
        spec.name,
        () => shouldFail(() => spec.input.shouldContainExactlyOnce(spec.containedString)),
      );
    }
  });

/*

  group('should contain a digit', () {
    test('', () {});
  });

  group('should contain only digits', () {
    test('', () {});
  });

   */
}
