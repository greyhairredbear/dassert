import 'dart:math';

import 'package:dassert/dassert.dart';

import '../util/run_spec.dart';

class _TestSpec<E> extends BaseTestSpec {
  final Iterable<E> input;

  _TestSpec({required String name, required this.input}) : super(name);
}

void main() {
  runSpecs(
    'should contain no nulls',
    successSpecs: [
      _TestSpec(name: 'empty', input: []),
      _TestSpec(name: 'empty', input: [1, 2, 3]),
    ],
    failSpecs: [
      _TestSpec(name: 'one null value', input: [null]),
      _TestSpec(name: 'null value in the middle', input: [e, pi, null, ln2, sqrt2]),
    ],
    testFunction: (_TestSpec<dynamic> spec) => spec.input.shouldContainNoNulls(),
  );

  runSpecs(
    'test failure',
    successSpecs: [
      _TestSpec(name: 'passing test', input: ['']),
      _TestSpec(name: 'failing test', input: [null]),
    ],
    failSpecs: <_TestSpec<dynamic>>[],
    testFunction: (_TestSpec<dynamic> spec) => spec.input.shouldContainNoNulls(),
  );
  // TODO: fix usages of predicate function (provide string explanations for predicate)

  // TODO: other tests
}
