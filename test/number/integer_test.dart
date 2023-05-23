import 'package:dassert/src/public/number/integer.dart';
import 'package:glados/glados.dart';

void main() {
  Glados(any.int).test('even', (input) => input._previousEven().shouldBeEven());
  Glados(any.int).test('odd', (input) => (input._previousEven() + 1).shouldBeOdd());
  test('zero', () => 0.shouldBeEven());
}

extension _PreviousEven on int {
  int _previousEven() {
    return (this ~/ 2) * 2;
  }
}
