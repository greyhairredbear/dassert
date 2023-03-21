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
      (String actual) =>
          actual.contains(substring) && actual.indexOf(substring) == actual.lastIndexOf(substring),
      'should contain \'$substring\' exactly once'));

  /// Asserts that the string contains at least one digit.
  String shouldContainADigit() =>
      should(predicate((String input) => input.characters.any((char) => char.isDigit())));

  /// Asserts that the string contains only digits, or is empty.
  String shouldContainOnlyDigits() =>
      should(predicate((String input) => input.characters.every((char) => char.isDigit())));
}

extension _IsDigit on String {
  bool isDigit() => ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'].contains(this);
}
