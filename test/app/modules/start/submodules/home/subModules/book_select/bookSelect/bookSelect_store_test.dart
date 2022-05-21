import 'package:flutter_test/flutter_test.dart';
import 'package:teste_studiosol/app/modules/start/submodules/home/subModules/book_select/bookSelect/bookSelect_store.dart';
 
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