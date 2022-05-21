import 'package:teste_studiosol/app/modules/start/start_Page.dart';
import 'package:teste_studiosol/app/modules/start/start_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_studiosol/app/modules/start/submodules/home/home_module.dart';

class StartModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => StartStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const StartPage(), children: [
      ModuleRoute('/Home/', module: HomeModule()),
      ModuleRoute('/Home/', module: HomeModule()),
    ]),
  ];
}
