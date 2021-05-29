import 'package:dartest/dartest.dart';
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
  group('Should Throw', () {
    test('Throw', () {
      (() => throwingFunWithParams('s', 1))
          .shouldThrow(FormatException('test'));
    });

    test('Catch should Throw ex', () {
      try {
        (() => nonThrowingFunReturningTheAnswer())
            .shouldThrow(FormatException('test'));
        throw _CustomTestFailure();
      } on TestFailure catch (_) {}
    });
  });

  group('Should Not Throw', () {
    test('return normally', () {
      (() => nonThrowingFunReturningTheAnswer()).shouldReturnNormally();
    });

    test('return normally bad case', () {
      try {
        (() => throwingFun()).shouldReturnNormally();
        throw _CustomTestFailure();
      } on TestFailure catch (_) {}
    });
  });
}
