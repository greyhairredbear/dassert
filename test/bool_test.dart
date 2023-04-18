import 'package:dassert/dassert.dart';
import 'package:dassert/src/internal/should_fail.dart';
import 'package:test/test.dart';

bool functionReturningTrueValue() => true;

bool falseValue = false;

void main() {
  group('Happy Path', () {
    test('shouldBeTrue', () {
      (() => functionReturningTrueValue().shouldBeTrue()).shouldReturnNormally();
    });

    test('shouldBeFalse', () {
      (() => falseValue.shouldBeFalse()).shouldReturnNormally();
    });
  });

  group('Unhappy Path', () {
    test('shouldBeTrue', () {
      shouldFail(() => functionReturningTrueValue().shouldBeFalse());
    });

    test('shouldBeFalse', () {
      shouldFail(() => falseValue.shouldBeTrue());
    });
  });
}
