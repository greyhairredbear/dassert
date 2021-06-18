import 'package:test/test.dart';

extension Should<T> on T {
  void shouldBe(T other) {
    expect(this, equals(other));
  }

  void shouldNotBe(T other) {
    expect(this, isNot(equals(other)));
  }

  void shouldBeSameInstanceAs(T other) {
    expect(this, same(other));
  }

  /// Asserts that the given reference is of type M or a subclass of M.
  void shouldBeInstanceOf<M>() {
    expect(this, isA<M>());
  }

// obj.shouldHaveAnnotation(annotationClass) // TODO: possible with dart?

  void shouldBeNull() {
    expect(this, isNull);
  }

  void shouldNotBeNull() {
    expect(this, isNotNull);
  }
}
