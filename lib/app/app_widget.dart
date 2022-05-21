import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Smart App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
          primaryColor: Color(0xffA076F2),
          splashColor: Color(0xffA076F2),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              onSurface: Color(0xffA076F2),
              primary: Color(0xffA076F2)
            )
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: TextButton.styleFrom(
              onSurface: Color(0xffA076F2),
              primary: Color(0xffA076F2)
            )
          ),
          scaffoldBackgroundColor: const Color(0xffF7F7F7),
          appBarTheme: const AppBarTheme(
              toolbarHeight: 128,
              elevation: 1,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(32)))),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            elevation: 5,
            
            selectedIconTheme:
                IconThemeData(color: Color(0xffA076F2), size: 26),
            selectedLabelStyle: TextStyle(
              fontSize: 12,
            ),
            selectedItemColor: Color(0xffA076F2),
            unselectedItemColor: Color(0xff9E9E9E),

            unselectedLabelStyle: TextStyle(
              fontSize: 12,
              color: Color(0xff9E9E9E),
            ),
          )),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
