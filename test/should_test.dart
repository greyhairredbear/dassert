import 'package:dartest/dartest.dart';
import 'package:test/test.dart';

class _TestBase {}

class _TestSub extends _TestBase {}

class _TestClass {
  String name;
  int number;

  _TestClass({required this.name, required this.number});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TestClass &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          number == other.number;

  @override
  int get hashCode => name.hashCode ^ number.hashCode;
}

final testClass1 = _TestClass(name: 'test', number: 13);
final testClass2 = _TestClass(name: 'test2', number: 42);
final testClass3 = _TestClass(name: 'test2', number: 42);

final String? optionalStringWithNullValue = null;
final String? optionalStringWithNonNullValue = 'test';

void main() {
  group('shouldBe', () {
    test('happy path', () {
      testClass2.shouldBe(testClass3);
    });
    test('happy path reversed', () {
      testClass3.shouldBe(testClass2);
    });
    test('unhappy path', () {
      shouldThrow<TestFailure>(() => testClass1.shouldBe(testClass3));
    });
  });

  group('shouldNotBe', () {
    test('happy path', () {
      testClass1.shouldNotBe(testClass2);
    });
    test('happy path reversed', () {
      testClass2.shouldNotBe(testClass1);
    });
    test('unhappy path', () {
      shouldThrow<TestFailure>(() => testClass1.shouldBe(testClass3));
    });
  });

  group('shouldBeSameInstanceAs', () {
    test('happy path', () {
      testClass1.shouldBeSameInstanceAs(testClass1);
    });
    test('happy path reversed', () {
      testClass2.shouldBeSameInstanceAs(testClass2);
    });
    test('unhappy path', () {
      shouldThrow<TestFailure>(
          () => testClass1.shouldBeSameInstanceAs(testClass2));
    });
  });

  group('shouldBeTypeOf', () {
    test('happy path string', () {
      'hello'.shouldBeInstanceOf<String>();
    });
    test('happy path testclass', () {
      testClass1.shouldBeInstanceOf<_TestClass>();
    });
    test('happy path int', () {
      0xdeadbeef.shouldBeInstanceOf<int>();
    });
    test('happy path class', () {
      _TestBase().shouldBeInstanceOf<_TestBase>();
    });
    test('happy path subclass', () {
      _TestSub().shouldBeInstanceOf<_TestBase>();
    });
    test('unhappy path int/String', () {
      shouldThrow<TestFailure>(() => 123.shouldBeInstanceOf<String>());
    });
    test('unhappy path String/int', () {
      shouldThrow<TestFailure>(() => '1234'.shouldBeInstanceOf<int>());
    });
    test('unhappy path class/String', () {
      shouldThrow<TestFailure>(() => testClass1.shouldBeInstanceOf<String>());
    });
    test('unhappy path String/class', () {
      shouldThrow<TestFailure>(
          () => 'testClass1'.shouldBeInstanceOf<_TestClass>());
    });
    test('unhappy path base/sub class', () {
      shouldThrow<TestFailure>(
          () => _TestBase().shouldBeInstanceOf<_TestSub>());
    });
  });

  group('shouldBeNull', () {
    test('happy path literal', () {
      null.shouldBeNull();
    });
    test('happy path variable', () {
      optionalStringWithNullValue.shouldBeNull();
    });
    test('unhappy path', () {
      shouldThrow<TestFailure>(
          () => optionalStringWithNonNullValue.shouldBeNull());
    });
  });

  group('shouldNotBeNull', () {
    test('happy path literal', () {
      1234.shouldNotBeNull();
    });
    test('happy path variable', () {
      optionalStringWithNonNullValue.shouldNotBeNull();
    });
    test('unhappy path', () {
      shouldThrow<TestFailure>(
          () => optionalStringWithNullValue.shouldNotBeNull());
    });
  });
}
