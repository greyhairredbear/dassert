import 'package:dassert/src/public/should.dart';

/// Convenience assertions on boolean values.
extension ShouldBool on bool {
  /// Convenience assertion that the expression is true.
  /// Equivalent to `expr.shouldBe(true)`
  bool shouldBeTrue() => shouldBe(true);

  /// Convenience assertion that the expression is false.
  /// Equivalent to `expr.shouldBe(false)`
  bool shouldBeFalse() => shouldBe(false);
}
