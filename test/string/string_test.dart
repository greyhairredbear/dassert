import 'package:dassert/dassert.dart';
import 'package:test/test.dart';

void main() {
  group('should be blank', () {
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
      shouldThrow<TestFailure>(() => ' t   '.shouldBeBlank());
    });
    test('number', () {
      shouldThrow<TestFailure>(() => '42 \n'.shouldBeBlank());
    });
    test('special char', () {
      shouldThrow<TestFailure>(() => '\t % \n '.shouldBeBlank());
    });
  });

  group('should be empty', () {
    test('empty', () {
      ''.shouldBeEmpty();
    });
    test('space', () {
      shouldThrow<TestFailure>(() => ' '.shouldBeEmpty());
    });
    test('newline', () {
      shouldThrow<TestFailure>(() => '\n'.shouldBeEmpty());
    });
    test('tab', () {
      shouldThrow<TestFailure>(() => '\t'.shouldBeEmpty());
    });
    test('whitespace combination', () {
      shouldThrow<TestFailure>(() => '   \t \t \n '.shouldBeEmpty());
    });
    test('letter', () {
      shouldThrow<TestFailure>(() => ' t   '.shouldBeEmpty());
    });
    test('number', () {
      shouldThrow<TestFailure>(() => '42 \n'.shouldBeEmpty());
    });
    test('special char', () {
      shouldThrow<TestFailure>(() => '\t % \n '.shouldBeEmpty());
    });
  });

  /*
  group('should be lower case', () {
    test('', () {});
  });

  group('should be upper case', () {
    test('', () {});
  });

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
