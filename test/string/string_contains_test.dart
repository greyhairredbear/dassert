import 'package:dassert/dassert.dart';
import 'package:dassert/src/internal/should_fail.dart';
import 'package:test/test.dart';

void main() {
  group('should contain substring', () {
    test('empty string should be contained in empty string', () {
      ''.shouldContainSubstring('');
    });

    test('empty string should be contained in arbitrary string', () {
      'abcde54321'.shouldContainSubstring('');
    });

    test('string should contain itself', () {
      'deadBEEF'.shouldContainSubstring('deadBEEF');
    });

    test('should contain prefix', () {
      'testString'.shouldContainSubstring('test');
    });

    test('should contain postfix', () {
      'testString'.shouldContainSubstring('String');
    });

    test('should contain middle', () {
      'test'.shouldContainSubstring('es');
    });

    test('should contain case sensitive', () {
      'TeSt'.shouldContainSubstring('eS');
    });

    test('should fail if string is not contained', () {
      shouldFail(() => '1234'.shouldContainSubstring('substring'));
    });

    test('should fail if string not matching case is contained', () {
      shouldFail(() => 'cAmEl'.shouldContainSubstring('camel'));
    });

    test('should fail if string is contained in reverse order', () {
      shouldFail(() => 'dc'.shouldContainSubstring('cd'));
    });
  });

  /*
  group('should contain regex', () {
    test('', () {});
  });

  group('should contain a digit', () {
    test('', () {});
  });

  group('should contain substring ignoring case', () {
    test('', () {});
  });

  group('should contain only digits', () {
    test('', () {});
  });

  group('should contain substring exactly once', () {
    test('', () {});
  });
   */
}
