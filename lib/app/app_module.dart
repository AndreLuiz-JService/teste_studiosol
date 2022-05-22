
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_studiosol/app/modules/start/start_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: StartModule()),
  ];

}