import 'package:dassert/dassert.dart';
import 'package:test/test.dart';

bool functionReturningTrueValue() => true;

bool falseValue = false;

void main() {
  group('Happy Path', () {
    test('shouldBeTrue', () {
      (() => functionReturningTrueValue().shouldBeTrue())
          .shouldReturnNormally();
    });

    test('shouldBeFalse', () {
      (() => falseValue.shouldBeFalse()).shouldReturnNormally();
    });
  });

  group('Unhappy Path', () {
    test('shouldBeTrue', () {
      shouldThrow<TestFailure>(
          () => functionReturningTrueValue().shouldBeFalse());
    });

    test('shouldBeFalse', () {
      shouldThrow<TestFailure>(() => falseValue.shouldBeTrue());
    });
  });
}
