import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_studiosol/app/modules/start/submodules/home/subModules/book_select/bookSelect/bookSelect_module.dart';
 
void main() {

  setUpAll(() {
    initModule(BookSelectModule());
  });
}