import 'package:dassert/dassert.dart';
import 'package:dassert/src/internal/should_fail.dart';
import 'package:test/test.dart';

class _TestSpec {
  final String name;
  final String input;

  _TestSpec({required this.name, required this.input});
}

void main() {
  group('shouldBeBlank', () {
    final successSpecs = [
      _TestSpec(name: 'empty', input: ''),
      _TestSpec(name: 'space', input: ' '),
      _TestSpec(name: 'newline', input: '\n'),
      _TestSpec(name: 'tab', input: '\t'),
      _TestSpec(name: 'whitespace combination', input: '   \t \t \n '),
    ];
    final failSpecs = [
      _TestSpec(name: 'letter', input: ' t   '),
      _TestSpec(name: 'number', input: '42 \n'),
      _TestSpec(name: 'special char', input: '\t % \n '),
    ];

    for (final spec in successSpecs) {
      test(spec.name, () => spec.input.shouldBeBlank());
    }
    for (final spec in failSpecs) {
      test(spec.name, () => shouldFail(() => spec.input.shouldBeBlank()));
    }
  });

  group('shouldBeEmpty', () {
    final successSpecs = [
      _TestSpec(name: 'empty', input: ''),
    ];
    final failSpecs = [
      _TestSpec(name: 'space', input: ' '),
      _TestSpec(name: 'newline', input: '\n'),
      _TestSpec(name: 'tab', input: '\t'),
      _TestSpec(name: 'whitespace combination', input: '   \t \t \n '),
      _TestSpec(name: 'letter', input: ' t   '),
      _TestSpec(name: 'number', input: '42 \n'),
      _TestSpec(name: 'special char', input: '\t % \n '),
    ];

    for (final spec in successSpecs) {
      test(spec.name, () => spec.input.shouldBeEmpty());
    }
    for (final spec in failSpecs) {
      test(spec.name, () => shouldFail(() => spec.input.shouldBeEmpty()));
    }
  });

  group('should be lower case', () {
    final successSpecs = [
      _TestSpec(name: 'char', input: 'a'),
      _TestSpec(name: 'whitespace', input: '    '),
      _TestSpec(name: 'numbers', input: '54321'),
      _TestSpec(name: 'lowercase characters and whitespace', input: 'test and \n test'),
    ];
    final failSpecs = [
      _TestSpec(name: 'single uppercase char', input: 'T'),
      _TestSpec(name: 'uppercase characters with whitespace', input: 'L33T SK1LLZ'),
    ];

    for (final spec in successSpecs) {
      test(spec.name, () => spec.input.shouldBeLowerCase());
    }
    for (final spec in failSpecs) {
      test(spec.name, () => shouldFail(() => spec.input.shouldBeLowerCase()));
    }
  });

  group('should be upper case', () {
    final successSpecs = [
      _TestSpec(name: 'uppercase char', input: 'A'),
      _TestSpec(name: 'whitespace', input: '    '),
      _TestSpec(name: 'numbers', input: '54321'),
      _TestSpec(name: 'uppercase characters with whitespace', input: 'L33T SK1LLZ'),
    ];
    final failSpecs = [
      _TestSpec(name: 'lowercase characters and whitespace', input: 'test and \n test'),
      _TestSpec(name: 'single lowercase char', input: 't'),
    ];

    for (final spec in successSpecs) {
      test(spec.name, () => spec.input.shouldBeUpperCase());
    }
    for (final spec in failSpecs) {
      test(spec.name, () => shouldFail(() => spec.input.shouldBeUpperCase()));
    }
  });

  /*
  group('should be integer (and return) - todo: radix param?', () {
    test('', () {});
  });

  group('should end with suffix', () {
    test('', () {});
  });

  group('should have length', () {
    test('', () {});
  });

  group('should have line count', () {
    test('', () {});
  });

  // TODO group length related stuff into separate file
  group('should have max length', () {
    test('', () {});
  });

  group('should have min length', () {
    test('', () {});
  });

  group('should have same length as other string', () {
    test('', () {});
  });

  // TODO group regex stuff into separate file
  group('should match regex', () {
    test('', () {});
  });

  // TODO group contains/starts/ends etc?
  group('should start with prefix', () {
    test('', () {});
  });

  group('should be equal ignoring case', () {
    test('', () {});
  });

  group('should be truthy', () {
    test('', () {});
  });

  group('should be falsy', () {
    test('', () {});
  });
   */
}
