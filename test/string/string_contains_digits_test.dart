import 'package:dassert/dassert.dart';

import '../util/run_spec.dart';
import 'string_test_constants.dart';

class _TestSpec extends BaseTestSpec {
  final String input;

  _TestSpec({required String name, required this.input}) : super(name);
}

void main() {
  runSpecs(
    'should contain a digit',
    successSpecs: [
      _TestSpec(name: 'at start', input: '120input'),
      _TestSpec(name: 'in word', input: 'in56789out'),
      _TestSpec(name: 'at end', input: 'test4'),
      _TestSpec(name: 'only digits', input: '09876'),
    ],
    failSpecs: [
      _TestSpec(name: 'no digit', input: 'hell no'),
      _TestSpec(name: 'empty string', input: emptyString),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldContainADigit(),
  );

  runSpecs(
    'should contain only digits',
    successSpecs: [
      _TestSpec(name: 'only digits', input: '09876'),
      _TestSpec(name: 'empty string', input: emptyString),
    ],
    failSpecs: [
      _TestSpec(name: 'at start', input: '120input'),
      _TestSpec(name: 'in word', input: 'in56789out'),
      _TestSpec(name: 'at end', input: 'test4'),
      _TestSpec(name: 'no digit', input: 'hell no'),
    ],
    testFunction: (_TestSpec spec) => spec.input.shouldContainOnlyDigits(),
  );
}
