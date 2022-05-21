import 'package:flutter_test/flutter_test.dart';
 
void main() {
  late BookSelectStore store;

  setUpAll(() {
    store = BookSelectStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}