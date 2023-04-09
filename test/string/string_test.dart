import 'package:dassert/dassert.dart';

import '../util/run_spec.dart';
import 'string_test_constants.dart';

class _TestSpec extends BaseTestSpec {
  final String input;

  const _TestSpec({required String name, required this.input}) : super(name);
}

const _empty = _TestSpec(name: 'empty', input: emptyString);
const _space = _TestSpec(name: 'space', input: ' ');
const _newline = _TestSpec(name: 'newline', input: '\n');
const _tab = _TestSpec(name: 'tab', input: '\t');
const _whitespaceCombo = _TestSpec(name: 'whitespace combination', input: '   \t \t \n ');
const _letter = _TestSpec(name: 'letter', input: ' t   ');
const _number = _TestSpec(name: 'number', input: '42 \n');
const _specialChar = _TestSpec(name: 'special char', input: '\t % \n ');

const _lowercaseWithWhitespace =
    _TestSpec(name: 'lowercase characters and whitespace', input: 'test and \n test');
const _whitespace = _TestSpec(name: 'whitespace', input: '    ');
const _numbers = _TestSpec(name: 'numbers', input: '54321');
const _uppercaseCharsWithWhitespace =
    _TestSpec(name: 'uppercase characters with whitespace', input: 'L33T SK1LLZ');

const _truthySpecs = [
  _TestSpec(name: 'true', input: 'true'),
  _TestSpec(name: 'yes', input: 'yes'),
  _TestSpec(name: 'letter y', input: 'y'),
  _TestSpec(name: 'one', input: '1'),
];

const _falsySpecs = [
  _TestSpec(name: 'false', input: 'false'),
  _TestSpec(name: 'no', input: 'no'),
  _TestSpec(name: 'n', input: 'n'),
  _TestSpec(name: '0', input: '0'),
];

void main() {
  runSpecs(
    'shouldBeBlank',
    successSpecs: [_empty, _space, _newline, _tab, _whitespaceCombo],
    failSpecs: [_letter, _number, _specialChar],
    testFunction: (_TestSpec spec) => spec.input.shouldBeBlank(),
  );

  runSpecs(
    'shouldBeEmpty',
    successSpecs: [_empty],
    failSpecs: [_space, _newline, _tab, _whitespaceCombo, _letter, _number, _specialChar],
    testFunction: (_TestSpec spec) => spec.input.shouldBeEmpty(),
  );

  runSpecs(
    'should be lower case',
    successSpecs: [
      _TestSpec(name: 'lowercase char', input: 'a'),
      _whitespace,
      _TestSpec(name: 'numbers', input: '54321'),
      _lowercaseWithWhitespace,
    ],
    failSpecs: [
      _TestSpec(name: 'single uppercase char', input: 'T'),
      _uppercaseCharsWithWhitespace,
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldBeLowerCase(),
  );

  runSpecs(
    'should be upper case',
    successSpecs: [
      _TestSpec(name: 'uppercase char', input: 'A'),
      _whitespace,
      _numbers,
      _uppercaseCharsWithWhitespace,
    ],
    failSpecs: [
      _lowercaseWithWhitespace,
      _TestSpec(name: 'single lowercase char', input: 't'),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldBeUpperCase(),
  );

  runSpecs(
    'should be truthy',
    successSpecs: _truthySpecs,
    failSpecs: _falsySpecs,
    testFunction: (_TestSpec spec) => spec.input.shouldBeTruthy(),
  );

  runSpecs(
    'should be falsy',
    successSpecs: _falsySpecs,
    failSpecs: _truthySpecs,
    testFunction: (_TestSpec spec) => spec.input.shouldBeFalsy(),
  );

/*
  group('should be integer (and return) - todo: radix param?', () {
    test('', () {});
  });
   */
}
