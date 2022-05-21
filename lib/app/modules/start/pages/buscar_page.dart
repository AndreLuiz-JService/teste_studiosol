import 'package:flutter/material.dart';

class BuscarPage extends StatefulWidget {
  final String title;
  const BuscarPage({Key? key, this.title = 'Buscar'}) : super(key: key);
  @override
  BuscarPageState createState() => BuscarPageState();
}
class BuscarPageState extends State<BuscarPage> {
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