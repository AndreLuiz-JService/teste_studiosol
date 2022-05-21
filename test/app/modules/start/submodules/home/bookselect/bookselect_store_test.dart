import 'package:flutter_test/flutter_test.dart';
import 'package:teste_studiosol/app/modules/start/submodules/home/bookselect/bookselect_store.dart';
 
void main() {
  late BookselectStore store;

  setUpAll(() {
    store = BookselectStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}