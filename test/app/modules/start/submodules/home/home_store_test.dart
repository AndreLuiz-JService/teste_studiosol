import 'package:flutter_test/flutter_test.dart';
import 'package:teste_studiosol/app/modules/start/submodules/home/home_store.dart';
 
void main() {
  late HomeStore store;

  setUpAll(() {
    store = HomeStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}