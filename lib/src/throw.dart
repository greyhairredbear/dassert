import 'package:test/test.dart';

/// General purpose construct that asserts that the block throws
/// a T Throwable or a subtype of T
void shouldThrow<T>(Function block) {
  expect(block, throwsA(isA<T>()));
}

/// General purpose construct that asserts that the block throws any Exception
void shouldThrowAny(Function block) {
  expect(block, throwsException);
}

/// General purpose construct that asserts that the block
/// does not throw any Exception.
void shouldReturnNormally(Function block) {
  expect(block, returnsNormally);
}

// TODO: remove this extension altogether in favor of global functions above?
extension ShouldThrow<T> on Function {
  void shouldThrow(T e) {
    expect(
        this,
        throwsA(predicate((actual) =>
            actual is T &&
            // TODO: toString as equality check :/
            actual.toString() == e.toString())));
  }

  void shouldReturnNormally() {
    expect(this, returnsNormally);
  }
}
