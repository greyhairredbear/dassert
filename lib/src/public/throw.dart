import 'package:dassert/dassert.dart';
import 'package:test/test.dart';

/// General purpose construct that asserts that the [block] throws
/// a [T] Throwable or a subtype of [T]
void shouldThrow<T>(Function block) {
  expect(block, throwsA(isA<T>()));
}

/// General purpose construct that asserts that the [block] throws any Exception
void shouldThrowAny(Function block) {
  expect(block, throwsException);
}

/// General purpose construct that asserts that the [block]
/// does not throw any Exception.
void shouldReturnNormally(Function block) {
  expect(block, returnsNormally);
}

// TODO: remove this extension altogether in favor of global functions above?
/// Extensions on function types to assert function behavior regarding throwing exceptions
extension ShouldThrow<T> on Function {
  /// Asserts that an expected Exception [e] of type [T] is thrown
  /// when calling the extended function
  Function shouldThrow(T e) => should(
        throwsA(
          predicate((actual) =>
              actual is T &&
              // TODO: toString as equality check :/
              actual.toString() == e.toString()),
        ),
      );

  /// Asserts no exception in thrown when calling the extended function
  void shouldReturnNormally() => should(returnsNormally);
}
