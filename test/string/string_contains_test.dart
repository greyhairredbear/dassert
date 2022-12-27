import 'package:dassert/dassert.dart';
import 'package:dassert/src/internal/should_fail.dart';
import 'package:test/test.dart';

class _TestSpec {
  final String name;
  final String input;
  final String containedString;

  _TestSpec({required this.name, required this.input, required this.containedString});
}

void main() {
  final nonMatchingCaseSpec = _TestSpec(
    name: 'fail if string not matching case is contained',
    input: 'cAmEl',
    containedString: 'camel',
  );

  final successSpecs = [
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
  final failSpecs = [
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
    for (final spec in successSpecs) {
      test(spec.name, () => spec.input.shouldContainSubstring(spec.containedString));
    }
    for (final spec in failSpecs + [nonMatchingCaseSpec]) {
      test(
        spec.name,
        () => shouldFail(() => spec.input.shouldContainSubstring(spec.containedString)),
      );
    }
  });

  group('should contain substring ignoring case', () {
    for (final spec in successSpecs + [nonMatchingCaseSpec]) {
      test(spec.name, () => spec.input.shouldContainIgnoringCase(spec.containedString));
    }
    for (final spec in failSpecs) {
      test(
        spec.name,
        () => shouldFail(() => spec.input.shouldContainIgnoringCase(spec.containedString)),
      );
    }
  });

  group('should contain substring exactly once', () {
    test('', () {});
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
