import 'package:flutter/material.dart';

class FavoritosPage extends StatefulWidget {
  final String title;
  const FavoritosPage({Key? key, this.title = 'Favoritos'}) : super(key: key);
  @override
  FavoritosPageState createState() => FavoritosPageState();
}
class FavoritosPageState extends State<FavoritosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}