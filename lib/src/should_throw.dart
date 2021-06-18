import 'package:test/test.dart';

/// General purpose construct that asserts that the block throws
/// a T Throwable or a subtype of T
void shouldThrow<T>(Function block) {
  expect(block, throwsA(isA<T>()));
}

// TODO: possible in dart?
// Kotest:
// shouldThrowExactly<T> { block } (only T, no subtype)

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
  // TODO: T extends Exception?
  @deprecated
  void shouldThrow(T e) {
    expect(
        this,
        throwsA(predicate((actual) =>
            actual is T &&
            // TODO: toString as equality check :/
            actual.toString() == e.toString())));
  }

  @Deprecated('Do not use this extension, use parameterized version')
  void shouldReturnNormally() {
    expect(this, returnsNormally);
  }
}
