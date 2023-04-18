import 'dart:core';

import 'package:characters/characters.dart';
import 'package:dassert/dassert.dart';
import 'package:test/expect.dart';

/// Utils for asserting string contains certain values
extension StringContainsMatcher on String {
  /// Asserts that the string includes the given [substring].
  /// The [substring] can be equal to the string.
  /// This matcher is case sensitive.
  /// To make this case insensitive use [shouldContainIgnoringCase]
  String shouldContainSubstring(String substring) => should(contains(substring));

  /// Asserts that the string contains the [substring] ignoring case.
  String shouldContainIgnoringCase(String substring) => should(
        TypeMatcher<String>().having(
          (p0) => p0.toLowerCase(),
          'contains ignoring case',
          contains(substring.toLowerCase()),
        ),
      );

  /// Asserts that the string contains the [substring] exactly once.
  String shouldContainExactlyOnce(String substring) => should(predicate(
      (String s) => s.contains(substring) && s.indexOf(substring) == s.lastIndexOf(substring),
      'should contain \'$substring\' exactly once'));

  /// Asserts that the string contains at least one digit.
  String shouldContainADigit() =>
      should(predicate((String input) => input.characters.any((char) => char.isDigit())));

  /// Asserts that the string contains only digits, or is empty.
  String shouldContainOnlyDigits() =>
      should(predicate((String input) => input.characters.every((char) => char.isDigit())));

  /// Asserts that the string starts with the given [prefix].
  /// The [prefix] can be equal to the string. This matcher is case sensitive.
  String shouldStartWith(String prefix) => should(predicate((String s) => s.startsWith(prefix)));

  /// Asserts that the string ends with the given [suffix].
  /// The [suffix] can be equal to the string. This matcher is case sensitive.
  String shouldEndWith(String suffix) => should(predicate((String s) => s.endsWith(suffix)));
}

extension _IsDigit on String {
  bool isDigit() => ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'].contains(this);
}
