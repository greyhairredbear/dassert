// shouldThrow<T> { block } (T or subtype)
import 'package:test/test.dart';

void shouldThrow<T>(Function block) {
  expect(block, throwsA(isA<T>()));
}

// TODO: possible in dart?
// Kotest:
// shouldThrowExactly<T> { block } (only T, no subtype)

// shouldThrowAny { block }
void shouldThrowAny(Function block) {
  expect(block, throwsException);
}

void shouldReturnNormally(Function block) {
  expect(block, returnsNormally);
}

// TODO: remove this extension altogether in favor of global functions above?
extension ShouldThrow<T> on Function {
  // TODO: T extends Exception?
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
