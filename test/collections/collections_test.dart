import 'dart:math';

import 'package:dassert/dassert.dart';

import '../util/run_spec.dart';

class _TestSpec<E> extends BaseTestSpec {
  final Iterable<E> input;

  _TestSpec({required String name, required this.input}) : super(name);
}

void main() {
  final emptySpec = _TestSpec(name: 'empty', input: []);
  final listOfNumbersWithoutNull =
      _TestSpec(name: 'list of numbers with no null', input: [1, 2, 3]);

  final listWithSingleNull = _TestSpec(name: 'one null value', input: [null]);
  final listWithNumbersAndSingleNull =
      _TestSpec(name: 'null value in the middle', input: [e, pi, null, ln2, sqrt2]);

  final listWithNumbersAndMultipleNull =
      _TestSpec(name: 'null value in the middle', input: [e, null, null, ln2, null, pi, null]);
  final listWithOnlyNull =
      _TestSpec(name: 'null value in the middle', input: [null, null, null, null, null]);

  runSpecs(
    'should contain no nulls',
    successSpecs: [
      emptySpec,
      listOfNumbersWithoutNull,
    ],
    failSpecs: [
      listWithSingleNull,
      listWithNumbersAndSingleNull,
      listWithNumbersAndMultipleNull,
      listWithOnlyNull,
    ],
    testFunction: (_TestSpec<dynamic> spec) => spec.input.shouldContainNoNulls(),
  );

  runSpecs(
    'should contain null',
    successSpecs: [
      listWithSingleNull,
      listWithNumbersAndSingleNull,
      listWithNumbersAndMultipleNull,
      listWithOnlyNull,
    ],
    failSpecs: [
      emptySpec,
      listOfNumbersWithoutNull,
    ],
    testFunction: (_TestSpec<dynamic> spec) => spec.input.shouldContainNull(),
  );

  runSpecs(
    'should contain only nulls',
    successSpecs: [
      emptySpec,
      listWithSingleNull,
      listWithOnlyNull,
    ],
    failSpecs: [
      listWithNumbersAndSingleNull,
      listWithNumbersAndMultipleNull,
      listOfNumbersWithoutNull,
    ],
    testFunction: (_TestSpec<dynamic> spec) => spec.input.shouldContainOnlyNulls(),
  );

  // TODO: fix usages of predicate function (provide string explanations for predicate)

  // TODO: other tests
}
