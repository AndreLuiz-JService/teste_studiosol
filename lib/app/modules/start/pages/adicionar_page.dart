import 'package:flutter/material.dart';

class AdicionarPage extends StatefulWidget {
  final String title;
  const AdicionarPage({Key? key, this.title = 'Adicionar'}) : super(key: key);
  @override
  AdicionarPageState createState() => AdicionarPageState();
}
class AdicionarPageState extends State<AdicionarPage> {
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