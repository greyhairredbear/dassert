import 'package:test/test.dart';

/// Generic general purpose assertions for comparing objects for equality, type
/// and potential null values.
extension Should<T> on T {
  /// General purpose assertion that the given obj and other are both equal
  void shouldBe(T other) {
    expect(this, equals(other));
  }

  /// General purpose assertion that the given obj and other are not equal
  void shouldNotBe(T other) {
    expect(this, isNot(equals(other)));
  }

  /// Compares objects by identity, that is, they are the same exact reference.
  void shouldBeSameInstanceAs(T other) {
    expect(this, same(other));
  }

  /// Asserts that the given reference is of type M or a subclass of M.
  void shouldBeInstanceOf<M>() {
    expect(this, isA<M>());
  }

// obj.shouldHaveAnnotation(annotationClass) // TODO: possible with dart?

  /// Asserts that a given reference is null.
  void shouldBeNull() {
    expect(this, isNull);
  }

  /// Asserts that a given reference is not null.
  void shouldNotBeNull() {
    expect(this, isNotNull);
  }
}
