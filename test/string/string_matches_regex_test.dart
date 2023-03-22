import 'package:dassert/src/public/string/string_matches_regex.dart';

import '../util/run_spec.dart';
import 'string_test_constants.dart'; // TODO: package import?

class _TestSpec extends BaseTestSpec {
  final String input;
  final String pattern;

  _TestSpec({required String name, required this.input, required this.pattern}) : super(name);
}

void main() {
  runSpecs(
    'should contain regex',
    successSpecs: [
      _TestSpec(
        name: 'empty regex should match empty string',
        input: emptyString,
        pattern: emptyString,
      ),
      _TestSpec(
        name: 'empty regex should match arbitrary string',
        input: 'abcd4321',
        pattern: emptyString,
      ),
      _TestSpec(name: 'exact match should succeed', input: 'test', pattern: 'test'),
      _TestSpec(name: 'prefix match should succeed', input: 'test', pattern: 'te'),
      _TestSpec(name: 'postfix match should succeed', input: 'test', pattern: 'st'),
    ],
    failSpecs: [
      _TestSpec(name: 'character not in empty string', input: emptyString, pattern: 'p'),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldContain(spec.pattern),
  );

  runSpecs(
    'should match regex exactly',
    successSpecs: [
      _TestSpec(
          name: 'empty regex should match empty string', input: emptyString, pattern: emptyString),
      _TestSpec(name: 'exact match should succeed', input: 'test', pattern: 'test'),
    ],
    failSpecs: [
      _TestSpec(
        name: 'empty regex should not exactly match arbitrary string',
        input: 'abcd4321',
        pattern: emptyString,
      ),
      _TestSpec(name: 'character not in empty string', input: emptyString, pattern: 'p'),
      _TestSpec(name: 'prefix match should fail', input: 'test', pattern: 'te'),
      _TestSpec(name: 'postfix match should fail', input: 'test', pattern: 'st'),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldMatch(spec.pattern),
  );
}
