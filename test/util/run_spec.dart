import 'package:dassert/src/internal/should_fail.dart';
import 'package:test/test.dart';

void runSpecs<T extends BaseTestSpec>(
  String description, {
  required List<T> successSpecs,
  required List<T> failSpecs,
  required void Function(T spec) testFunction,
}) {
  group(description, () {
    for (final spec in successSpecs) {
      test(spec.name, () => testFunction(spec));
    }
    for (final spec in failSpecs) {
      test(spec.name, () => shouldFail(() => testFunction(spec)));
    }
  });
}

abstract class BaseTestSpec {
  final String name;

  const BaseTestSpec(this.name);
}
