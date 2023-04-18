import 'package:dassert/dassert.dart';
import 'package:dassert/src/internal/should_fail.dart';
import 'package:glados/glados.dart';

import '../util/run_spec.dart';
import 'string_test_constants.dart';

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
      input: emptyString,
      containedString: emptyString,
    ),
    _TestSpec(
      name: 'empty string should be contained in arbitrary string',
      input: 'abcde123',
      containedString: emptyString,
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

  runSpecs(
    'should contain substring',
    successSpecs: stringContainsSuccessSpecs,
    failSpecs: stringContainsFailSpecs + [nonMatchingCaseSpec],
    testFunction: (_TestSpec spec) => spec.input.shouldContainSubstring(spec.containedString),
  );

  runSpecs(
    'should contain substring ignoring case',
    successSpecs: stringContainsSuccessSpecs + [nonMatchingCaseSpec],
    failSpecs: stringContainsFailSpecs,
    testFunction: (_TestSpec spec) => spec.input.shouldContainIgnoringCase(spec.containedString),
  );

  runSpecs(
    'should contain substring exactly once',
    successSpecs: [
      _TestSpec(name: 'contained once at start', input: 'lorem ipsum', containedString: 'lore'),
      _TestSpec(name: 'contained once at end', input: 'hello there!', containedString: 'here!'),
      _TestSpec(name: 'contained once at middle', input: 'lorem ipsum', containedString: 'm i'),
      _TestSpec(name: 'matches completely', input: 'matches!!11!', containedString: 'matches!!11!'),
    ],
    failSpecs: [
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
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldContainExactlyOnce(spec.containedString),
  );

  runSpecs(
    'should start with prefix',
    successSpecs: [
      _TestSpec(name: 'first letter', input: 'test', containedString: 't'),
      _TestSpec(name: 'first four letters', input: 'hello', containedString: 'hell'),
    ],
    failSpecs: [
      _TestSpec(name: 'not contained string', input: 'aabbcc', containedString: 'dd'),
      _TestSpec(name: 'suffix', input: 'aabbcc', containedString: 'cc'),
      _TestSpec(name: 'contained', input: 'aabbcc', containedString: 'bb'),
      _TestSpec(name: 'match with wrong case', input: 'HeLlO', containedString: 'hell'),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldStartWith(spec.containedString),
  );

  group('glados: should start with prefix', () {
    Glados(any.letterOrDigits).test(
      'empty string should prefix all strings',
      (input) => input.shouldStartWith(emptyString),
    );
    Glados(any.letterOrDigits).test(
      'string should always be prefix of itself',
      (input) => input.shouldStartWith(input),
    );
    Glados2(
      any.listWithLengthInRange(0, 1000, randomChar),
      any.listWithLengthInRange(1000, 2000, randomChar),
    ).test(
      'longer string can never prefix shorter string',
      (shorter, longer) => shouldFail(() => shorter.join().shouldStartWith(longer.join())),
    );
  });

  runSpecs(
    'should end with suffix',
    successSpecs: [
      _TestSpec(name: 'last letter', input: 'last', containedString: 't'),
      _TestSpec(name: 'last four letters', input: 'forty', containedString: 'orty'),
    ],
    failSpecs: [
      _TestSpec(name: 'not contained string', input: 'aabbcc', containedString: 'dd'),
      _TestSpec(name: 'prefix', input: 'aabbcc', containedString: 'aa'),
      _TestSpec(name: 'contained', input: 'aabbcc', containedString: 'bb'),
      _TestSpec(name: 'match with wrong case', input: 'HeLlO', containedString: 'Lo'),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldEndWith(spec.containedString),
  );

  group('glados: should end with suffix', () {
    Glados(any.letterOrDigits).test(
      'empty string should suffix all strings',
      (input) => input.shouldEndWith(emptyString),
    );
    Glados(any.letterOrDigits).test(
      'string should always be suffix of itself',
      (input) => input.shouldEndWith(input),
    );
    Glados2(
      any.listWithLengthInRange(0, 1000, randomChar),
      any.listWithLengthInRange(1000, 2000, randomChar),
    ).test(
      'longer string can never suffix shorter string',
      (shorter, longer) => shouldFail(() => shorter.join().shouldEndWith(longer.join())),
    );
  });
}
