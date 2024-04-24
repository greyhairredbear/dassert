import 'package:dassert/dassert.dart';
import 'package:test/expect.dart';

/// Utils for asserting [num] values.
extension IterableMatchers<C extends Iterable<E?>, E> on C {
  /// Asserts that the collection contains no null elements, or is empty.
  C shouldContainNoNulls() => should(predicate((C p0) => !p0.contains(null)));

  /// Asserts that the collection contains at least one null element.
// collection.shouldContainNull()

  /// Asserts that the collection contains only null elements, or is empty.
// collection.shouldContainOnlyNulls()
}
