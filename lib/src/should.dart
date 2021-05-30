import 'package:test/test.dart';

extension Should<T> on T {
  void shouldBe(T other) {
    expect(this, equals(other));
  }

  void shouldNotBe(T other) {
    expect(this, isNot(equals(other)));
  }
}

// TODO evaluate further use cases: Matchers needed for exceptions?
extension ShouldThrow<T> on Function {  // TODO: T extends Exception?
  void shouldThrow(T e) {
    expect(
        this,
        throwsA(predicate((actual) =>
            actual is T &&
            // TODO: toString as equality check :/
            actual.toString() == e.toString())));
  }

  // Kotest:
  // shouldThrow<T> { block } (T or subtype)

  // Kotest:
  // shouldThrowExactly<T> { block } (only T, no subtype)

  // Kotest:
  // shouldThrowAny { block }

  // obj.shouldBeSameInstanceAs(other)

  // obj.shouldBeTypeOf<T>()

  // obj.shouldBeInstanceOf<T>

  // obj.shouldHaveAnnotation(annotationClass) // TODO: probably not feasible

  // obj.shouldBeNull()

  void shouldReturnNormally() {
    expect(this, returnsNormally);
  }
}
