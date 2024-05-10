import 'package:flutter_learn/beyond_ui/testing_debugging/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test start, increment, decrement', () {
    test('value should start at 0', () {
      expect(Counter().value, 0);
    });
    test('value should be incremented', () {
      final counter = Counter();
      counter.incremented();
      expect(counter.value, 1);
    });
    test('value should be decremented', () {
      final counter = Counter();
      counter.decremented();
      expect(counter.value, -1);
    });
  });
}
