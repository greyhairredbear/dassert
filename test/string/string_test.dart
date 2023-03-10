import 'package:dassert/dassert.dart';

import '../util/run_spec.dart';

class _TestSpec extends BaseTestSpec {
  final String input;

  _TestSpec({required String name, required this.input}) : super(name);
}

void main() {
  runSpecs(
    'shouldBeBlank',
    successSpecs: [
      _TestSpec(name: 'empty', input: ''),
      _TestSpec(name: 'space', input: ' '),
      _TestSpec(name: 'newline', input: '\n'),
      _TestSpec(name: 'tab', input: '\t'),
      _TestSpec(name: 'whitespace combination', input: '   \t \t \n '),
    ],
    failSpecs: [
      _TestSpec(name: 'letter', input: ' t   '),
      _TestSpec(name: 'number', input: '42 \n'),
      _TestSpec(name: 'special char', input: '\t % \n '),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldBeBlank(),
  );

  runSpecs(
    'shouldBeEmpty',
    successSpecs: [
      _TestSpec(name: 'empty', input: ''),
    ],
    failSpecs: [
      _TestSpec(name: 'space', input: ' '),
      _TestSpec(name: 'newline', input: '\n'),
      _TestSpec(name: 'tab', input: '\t'),
      _TestSpec(name: 'whitespace combination', input: '   \t \t \n '),
      _TestSpec(name: 'letter', input: ' t   '),
      _TestSpec(name: 'number', input: '42 \n'),
      _TestSpec(name: 'special char', input: '\t % \n '),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldBeEmpty(),
  );

  runSpecs(
    'should be lower case',
    successSpecs: [
      _TestSpec(name: 'char', input: 'a'),
      _TestSpec(name: 'whitespace', input: '    '),
      _TestSpec(name: 'numbers', input: '54321'),
      _TestSpec(name: 'lowercase characters and whitespace', input: 'test and \n test'),
    ],
    failSpecs: [
      _TestSpec(name: 'single uppercase char', input: 'T'),
      _TestSpec(name: 'uppercase characters with whitespace', input: 'L33T SK1LLZ'),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldBeLowerCase(),
  );

  runSpecs(
    'should be upper case',
    successSpecs: [
      _TestSpec(name: 'uppercase char', input: 'A'),
      _TestSpec(name: 'whitespace', input: '    '),
      _TestSpec(name: 'numbers', input: '54321'),
      _TestSpec(name: 'uppercase characters with whitespace', input: 'L33T SK1LLZ'),
    ],
    failSpecs: [
      _TestSpec(name: 'lowercase characters and whitespace', input: 'test and \n test'),
      _TestSpec(name: 'single lowercase char', input: 't'),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldBeUpperCase(),
  );

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
