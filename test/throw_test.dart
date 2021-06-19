import 'package:dassert/dassert.dart';
import 'package:test/test.dart';

void throwingFun() {
  throw FormatException('test');
}

String throwingFunWithParams(String s, int i) {
  throw FormatException('test');
}

int nonThrowingFunReturningTheAnswer() {
  return 42;
}

class _CustomTestFailure {}

void main() {
  group('Should Throw Any', () {
    test('Happy Path', () {
      shouldThrowAny(() => throwingFun());
    });

    test('Unhappy Path', () {
      try {
        shouldThrowAny(() => nonThrowingFunReturningTheAnswer());
        throw _CustomTestFailure();
      } on TestFailure catch (_) {}
    });
  });

  group('Should Throw <T>', () {
    test('Happy Path', () {
      shouldThrow<FormatException>(() => throwingFunWithParams('s', 1));
    });

    test('Unhappy Path', () {
      try {
        shouldThrow<FormatException>(() => nonThrowingFunReturningTheAnswer());
        throw _CustomTestFailure();
      } on TestFailure catch (_) {}
    });
  });

  group('Should Throw', () {
    test('Happy Path', () {
      (() => throwingFunWithParams('s', 1))
          .shouldThrow(FormatException('test'));
    });

    test('Unhappy Path', () {
      try {
        (() => nonThrowingFunReturningTheAnswer())
            .shouldThrow(FormatException('test'));
        throw _CustomTestFailure();
      } on TestFailure catch (_) {}
    });
  });

  group('Should return normally', () {
    test('Happy Path', () {
      (() => nonThrowingFunReturningTheAnswer()).shouldReturnNormally();
    });

    test('Unhappy Path', () {
      try {
        (() => throwingFun()).shouldReturnNormally();
        throw _CustomTestFailure();
      } on TestFailure catch (_) {}
    });
  });
}
