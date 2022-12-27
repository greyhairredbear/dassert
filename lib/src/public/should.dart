import 'package:test/test.dart';

/// Generic general purpose assertions for comparing objects for equality, type
/// and potential null values.
extension Should<T> on T {
  /// General purpose assertion that the given obj and other are both equal
  T shouldBe(T other) => should(equals(other));

  /// General purpose assertion that the given obj and other are not equal
  T shouldNotBe(T other) => should(isNot(equals(other)));

  /// Compares objects by identity, that is, they are the same exact reference.
  T shouldBeSameInstanceAs(T other) => should(same(other));

  /// Asserts that the given reference is of type M or a subclass of M.
  T shouldBeInstanceOf<M>() => should(isA<M>());

  /// Asserts that a given reference is null.
  T shouldBeNull() => should(isNull);

  /// Asserts that a given reference is not null.
  T shouldNotBeNull() => should(isNotNull);

  /// Invokes a matcher and return the original value it was invoked upon.
  T should(Matcher matcher) {
    expect(this, matcher);
    return this;
  }
}
