import 'dart:collection';

import 'package:dassert/dassert.dart';
import 'package:test/expect.dart';

/// Utils for asserting [Iterable] values.
extension IterableMatchers<C extends Iterable<E?>, E> on C {
  /// Asserts that the collection contains no null elements, or is empty.
  C shouldContainNoNulls() =>
      should(predicate((C p0) => !p0.contains(null), 'contains no null elements, or is empty'));

  /// Asserts that the collection contains at least one null element.
  C shouldContainNull() =>
      should(predicate((C p0) => p0.contains(null), 'contains at least one null element'));

  /// Asserts that the collection contains only null elements, or is empty.
  C shouldContainOnlyNulls() => should(
      predicate((C p0) => p0.every((e) => e == null), 'contains only null elements, or is empty'));

  /// Asserts that the collections has zero elements.
  C shouldBeEmpty() => should(isEmpty);

  /// Asserts that the collections has one or more elements.
  C shouldNotBeEmpty() => should(isNotEmpty);

  /// Asserts that all the elements of the collection are distinct
  /// using the natural equals of the elements.
  C shouldBeUnique() => should(predicate((C p0) {
        return (HashSet<E?>()..addAll(p0)).length == p0.length;
      }, 'all elements are distinct using natural equals'));
}
