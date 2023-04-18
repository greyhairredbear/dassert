import 'package:characters/characters.dart';
import 'package:glados/glados.dart';

const emptyString = '';
final randomChar = any.choose('abcdefGHIJKLMNOPqrstuvwXYZ123456790!@#^&*()-='.characters.toList());
final randomDigit = any.choose('0123456789'.characters.toList());
final randomNonZeroDigit = any.choose('123456789'.characters.toList());
