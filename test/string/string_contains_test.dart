import 'package:dassert/dassert.dart';
import 'package:dassert/src/internal/should_fail.dart';
import 'package:test/test.dart';

// TODO: #13 refactor to use testspec?
// class _TestSpec {
//   final String name;
//   final String input;
//   final String containedString;
//
//   _TestSpec({required this.name, required this.input, required this.containedString});
// }

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

  group('should contain substring ignoring case', () {
    test('empty string should be contained in empty string', () {
      ''.shouldContainIgnoringCase('');
    });

    test('empty string should be contained in arbitrary string', () {
      'abcde54321'.shouldContainIgnoringCase('');
    });

    test('string should contain itself', () {
      'deadBEEF'.shouldContainIgnoringCase('deadBEEF');
    });

    test('should contain prefix', () {
      'testString'.shouldContainIgnoringCase('test');
    });

    test('should contain postfix', () {
      'testString'.shouldContainIgnoringCase('String');
    });

    test('should contain middle', () {
      'test'.shouldContainIgnoringCase('es');
    });

    test('should contain matching case', () {
      'TeSt'.shouldContainIgnoringCase('eS');
    });

    test('should contain ignoring case', () {
      'cAmEl'.shouldContainIgnoringCase('camel');
    });

    test('should fail if string is not contained', () {
      shouldFail(() => '1234'.shouldContainIgnoringCase('substring'));
    });

    test('should fail if string is contained in reverse order', () {
      shouldFail(() => 'dc'.shouldContainIgnoringCase('cd'));
    });
  });

  /*

  group('should contain a digit', () {
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
