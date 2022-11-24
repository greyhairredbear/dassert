import 'package:dassert/dassert.dart';
import 'package:test/test.dart';

/// Convenience shorthand for [shouldThrow]<[TestFailure]>
/// to assert a given function would cause a test to fail.
void shouldFail(Function block) => shouldThrow<TestFailure>(block);
