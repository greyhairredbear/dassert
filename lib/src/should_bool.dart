import 'package:dartest/src/should.dart';

extension ShouldBool on bool {
  void shouldBeTrue() => shouldBe(true);

  void shouldBeFalse() => shouldBe(false);
}
