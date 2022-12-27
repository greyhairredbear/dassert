import 'package:dassert/src/internal/should_fail.dart';
import 'package:dassert/src/public/string/string_matches_regex.dart';
import 'package:test/test.dart';

class _TestSpec {
  final String name;
  final String input;
  final String pattern;

  _TestSpec({required this.name, required this.input, required this.pattern});
}

void main() {
  group('should contain regex', () {
    final successSpecs = [
      _TestSpec(name: 'empty regex should match empty string', input: '', pattern: ''),
      _TestSpec(name: 'empty regex should match arbitrary string', input: 'abcd4321', pattern: ''),
      _TestSpec(name: 'exact match should succeed', input: 'test', pattern: 'test'),
      _TestSpec(name: 'prefix match should succeed', input: 'test', pattern: 'te'),
      _TestSpec(name: 'postfix match should succeed', input: 'test', pattern: 'st'),
    ];
    final failSpecs = [
      _TestSpec(name: 'character not in empty string', input: '', pattern: 'p'),
    ];

    for (final spec in successSpecs) {
      test(spec.name, () => spec.input.shouldContain(spec.pattern));
    }
    for (final spec in failSpecs) {
      test(spec.name, () => shouldFail(() => spec.input.shouldContain(spec.pattern)));
    }
  });

  // group('should match regex exactly', () {
  //   test('', () {
  //
  //   });
  // });
}
