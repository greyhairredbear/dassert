import 'package:dassert/dassert.dart';
import 'package:dassert/src/internal/should_fail.dart';
import 'package:glados/glados.dart';

void main() {
  Glados(any.nonEmptyLowercaseLetters)
      .test('should be lower case', (input) => input.shouldBeLowerCase());
  Glados(any.nonEmptyUppercaseLetters)
      .test('should be lower case fail', (input) => shouldFail(() => input.shouldBeLowerCase()));

  Glados(any.nonEmptyUppercaseLetters)
      .test('should be lower case', (input) => input.shouldBeUpperCase());
  Glados(any.nonEmptyLowercaseLetters)
      .test('should be lower case fail', (input) => shouldFail(() => input.shouldBeUpperCase()));
}
