import 'package:dassert/dassert.dart';
import 'package:dassert/src/internal/should_fail.dart';
import 'package:test/test.dart';

void main() {
  group('shouldBeBlank', () {
    test('empty', () {
      ''.shouldBeBlank();
    });
    test('space', () {
      ' '.shouldBeBlank();
    });
    test('newline', () {
      '\n'.shouldBeBlank();
    });
    test('tab', () {
      '\t'.shouldBeBlank();
    });
    test('whitespace combination', () {
      '   \t \t \n '.shouldBeBlank();
    });

    test('letter', () {
      shouldFail(() => ' t   '.shouldBeBlank());
    });
    test('number', () {
      shouldFail(() => '42 \n'.shouldBeBlank());
    });
    test('special char', () {
      shouldFail(() => '\t % \n '.shouldBeBlank());
    });
  });

  group('shouldBeEmpty', () {
    test('empty', () {
      ''.shouldBeEmpty();
    });
    test('space', () {
      shouldFail(() => ' '.shouldBeEmpty());
    });
    test('newline', () {
      shouldFail(() => '\n'.shouldBeEmpty());
    });
    test('tab', () {
      shouldFail(() => '\t'.shouldBeEmpty());
    });
    test('whitespace combination', () {
      shouldFail(() => '   \t \t \n '.shouldBeEmpty());
    });
    test('letter', () {
      shouldFail(() => ' t   '.shouldBeEmpty());
    });
    test('number', () {
      shouldFail(() => '42 \n'.shouldBeEmpty());
    });
    test('special char', () {
      shouldFail(() => '\t % \n '.shouldBeEmpty());
    });
  });

  group('should be lower case', () {
    test('char', () {
      'a'.shouldBeLowerCase();
    });
    test('whitespace', () {
      '   '.shouldBeLowerCase();
    });
    test('numbers', () {
      '54321'.shouldBeLowerCase();
    });
    test('lowercase characters and whitespace', () {
      'test and \n test'.shouldBeLowerCase();
    });
    test('single uppercase char', () {
      shouldFail(() => 'T'.shouldBeLowerCase());
    });
    test('uppercase characters with whitespace', () {
      shouldFail(() => 'L33T SK1LLZ'.shouldBeLowerCase());
    });
  });

  group('should be upper case', () {
    test('uppercase char', () {
      'A'.shouldBeUpperCase();
    });
    test('whitespace', () {
      '   '.shouldBeUpperCase();
    });
    test('numbers', () {
      '54321'.shouldBeUpperCase();
    });
    test('lowercase characters and whitespace', () {
      shouldFail(() => 'test and \n test'.shouldBeUpperCase());
    });
    test('single lowercase char', () {
      shouldFail(() => 't'.shouldBeUpperCase());
    });
    test('uppercase characters with whitespace', () {
      'L33T SK1LLZ'.shouldBeUpperCase();
    });
  });

  /*
  group('should contain substring', () {
    test('', () {});
  });

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

  group('should be integer (and return) - todo: radix param?', () {
    test('', () {});
  });

  group('should contain substring exactly once', () {
    test('', () {});
  });

  group('should end with suffix', () {
    test('', () {});
  });

  group('should have length', () {
    test('', () {});
  });

  group('should have line count', () {
    test('', () {});
  });

  // TODO group length related stuff into separate file
  group('should have max length', () {
    test('', () {});
  });

  group('should have min length', () {
    test('', () {});
  });

  group('should have same length as other string', () {
    test('', () {});
  });

  // TODO group regex stuff into separate file
  group('should match regex', () {
    test('', () {});
  });

  // TODO group contains/starts/ends etc?
  group('should start with prefix', () {
    test('', () {});
  });

  group('should be equal ignoring case', () {
    test('', () {});
  });

  group('should be truthy', () {
    test('', () {});
  });

  group('should be falsy', () {
    test('', () {});
  });
   */
}
