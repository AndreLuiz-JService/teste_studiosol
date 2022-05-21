import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_studiosol/app/modules/start/pages/adicionar_page.dart';
import 'package:teste_studiosol/app/modules/start/pages/buscar_page.dart';
import 'package:teste_studiosol/app/modules/start/pages/favoritos_page.dart';
import 'package:teste_studiosol/app/modules/start/start_store.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key? key, this.title = 'StartPage'}) : super(key: key);
  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  final StartStore store = Modular.get();

  @override
  void initState() {
    log('teste');
    Modular.to.navigate('/Home/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: store.pageViewController,
        children: const [
          RouterOutlet(),
          AdicionarPage(),
          BuscarPage(),
          FavoritosPage(),
        ],
      ),
      bottomNavigationBar: Container(
        child: AnimatedBuilder(
            animation: store.pageViewController,
            builder: (context, snapshot) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: store.pageViewController.page?.round() ?? 0,
                onTap: (index) {
                 
                  store.pageViewController.jumpToPage(
                    index,
                  );
                },
                items: const [
                  BottomNavigationBarItem(
                      backgroundColor: Colors.white,
                      icon: Icon(Icons.home_filled),
                      label: 'Inicio'),
                  BottomNavigationBarItem(
                      backgroundColor: Colors.white,
                      icon: Icon(Icons.add_circle),
                      label: 'adicionar'),
                  BottomNavigationBarItem(
                      backgroundColor: Colors.white,
                      icon: Icon(Icons.search),
                      label: 'Buscar'),
                  BottomNavigationBarItem(
                      backgroundColor: Colors.white,
                      icon: Icon(Icons.favorite),
                      label: 'favoritos'),
                ],
              );
            }),
      ),
    );
  }
}
